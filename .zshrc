# alias
alias k="kubectl"
alias g="git"
alias a="cd .."
alias aa="cd ../.."
alias aaa="cd ../../.."
alias aaaa="cd ../../../.."

# starship
eval "$(starship init zsh)"

# peco history
# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Java
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$PATH

# go
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
export GOPATH=$HOME/go

# ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# readline lib
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# The next line updates PATH for the Google Cloud SDK.
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
