add_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
	    PATH="$1${PATH:+:$PATH}"
    esac
}


if [ -d "$HOME/.local/share/mise/shims" ] ; then
    add_path "$HOME/.local/share/mise/shims"
    export PATH
fi

unset -f add_path
