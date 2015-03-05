# PATH var
export PATH=$HOME/.node/bin:$HOME/.ruby/default/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Homebrew path
export PATH=${HOME}/homebrew/bin:${PATH}

# Turn off setting so git won't ask for commit message on merge
export GIT_MERGE_AUTOEDIT=no

# Change default installation for ruby gems
export GEM_HOME=$HOME/.ruby/default

# Custom Aliases
alias ..="cd .."
alias bp="source ~/.bash_profile"
alias gs="git st"
alias la="ls -la"

# Show/hide hidden files
alias showhiddenfiles="defaults write com.apple.Finder AppleShowAllFiles TRUE && killall Finder && open /System/Library/CoreServices/Finder.app"
alias hidehiddenfiles="defaults write com.apple.Finder AppleShowAllFiles FALSE && killall Finder && open /System/Library/CoreServices/Finder.app"

##
# Bash completion scripts
##

if type brew > /dev/null 2>&1 && [ -f `brew --prefix`/etc/bash_completion ]; then
  # Homebrew: http://mxcl.github.com/homebrew/
  . `brew --prefix`/etc/bash_completion
fi

# This is what brew says to add here, looks a lot like 27-30
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
# fi

if [ -f /contrib/completion/git-completion.bash ]; then
  # Git OS X Installer: http://code.google.com/p/git-osx-installer/
  . /contrib/completion/git-completion.bash
elif type brew > /dev/null 2>&1 && [ -f `brew --prefix`/etc/bash_completion ]; then
  # Homebrew: http://mxcl.github.com/homebrew/
  . `brew --prefix`/etc/bash_completion
elif [ -f /opt/local/etc/bash_completion.d/git ]; then
  # MacPorts: http://www.macports.org/
  . /opt/local/etc/bash_completion.d/git
fi

##
# Shell colors
##
BLACK="\[\e[0;30m\]"  BOLD_BLACK="\[\e[1;30m\]"  UNDER_BLACK="\[\e[4;30m\]"
RED="\[\e[0;31m\]"    BOLD_RED="\[\e[1;31m\]"    UNDER_RED="\[\e[4;31m\]"
GREEN="\[\e[0;32m\]"  BOLD_GREEN="\[\e[1;32m\]"  UNDER_GREEN="\[\e[4;32m\]"
YELLOW="\[\e[0;33m\]" BOLD_YELLOW="\[\e[1;33m\]" UNDER_YELLOW="\[\e[4;33m\]"
BLUE="\[\e[0;34m\]"   BOLD_BLUE="\[\e[1;34m\]"   UNDER_BLUE="\[\e[4;34m\]"
PURPLE="\[\e[0;35m\]" BOLD_PURPLE="\[\e[1;35m\]" UNDER_PURPLE="\[\e[4;35m\]"
CYAN="\[\e[0;36m\]"   BOLD_CYAN="\[\e[1;36m\]"   UNDER_CYAN="\[\e[4;36m\]"
WHITE="\[\e[0;37m\]"  BOLD_WHITE="\[\e[1;37m\]"  UNDER_WHITE="\[\e[4;37m\]"
NO_COLOR="\[\e[0m\]"

##
# Git shell prompt
# requires Git bash completion to be installed
##
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

source `xcode-select --print-path`/usr/share/git-core/git-completion.bash
source `xcode-select --print-path`/usr/share/git-core/git-prompt.sh

export PS1="${CYAN}\u@\h${WHITE}[${YELLOW}\w${WHITE}]\$(__git_ps1 '${WHITE}[${BOLD_GREEN}%s${BOLD_RED}'\$(parse_git_dirty)'${WHITE}]')${WHITE}${NO_COLOR} $ "
export PS2=" > "
export PS4=" + "
