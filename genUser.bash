#!/bin/bash

sudo groupadd AlphaQ
 
sudo adduser -force-badname --gecos "" Jay_Jay
sudo usermod -G AlphaQ Jay_Jay
sudo usermod -aG sudo Jay_Jay

for i in {01..30}
do
 sudo adduser -force-badname --disabled-password --gecos "" sysAd_"$i"
 sudo usermod -G AlphaQ sysAd_"$i"           
 
 sudo adduser -force-badname --disabled-password --gecos "" appDev_"$i"
 sudo usermod -G AlphaQ appDev_"$i"           
 
 sudo adduser -force-badname --disabled-password --gecos "" webDev_"$i"
 sudo usermod -G AlphaQ webDev_"$i"

done
