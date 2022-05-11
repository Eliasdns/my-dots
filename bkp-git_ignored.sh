#!/bin/sh
# Backup the files ignored by git

exclude="\.bkp/.*"
dir=$(dirname "$0")/.bkp

pushd "$dir/.." 1>/dev/null 2>&1

git ls-files --others --ignored --exclude-standard | egrep -v "$exclude" | tar -czvf "$dir/gitignored-$(date '+%Y_%m_%d_%H%M').tar.gz" --verbatim-files-from --files-from=-

popd 1>/dev/null 2>&1
unset exclude
unset dir

