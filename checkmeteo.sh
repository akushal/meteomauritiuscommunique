#!/bin/bash

URL=http://metservice.intnet.mu/warning-bulletin-special-weather.php

result=`curl -Ls $URL | grep -oP '<span style="color: #ff0000"[^*]+' |sed -e 's/<[^>]*>//g'`

if [ -z $result ]; then
	result=`curl -Ls $URL | grep -oP '<span style="color: #4A7FBB"[^*]+' |sed -e 's/<[^>]*>//g'`
	if [ ! -z "$result" ];then
		result="✅$result"
	fi
else
   result="⚠️ $result"
fi

if [ ! -z $result ]; then
	echo $result
else
	echo "✅ No warning in Mauritius"
fi
