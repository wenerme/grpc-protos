.PHONY: ci gen sync

ci: sync

scripts/sync.sh: scripts/gen.ts sources.yaml
	pnpm tsx scripts/gen.ts

gen: scripts/sync.sh

sync: README.md gen README.md
	bash scripts/sync.sh

repo.md: gen
README.md: repo.md scripts/sync-readme.sh
	bash scripts/sync-readme.sh
