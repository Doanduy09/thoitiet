#!/bin/bash

response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=Ho%20Chi%20Minh,vietnam&appid={APIKEY}&units=metric&lang=vi")

description=$(echo $response | jq -r '.weather[0].description')
temp=$(echo $response | jq -r '.main.temp')
humidity=$(echo $response | jq -r '.main.humidity')

output="Thoi tiet: $description. Nhiet do: $temp °C. Do am: $humidity %"

echo $output | iconv -f UTF-8 -t ASCII//TRANSLIT > thoitiet.txt
