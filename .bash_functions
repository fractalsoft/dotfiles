#
function run() {
  number=$1
  shift
  for n in $(seq $number); do
    echo "$n. of $number"
    $@
  done
}

# get current network info (ip, mac, netmask, broadcast, interface)
function get_network()
{
  COMMAND=ifconfig
  if [ -z `command -v $COMMAND` ]; then
    echo "You should install $COMMAND"
    return
  fi
  local CMD=`which $COMMAND`
  local PARAMS=${2:-eth0}
  local RESULT=""
  case $1 in
    interface ) local RESULT="$($CMD -a | awk '/Link encap/ {print $1}' | tr -s '\n' ':')" ;;
    ip ) local RESULT="$($CMD $PARAMS | awk '/inet addr/ {print $2}' | awk -F: '{print $2}')" ;;
    mac ) local RESULT="$($CMD -a $PARAMS | awk '/HWaddr/ {print $NF}')" ;;
    netmask ) local RESULT="$($CMD $PARAMS | awk '/inet addr/ {print $NF}' | awk '/Mask/' | awk -F: '{print $2}')" ;;
    broadcast ) local RESULT="$($CMD $PARAMS | awk '/inet addr/ {print $3}' | awk '/Bcast/' | awk -F: '{print $2}')" ;;
    * ) local RESULT="" ;;
  esac
  if [ -z $RESULT ]
  then
    echo "Usage: get_network {interface,ip,mac,netmask,broadcast} [interface]"
  else
    echo $RESULT
  fi
}

# radio player
function radio_console()
{
  PLAYER=mplayer
  if command -v $PLAYER >/dev/null; then
    local URI=""
    case $1 in
      bbc1 ) local URI=mms://wmlive.bbc.net.uk/wms/bbc_ami/radio1/radio1_bb_live_int_eq1_sl0 ;;
      bbc2 ) local URI=mms://wmlive.bbc.net.uk/wms/bbc_ami/radio2/radio2_bb_live_int_eq1_sl0 ;;
      bbc3 ) local URI=mms://wmlive.bbc.net.uk/wms/bbc_ami/radio3/radio3_bb_live_int_eq1_sl0 ;;
      bbc4 ) local URI=mms://wmlive.bbc.net.uk/wms/bbc_ami/radio4/radio4_bb_live_int_eq1_sl0 ;;
      bbc5 ) local URI=mms://wmlive.bbc.net.uk/wms/bbc_ami/radio5/radio5_bb_live_int_eq1_sl0 ;;
      program1 ) local URI=mms://stream.polskieradio.pl/program1 ;;
      program2 ) local URI=mms://stream.polskieradio.pl/program2 ;;
      program3 ) local URI=mms://stream.polskieradio.pl/program3 ;;
      program4 ) local URI=mms://stream.polskieradio.pl/program4 ;;
      *) local URI="" ;;
    esac
    if [ -z $URI ]
    then
      echo "Usage: radio_console {bbc1,bbc2,bbc3,bbc4,bbc5,program1,program2,program3,program4}"
    else
      $PLAYER -cache 128 -loop 0 $URI
    fi
  else
    echo "You should install $PLAYER"
  fi
}

# search text in files
function include()
{
  if [ -z $* ]; then
    echo "Usage: include TEXT"
    return
  fi
  MASK=*
  TEXT=$1
  echo "Searching /$TEXT/ in $MASK"
  find . -name "$MASK" -print | xargs grep --color=auto -iRn "$TEXT"
}

# top 10 (or more/less) commands
function top_commands()
{
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head $1
}

# get gateway
function gateway()
{
  array=( route netstat )
  local COMMAND=""
  for cmd in "${array[@]}"
  do
    if [ ! -z `command -v $cmd` ]; then
      COMMAND=$cmd
      break
    fi
  done
  local CMD=""
  case $COMMAND in
    route ) local CMD="$COMMAND -n" ;;
    netstat ) local CMD="$COMMAND -r" ;;
    *) echo "You should install iproute"; return ;;
  esac
  $CMD | awk '/UG/ {print $2}'
}

function mask2num()
{
  echo obase=2.$1|tr . \;|bc|tr -d 0\\n|wc -c
}

# what hosts are up
function hosts()
{
  INTERFACES=`get_network interface`
  NETMASK=`get_network netmask`
  # NETMASK=`get_network netmask wlan0`
  BITS=`mask2num $NETMASK`
  GATEWAY=`gateway`
  echo "It maybe take a while..."
  nmap -sP $GATEWAY/$BITS
}

function gg()
{
  local REGEXP=""
  git grep $REGEXP $(git rev-list --all)
}

function postgis_version()
{
  echo `psql $1 -tAc "select postgis_full_version();"`
}
