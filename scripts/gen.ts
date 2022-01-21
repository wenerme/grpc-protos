import * as YAML from "https://deno.land/std@0.63.0/encoding/yaml.ts";

interface SourceOptions {
  enabled: boolean;
  repo: string;
  url: string;
  git: string;
  sync: Record<string, SyncOptions>;
  dir: string;
  tags: string[];
}
interface SourceConf {
  enabled?: boolean;
  repo: string;
  url?: string;
  git?: string;
  sync: Record<string, SyncOptions | string>;
  dir?: string;
  tags?: string[] | string;
}
interface SyncOptions {
  dir: string;
  flags?: string[];
  exclude?: string[];
  delete?: boolean;
}

let srcs = ((await YAML.parse(Deno.readTextFileSync("./sources.yaml"))) as SourceConf[]).map(normalize);

let script = [
  `
#!/usr/bin/env bash
set -euxo pipefail`.trim(),
  srcs.map(genSyncSource).join("\n\n"),
  `git add .`,
  "",
];
await Deno.writeTextFile("scripts/sync.sh", script.join("\n"));
await Deno.writeTextFile("gen.yaml", YAML.stringify(srcs));

srcs = srcs.sort((a, b) => a.repo.localeCompare(b.repo));
await Deno.writeTextFile(
  "repo.md",
  `
repo | stats | tags
---|---|---
${srcs.map(genRepoTableRow).join("\n")}
`
);

function genRepoTableRow({ repo, url, tags }: SourceOptions) {
  return `[${repo}](${url}) | ![stars](https://img.shields.io/github/stars/${repo}) | ${tags.join(" ,")}`;
}
function genSyncSource(src: SourceOptions) {
  const { repo, git, dir, sync, enabled } = src;

  const exec = [
    enabled === false ? "if false; then" : "",
    `echo -e "\\n# synching ${repo}"`,
    // `[ ! -e ${dir} ] || git -C ${dir} remote set-url origin ${git}`,
    `[ ! -e ${dir} ] || git -C ${dir} pull`,
    `[ -e ${dir} ] || git clone --depth 10 ${git} ${dir}`,
    `mkdir -p ${Object.values(sync)
      .map((v) => v.dir)
      .join(" ")}`,
    ...Object.entries(sync).flatMap(([k, v]) => genSync(k, v, src)),
    enabled === false ? "fi" : "",
  ].filter(Boolean);

  return exec.join("\n");
}

function genSync(src: string, s: SyncOptions, so: SourceOptions) {
  const { dir } = so;
  const from = `${dir}/${src}`;
  let sync = `rsync -avm `;
  sync = `${sync} ${s.flags?.join(" ") ?? ""} `;
  sync = `${sync} --include '*/' --include '*.proto' --include 'README.md' --exclude="*"`;
  return [`test -e ${from}`, `${sync} ${from} ${s.dir}`, `test -z "$(find ${s.dir} -maxdepth 0 -empty)"`];
}

function normalize(c: SourceConf): SourceOptions {
  const { repo, sync } = c;
  const o: SourceOptions = {
    enabled: true,
    dir: `gits/${repo}`,
    url: `https://github.com/${repo}`,
    git: `git@github.com:${repo}.git`,
    ...c,
    tags: Array.isArray(c.tags) ? c.tags : (c.tags ?? "").split(/\s*,\s*/),
    sync: Object.fromEntries(
      Object.entries(sync).map(([k, v]) => {
        if (typeof v === "string") {
          v = { dir: v };
        }
        v.flags ??= [];
        if (v.delete !== false) {
          v.flags.push("--delete --delete-excluded");
        }
        v.flags = v.flags.concat(v.exclude?.map((v) => `--exclude '${v}'`) ?? []);
        return [k, v];
      })
    ),
  };
  return o;
}
