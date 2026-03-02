#!/bin/bash

make_tar_bkp() {
    if [ "$1" = "--help" -o "$1" = "-h" ]; then
        echo "Usage: $0 <source path 1> [<source path 2>...] <destination dir>"
        return 0
    elif [ -z $1 ]; then
      echo Pass one or more backup source paths as the first arguments!
      exit 1
    fi
    if [ -z $2 ]; then
      echo Pass the backup destination dir as the last argument!
      exit 1
    fi

    src_paths=()
    for i in "${@:1:$#-1}"; do
        src_paths+=("${i%/}")
    done
    _src_paths_filenames=()
    for i in "${src_paths[@]}"; do
        _src_paths_filenames+="${i##*/}-"
    done

    dst_dir=${@: -1}
    dst_filename="${_src_paths_filenames[@]}-$(date '+%Y_%m_%d_%H%M').tar.gz"

    echo "[*] Running: mkdir -p" "$dst_dir"
    mkdir -p "$dst_dir"
    echo "[*] Running: tar -czvf" "$dst_dir/$dst_filename" "${src_paths[@]}"
    tar -czvf "$dst_dir/$dst_filename" "${src_paths[@]}"
}

make_tar_bkp $@

