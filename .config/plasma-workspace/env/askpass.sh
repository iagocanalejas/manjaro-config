#!/bin/sh

eval $(ssh-agent)

export SSH_ASKPASS='/usr/bin/ksshaskpass'
export GIT_ASKPASS='/usr/bin/ksshaskpass'

/usr/bin/ssh-add