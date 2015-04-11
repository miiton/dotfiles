source /Users/t_minami/.pythonbrew/etc/bashrc
stty stop undef
alias grep='grep --color=auto'
alias ls='ls -G'

export HISTTIMEFORMAT='%F %T # '
export HISTSIZE=2000
export HISTFILESIZE=2000
export NODE_PATH=/usr/local/lib/node_modules

#Titanium builder
alias ti='~/Library/Application\ Support/Titanium/mobilesdk/osx/1.8.2/iphone/builder.py'

export PATH=$PATH:~/Dropbox/Library/vertx/bin

export PATH=$PATH:/Applications/MacVim.app/Contents/MacOS

export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:~/Dropbox/bin
export PATH=$PATH:/Applications/Julia-0.2.0.app/Contents/Resources/julia/bin
export GOROOT=`go env GOROOT`
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export R_USER=$HOME

alias titanium="~/Library/Application\ Support/Titanium/mobilesdk/osx/2.1.1.GA/titanium.py"
export PATH=/usr/local/bin:$PATH

# added by Miniconda3 3.0.0 installer
export PATH="/Users/t_minami/miniconda3/bin:$PATH"
export DOCKER_HOST=tcp://127.0.0.1:4243

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
