#!/bin/sh

make_tar_bkp() {
    if [ "$1" = "--help" -o "$1" = "-h" ]; then
        echo "Usage: $0 <destination dir> <origin path>"
        return 0
    elif [ -z $1 ]; then
      echo Pass the backup destination dir as first argument!
      exit 1
    fi
    if [ -z $2 ]; then
      echo Pass the backup origin path as second argument!
      exit 1
    fi

    orig_path=$2
    _orig_path_real=$(realpath "$orig_path")

    # dest_dir=$(dirname "$0")/bkp
    dest_dir=$1
    dest_filename="${_orig_path_real##*/}-$(date '+%Y_%m_%d_%H%M').tar.gz"

    mkdir -p "$dest_dir"
    tar -czvf "$dest_dir/$dest_filename" "$orig_path"
}

make_tar_bkp $@
