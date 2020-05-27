#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

sf=0
while :
do
if [ $sf -eq 1 ]
then
service call SurfaceFlinger 1008 i32 1
break
else
sf=$(service list | grep -c "SurfaceFlinger")
sleep 2
fi
done
