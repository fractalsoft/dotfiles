none='\e[0m'
red='\e[0;31m'
green='\e[0;32m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
gray='\e[0;37m'
light_red='\e[1;31m'
light_green='\e[1;32m'
yellow='\e[1;33m'
light_blue='\e[1;34m'
light_purple='\e[1;35m'
white='\e[1;37m'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$([[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*")]/"
}

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

user=$light_red
at=$cyan
host=$light_blue
path=$light_green
branch=$yellow
prompt=$green
# \u - user | \h - host | \w - path | \$ - prompt (# for root) | \t - time
export PS1="${debian_chroot:+($debian_chroot)}\[$user\]\u\[$at\]@\[$host\]\h\[$path\] \w\[$branch\]\$(declare -F __git_ps1 &>/dev/null && __git_ps1 \" (%s)\") \[$prompt\]\$\[$none\] "
export PS2='> '
