#!/bin/bash

URL=http://metservice.intnet.mu/warning-bulletin-special-weather.php


#Warning Communique pale blue
result=`curl -Ls $URL | grep -oP '<span style="color:#4A7FBB"[^*]+' |sed -e 's/<[^>]*>//g'` 

if [ -z "$result" ]; then
	#Special Communique red
	result=`curl -Ls $URL |egrep -i '#ff0000"[^*]+' |sed -e 's/<[^>]*>//g' |  sed -e 's/^[[:space:]]*//'`
	#result=`curl -Ls $URL | grep -oP '<span style="color: #ff0000"[^*]+' |sed -e 's/<[^>]*>//g'`
fi


if [ -z "$result" ]; then
	#All the warning is over blue
	result=`curl -Ls $URL | grep -oP '<span style="color: #4A7FBB"[^*]+' |sed -e 's/<[^>]*>//g'`
	if [ ! -z "$result" ];then
		result="✅$result"
	fi
else
   result="⚠️ $result"
fi

if [ ! -z "$result" ]; then
	echo $result | sed -e "s/'//g"
else
	echo "✅ No warning in Mauritius"
fi
