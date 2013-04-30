#:!/bin/bash
# little dzen-thingy to control your volume
# you need amixer (or aumix) and gdbar
# (c) 2007 Tom Rauchenwald and Jochen Schweizer
 
BG='#000'     # dzen backgrounad
FG='#888'     # dzen foreground
W=150         # width of the dzen bar
GW=50         #  width of the volume gauge
GFG='#a813f5' # color of the gauge
GH=7          # height of the gauge
GBG='#333'    # color of gauge background
X=680         # x position
Y=786         # y position
 # Caption of the gauge
# in this case it displays the volume icon shipped with dzen
SOUND='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/spkr_01.xbm)'
NOSOUND='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/spkr_02.xbm)'
# Font to use
FN='-xos4-terminus-*-*-*-*-12-*-*-*-*-*-*-*'
 
# command to increase the volume
#CI="amixer -c0 sset PCM 5dB+ >/dev/null"
#CI="aumix -v +5"
# command to decrease the volume
#CD="amixer -c0 sset PCM 5dB- >/dev/null"
#CD="aumix -v -5
 
# command to pipe into gdbar to display the gauge
# should print out 2 space-seperated values, the first is the current
# volume, the second the maximum volume
MAX=`amixer -c0 get PCM | awk '/^  Limits/ { print $5 }'`
#MAX=100
CV="amixer -c0 get PCM | awk '/^  Front Left/ { print \$4 \" \" $MAX }'"
#CV="aumix -q | line | cut -d \" \" -f 3"
ISNOTMUTE=`amixer -c0 sget Master| grep Mono: | awk '{print $6}'| sed -e 's/^.//' -e 's/.$//'`
ISZERO=`amixer -c0 sget PCM | grep "Front Left:" | awk '{print $4}'`
#while true; do
if [ "$ISNOTMUTE" = "off" ]; then 
	CAPTION=$NOSOUND
elif [ "$ISZERO" = "0" ]; then
	CAPTION=$NOSOUND
else CAPTION=$SOUND
fi
    echo -n "$CAPTION "
    echo -n "$(($ISZERO * 100 / $MAX))% "
    eval "$CV" | gdbar -s o -fg $GFG -bg $GBG -ss 1 -sw 2 -nonl -w $GW
# -h $GH -w $GW
#    sleep 1;
#done 
