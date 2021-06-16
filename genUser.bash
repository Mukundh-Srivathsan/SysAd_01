#!/bin/bash

sudo groupadd AlphaQ
 
sudo adduser -force-badname --gecos "" Jay_Jay
sudo usermod -G AlphaQ Jay_Jay
sudo usermod -aG sudo Jay_Jay

for i in {1..30}
    do
        if [[ $i -lt 10 ]]; then
            sudo adduser -force-badname --disabled-password --gecos "" sysAd_0"$i"
            sudo usermod -G AlphaQ sysAd_0"$i"
            
            sudo adduser -force-badname --disabled-password --gecos "" appDev_0"$i"
            sudo usermod -G AlphaQ appDev_0"$i"
            
            sudo adduser -force-badname --disabled-password --gecos "" webDev_0"$i"
            sudo usermod -G AlphaQ webDev_0"$i"
        else
            sudo adduser -force-badname --disabled-password --gecos "" sysAd_"$i"
            sudo usermod -G AlphaQ sysAd_"$i"
            
            sudo adduser -force-badname --disabled-password --gecos "" appDev_"$i"
            sudo usermod -G AlphaQ appDev_"$i"
            
            sudo adduser -force-badname --disabled-password --gecos "" webDev_"$i"
            sudo usermod -G AlphaQ webDev_"$i"
        fi
done
