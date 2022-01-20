import { YamlLoader } from "https://deno.land/x/yaml_loader/mod.ts";
import * as YAML from "https://deno.land/std@0.63.0/encoding/yaml.ts";

interface SourceOptions {
  repo: string;
  url: string;
  git: string;
  sync: Record<string, SyncOptions>;
  dir: string;
}
interface SourceConf {
  repo: string;
  url?: string;
  git?: string;
  sync: Record<string, SyncOptions | string>;
  dir?: string;
}
interface SyncOptions {
  dir: string;
  flags?: string[];
  exclude?: string[];
  delete?: boolean;
}

let srcs = (
  (await YAML.parse(Deno.readTextFileSync("./sources.yaml"))) as SourceConf[]
).map(normalize);

let script = [
  `
#!/usr/bin/env bash
set -euxo pipefail`.trim(),
  srcs.map(genSync).join("\n\n"),
  `git add .`,
  '',
];
await Deno.writeTextFile("scripts/sync.sh", script.join("\n"));
await Deno.writeTextFile("gen.yaml", YAML.stringify(srcs));

srcs = srcs.sort((a, b) => a.repo.localeCompare(b.repo));
await Deno.writeTextFile(
  "REPO.md",
  `
repo | stats
---|---
${srcs.map(genRepoTableRow).join("\n")}
`
);

function genRepoTableRow({ repo, url }: SourceOptions) {
  return `[${repo}](${url}) | ![stars](https://img.shields.io/github/stars/${repo})`;
}
function genSync(src: SourceOptions) {
  const { repo, git, dir, sync } = src;

  const exec = [
    `echo -e "\\n# synching ${repo}"`,
    // `[ ! -e ${dir} ] || git -C ${dir} remote set-url origin ${git}`,
    `[ ! -e ${dir} ] || git -C ${dir} pull`,
    `[ -e ${dir} ] || git clone --depth 50 ${git} ${dir}`,
    `mkdir -p ${Object.values(sync)
      .map((v) => v.dir)
      .join(" ")}`,
    ...Object.entries(sync).map(([src, s]) => {
      let sync = `rsync -avm `;
      sync = `${sync} ${s.flags?.join(" ") ?? ""} `;
      sync = `${sync} --include '*/' --include '*.proto' --include '*.md' --exclude="*"`;
      return `${sync} ${dir}/${src} ${s.dir}`;
    }),
  ];

  return exec.join("\n");
}

function normalize(c: SourceConf): SourceOptions {
  const { repo, sync } = c;
  const o: SourceOptions = {
    dir: `gits/${repo}`,
    url: `https://github.com/${repo}`,
    git: `git@github.com:${repo}.git`,
    ...c,
    sync: Object.fromEntries(
      Object.entries(sync).map(([k, v]) => {
        if (typeof v === "string") {
          v = { dir: v };
        }
        v.flags ??= [];
        if (v.delete !== false) {
          v.flags.push("--delete --delete-excluded");
        }
        v.flags = v.flags.concat(
          v.exclude?.map((v) => `--exclude '${v}'`) ?? []
        );
        return [k, v];
      })
    ),
  };
  return o;
}
