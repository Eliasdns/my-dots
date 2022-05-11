# --- From zsh-users ---
# Depends: zaw(zaw-git), zsh-syntax-highlighting, zsh-autosuggestions, zsh-history-substring-search
# Recommends: zsh-completions
source /usr/share/zaw/zaw.zsh

### Plugins section: Enable fish style features
## Use autosuggestion:
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
## Use syntax highlighting:
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## Use history substring search:
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh


# --- oh-my-zsh ---
# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh/"
#export ZSH="/opt/oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins+=(
	# Depends: Alguma Distro
	#debian ubuntu archlinux suse dnf yum 
	archlinux 
)

# Disable auto-updates on Arch
zstyle ':omz:update' mode disabled


# --- zplug ---
# Depends: zplug
source /usr/share/zsh/scripts/zplug/init.zsh
#source /usr/share/zplug/init.zsh
