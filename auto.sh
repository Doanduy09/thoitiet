#!/bin/bash

response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=Ho%20Chi%20Minh,vietnam&appid=$APIKEY&units=metric&lang=vi")

description=$(echo $response | jq -r '.weather[0].description')
temp=$(echo $response | jq -r '.main.temp')
humidity=$(echo $response | jq -r '.main.humidity')
wind_speed=$(echo $response | jq -r '.wind.speed') 
echo "Wind speed: $wind_speed"
wind_speed_kmh=$(echo "$wind_speed * 3.6" | bc -l | awk '{printf "%.1f", $0}')
output="Thoi tiet nhiet do: $temp °C. Do am: $humidity % . Gio: $wind_speed $wind_speed_kmh km/h"

echo $output | iconv -f UTF-8 -t ASCII//TRANSLIT > thoitiet.txt
