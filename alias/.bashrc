export JAVA_HOME='/home/armsword/jdk1.8.0_152'
export M2_HOME='/home/armsword/apache-maven-3.5.2'
export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

alias tmuxn="tmux new-session -s"
alias tmuxl="tmux ls"
alias tmuxk="tmux kill-session -t"
alias tmuxa="tmux a -t"
alias emacs="emacs -nw"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
