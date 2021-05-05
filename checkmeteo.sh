#!/bin/bash

URL=http://metservice.intnet.mu/warning-bulletin-special-weather.php

curl -Ls $URL | grep -oP '<span style="color: #ff0000">[^*]+' |sed -e 's/<[^>]*>//g'
