#!/usr/bin/env bash

cles=("ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDc+e2L7GFcoWgE2qhVpQmBq2jiCZtXj1vIpFG/+N7Yw TP04" \
"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDTmcTDOeX8kpWiEdYFfhCkk+Bg+s1BeMvqlywfruF2v Temp01"
)

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys

for cle in "${cles[@]}"
do
  echo "${cle}" >> ~/.ssh/authorized_keys
done
sort -u -o ~/.ssh/authorized_keys ~/.ssh/authorized_keys
if [ -L ~/.ssh/authorized_keys -a -f ~/.ssh/authorized_keys2 ] ; then rm ~/.ssh/authorized_keys && mv ~/.ssh/authorized_keys2 ~/.ssh/authorized_keys ; fi
if [ ! -e ~/.ssh/authorized_keys2 ] ; then ln -s ~/.ssh/authorized_keys ~/.ssh/authorized_keys2 ; fi
find ~/.ssh/ -type f -exec chmod 600 {} \;; find ~/.ssh/ -type d -exec chmod 700 {} \;
