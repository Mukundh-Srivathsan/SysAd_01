#!/bin/bash

sudo groupadd AlphaQ
 
sudo useradd -force-badname Jay_Jay
sudo usermod -G AlphaQ Jay_Jay
sudp usermod -aG sudo Jay_Jay

for i in {1..30}
	do
		if [[ $i -lt 10 ]]; then
            sudo adduser -force-badname sysAd_0$i
            sudo usermod -G AlphaQ sysAd_0$i
            
            sudo adduser -force-badname appDev_0$i
            sudo usermod -G AlphaQ appDev_0$i
            
            sudo adduser -force-badname webDev_0$i
            sudo usermod -G AlphaQ webDev_0$i
        else
            sudo adduser -force-badname sysAd_$i
            sudo usermod -G AlphaQ sysAd_$i
            
            sudo adduser -force-badname appDev_$i
            sudo usermod -G AlphaQ appDev_$i
            
            sudo adduser -force-badname webDev_$i
            sudo usermod -G AlphaQ webDev_$i
        fi
done




