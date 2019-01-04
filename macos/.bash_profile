# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# setting for peco
export HISTCONTROL="ignoredups"
peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi
    else
        history -d $((HISTCMD-1))
    fi
}
bind -x '"\C-r":peco-history'

# go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
