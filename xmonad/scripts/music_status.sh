#!/bin/bash
 
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
PLAY='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/play.xbm)'
PAUSE='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/pause.xbm)'
STOP='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/stop.xbm)'

 
# command to pipe into gdbar to display the gauge
# should print out 2 space-seperated values, the first is the current
# volume, the second the maximum volume
SONG=`mpc | head -n1`
#while true; do
#if [ $ISNOTMUTE = "off" ]; then 
#	CAPTION=$NOSOUND
#elif [ $ISZERO = "0" ]; then
#	CAPTION=$NOSOUND
#else CAPTION=$SOUND
#fi
ISSTOPPED=`mpc | head -n1 | awk '{print $1}'` 
ISPAUSED=`mpc | head -n2 | grep -e "paused" -e "playing" | awk '{print $1}' | sed -e 's/^.//' -e 's/.$//'`
#echo -n $ISPAUSED
if [ "$ISSTOPPED" = "volume:" ]; then
    CAPTION=$STOP
	OUT=""
elif [ "$ISPAUSED" = "paused" ]; then
	CAPTION=$PAUSE
	OUT=$SONG
else 
	CAPTION=$PLAY
	OUT=$SONG
fi
    echo -n  $CAPTION "^fg(white)" $OUT
#    sleep 1;
#done 
