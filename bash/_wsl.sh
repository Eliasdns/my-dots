# --- Env Vars ---
#export DISPLAY="127.0.0.1:0"
#export DISPLAY="192.168.1.10:0"
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit}'):0
#export XAUTHORITY="$HOME/.Xauthority"
export LIBGL_ALWAYS_INDIRECT=1

export GIT_SSH="ssh.exe"

append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}
append_path "/mnt/c/Windows/System32/OpenSSH/"
unset -f append_path
export PATH


# --- Aliases ---
#alias lping="ping $(ifconfig eth0 | sed -n '2 p' | awk '{print $2}')"

# cmd.exe
alias cmd='/mnt/c/Windows/System32/cmd.exe'
alias cmdk='/mnt/c/Windows/System32/cmd.exe /k cd "%USERPROFILE%"'
alias cmdc='/mnt/c/Windows/System32/cmd.exe /c'

# Desktop Environment
# alias xfce='startxfce4 >/dev/null 2>&1 &'
# alias xfce='dbus-launch --exit-with-session xfce4-session &'
alias xfce='pushd ~; dbus-launch --exit-with-session xfce4-session &; popd'


# --- Functions ---
wcd ()  {
    cd "$(wslpath -a $1)"
}


# --- Commands ---
# Automount shared filesystem from VHDX
# https://github.com/microsoft/WSL/issues/5851
# https://github.com/microsoft/WSL/issues/5177
# https://github.com/microsoft/WSL/issues/4577#issuecomment-545192865
[ ! -d /mnt/wsl/wsl_shared ] && wsl.exe --mount C:\\PASTAS_WIN\\Storages\\WSL\\wsl_shared.vhdx --vhd --partition 1 --type btrfs --options 'noatime,discard=async,ssd' --name wsl_shared > /dev/null

