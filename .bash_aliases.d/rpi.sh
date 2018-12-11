# ~/.bash_aliases.d/rpi.sh

if [ "$(uname)" != "Linux" ]; then
    return
fi

if [ ! -r "/proc/cpuinfo" ]; then
    return
fi

if [ "$(grep '^Hardware' /proc/cpuinfo | cut -d: -f2 | tr -d ' \t')" != "BCM2835" ]; then
    return;
fi


temp(){
	cat /sys/class/thermal/thermal_zone0/temp
}

htemp(){
	#sudo smartctl -A /dev/sda | grep Temperature_Celsius | awk '{print $10}'
	sudo smartctl -A /dev/sda -d sat | fgrep Temperature_Celsius | awk '{print $10}'
}
