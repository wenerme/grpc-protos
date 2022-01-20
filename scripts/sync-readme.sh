#!/usr/bin/env bash
set -e

lead='^<!-- BEGIN REPO -->'
tail='^<!-- END REPO -->'
sed -e "/$lead/,/$tail/{ /$lead/{p; r repo.md
}; /$tail/p; d }" -i README.md
