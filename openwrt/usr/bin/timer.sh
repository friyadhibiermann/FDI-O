#!/bin/bash
INDEX=`seq 1 $(uci get gpio.main.jumlah)`
for SW in $INDEX 
  do
     status_t=`uci get gpio.main.timer$SW`
     waktu=`uci get gpio.main.time$SW`
     jam=$(date|awk -F" " '{print $4}'|awk -F":" '{print$1}')
     menit=$(date|awk -F" " '{print $4}'|awk -F":" '{print$2}')
     jam=$(echo -n "$jam$menit")
     enable=`echo $status_t`
     if [ "$enable" == "1" ];then
         jamawal=`echo "$waktu" |awk -F"-" '{print $1}'`
         menitawal=${jamawal##*:}
         jamawal=${jamawal%%:*}
         jamawal=$(echo -n "$jamawal$menitawal")
         jamakhir=`echo "$waktu" |awk -F"-" '{print $2}'`
         menitakhir=${jamakhir##*:}
         jamakhir=${jamakhir%%:*}
         jamakhir=$(echo -n "$jamakhir$menitakhir")
         echo "now:$jam awal:$jamawal akhir:$jamakhir"
         LAMPU=""
         if [ "$jamawal" -gt "$jamakhir" ];then
             echo "now $jam awal $jamawal > akhir $jamakhir"
             if [ "$jam" -gt "$jamawal" ];then 
                  echo "$jam > $jamawal ON" 
                  LAMPU="ON"
             else
                 if [ $jam -lt $jamakhir ];then
                     echo "$jam < $jamakhir ON" 
                     LAMPU="ON"
                 fi
             fi 
             if [ $jam -lt $jamawal ] && [ $jam -gt $jamakhir ];then
                  echo "$jam < $jamawal && $jam > $jamakhir OFF"
                  LAMPU="OFF"
             fi
         else
             if [ $jam -gt $jamawal ] && [ $jam -lt $jamakhir ];then
                 LAMPU="ON"
             fi
             if [ $jam -eq $jamawal ] && [ $jam -lt $jamakhir ];then
                 LAMPU="ON"
             fi
         fi
         if [ $jam -eq $jamawal ];then
             LAMPU="ON" 
         fi
         if [ $jam -eq $jamakhir ];then
             echo "$jam == $jamakhir  OFF"
             LAMPU="OFF"
         fi 
         if [ "$LAMPU" == "ON" ];then
		 CHID=`uci get gpio.type.chipsid$SW`
             if [ $SW -gt 3 ];then
				if [ $(uci get gpio.type) == "openwrt" ];then
					echo 1 > /sys/class/gpio/gpio`uci get gpio.main.gpio$SW`/value
				elif [ $(uci get gpio.type) == "esp" ];then
				  fdi_gpio mos $SW ON $CHID
				fi
             else
				if [ $(uci get gpio.type) == "openwrt" ];then
					echo 1 > /sys/class/gpio/gpio`uci get gpio.main.gpio$SW`/value
				elif [ $(uci get gpio.type) == "esp" ];then
					fdi_gpio mos $SW ON $CHID
				fi
             fi
         else           
             if [ $SW -gt 3 ];then
				if [ $(uci get gpio.type) == "openwrt" ];then
					echo 0 > /sys/class/gpio/gpio`uci get gpio.main.gpio$SW`/value
				elif [ $(uci get gpio.type) == "esp" ];then
				  fdi_gpio mos $SW OFF $CHID
				fi
             else
				if [ $(uci get gpio.type) == "openwrt" ];then
					echo 0 > /sys/class/gpio/gpio`uci get gpio.main.gpio$SW`/value
				elif [ $(uci get gpio.type) == "esp" ];then
					fdi_gpio mos $SW OFF $CHID
				fi
             fi
         fi
     fi
      
 done
