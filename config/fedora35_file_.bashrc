# Comandos customizados para a vm

alias   dcl='sudo docker container ls -a'
alias   dci='sudo docker container inspect $1'
alias  dcrf='sudo docker container rm $1 --force'
alias dcrfa='sudo docker container rm $(sudo docker container ls -qa) --force'
alias   dil='sudo docker image ls -a'
alias   dii='sudo docker image inspect $1'
alias  dirf='sudo docker image rm $1 --force'
alias dirfa='sudo docker image rm $(sudo docker image ls -qa) --force'