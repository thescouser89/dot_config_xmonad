#!/bin/sh
#
# by lyon8 (lyon8@gmx.net)
# show your laptop battery state in dzen
 
BG='#000'  # dzen backgrounad
FG='#999'  # dzen foreground
W=150     # width of the dzen bar
GW=50      # width of the gauge
GFG='#999'  # color of the gauge
GH=7       # height of the gauge
GBG='#333'  # color of gauge background
X=0       # x position
Y=1036    # y position
FN='fixed' # font
 
# STATEFILE='/proc/acpi/battery/BAT1/state' # battery's state file
# INFOFILE='/proc/acpi/battery/BAT1/info'   # battery's info file
 
SUSPEND=7
CRITICAL=10
LOWBAT=25      # percentage of battery life marked as low
HIGHBAT=80     # percentage marked as high
LOWCOL='#ff4747' # color when battery is low
TIME_INT=1         # time intervall in seconds

LOWBATIND='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/bat_empty_01.xbm)'
MIDBATIND='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/bat_low_01.xbm)' # caption (also icons are possible)
HIGHBATIND='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/bat_full_01.xbm)'
ACIND='^i(/home/dustin/.xmonad/xbm_icons/dzen3/xbm8x8/ac_01.xbm)'
#while true; do
# look up battery's data
# BAT_FULL=`cat $INFOFILE|grep last|cut -d " " -f 9`;
# STATUS=`cat $STATEFILE|grep charging|cut -d " " -f 12`;
# RCAP=`cat $STATEFILE|grep remaining|cut -d " " -f 8`;
# calculate remaining power
# RPERCT=`expr $RCAP \* 100`;
# RPERC=`expr $RPERCT / $BAT_FULL`;
ACPI=`acpi -b`
# if one of the sed commands could not do the substitution, it will still output what was input. That's what I use. So those sed commands
# take care of whether it's charging or discharging
RPERC=`echo ${ACPI} | sed "s/Battery 0://" | sed "s/%//" | sed "s/Discharging, //" | sed "s/Unknown, //" | sed "s/Charging, //" | sed "s/,.*$//"`
STATUS=`acpi -a | sed "s/Adapter 0: //"`
# draw the bar and pipe everything into dzen
if [ "$STATUS" = "on-line" ]; then PREBAR=$ACIND 
elif [ "$RPERC" -le "$SUSPEND" ]; then uptime | wall; sudo systemctl suspend & sleep 20
    # send pm-suspend command to background and sleep for 20 seconds
elif [ "$RPERC" -le "$CRITICAL" ]; then notify-send "Battery Critically Low!"  "Plug AC Now"
elif [ "$RPERC" -le "$LOWBAT" ]; then GFG=$LOWCOL
	PREBAR=$LOWBATIND
elif [ "$RPERC" -le "$HIGHBAT" ]; then PREBAR=$MIDBATIND
else PREBAR=$HIGHBATIND
fi
echo -n $PREBAR
echo -n "$RPERC% "
eval echo $RPERC | gdbar -s o -fg $GFG -bg $GBG -ss 1 -sw 2 -nonl -w $GW
# -h $GH -w $GW 
#sleep $TIME_INT;
#done 
