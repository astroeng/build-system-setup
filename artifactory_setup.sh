#!/bin/bash

ARTIFACTORY_ADDRESS=<server>:8081
USER_CREDS="zdeploy:<password>"

if [[ "$1" == "setup" ]]; then

sudo apt update
sudo apt upgrade

# wget artifactory.zip
# wget https://api.bintray.com/content/jfrog/artifactory/jfrog-artifactory-oss-$latest.zip;bt_package=jfrog-artifactory-oss-zip

# sudo apt install openjdk-11-jre-headless #18.04
sudo apt install openjdk-8-jre-headless #16.04
sudo apt install unzip

unzip jfrog-artifactory-oss-6.4.1.zip
cd artifactory-oss-6.4.1
./bin/artifactory.sh

fi

if [[ "$1" == "deploy" ]]; then

URL_BASE="http://$ARTIFACTORY_ADDRESS/artifactory/generic-local/place/platform/arch/version/"

curl -u $USER_CREDS -X PUT $URL_BASE"0001K.zip" -T 0001K.zip
curl -u $USER_CREDS -X PUT $URL_BASE"0010K.zip" -T 0010K.zip
curl -u $USER_CREDS -X PUT $URL_BASE"0100K.zip" -T 0100K.zip
curl -u $USER_CREDS -X PUT $URL_BASE"1000K.zip" -T 1000K.zip

curl -u $USER_CREDS -X PUT $URL_BASE"0001M.zip" -T 0001M.zip
curl -u $USER_CREDS -X PUT $URL_BASE"0010M.zip" -T 0010M.zip
curl -u $USER_CREDS -X PUT $URL_BASE"0100M.zip" -T 0100M.zip
curl -u $USER_CREDS -X PUT $URL_BASE"1000M.zip" -T 1000M.zip

curl -u $USER_CREDS -X PUT $URL_BASE"0001G.zip" -T 0001G.zip
curl -u $USER_CREDS -X PUT $URL_BASE"0010G.zip" -T 0010G.zip


fi

if [[ "$1" == "generate" ]]; then

dd if=/dev/urandom of=0010G.test bs=1M count=10240
dd if=/dev/urandom of=0001G.test bs=1M count=1024

dd if=/dev/urandom of=1000M.test bs=1M count=1000
dd if=/dev/urandom of=0100M.test bs=1M count=100
dd if=/dev/urandom of=0010M.test bs=1M count=10
dd if=/dev/urandom of=0001M.test bs=1M count=1

dd if=/dev/urandom of=1000K.test bs=1K count=1000
dd if=/dev/urandom of=0100K.test bs=1K count=100
dd if=/dev/urandom of=0010K.test bs=1K count=10
dd if=/dev/urandom of=0001K.test bs=1K count=1

zip 0010G.zip 0010G.test
zip 0001G.zip 0001G.test

zip 1000M.zip 1000M.test
zip 0100M.zip 0100M.test
zip 0010M.zip 0010M.test
zip 0001M.zip 0001M.test

zip 1000K.zip 1000K.test
zip 0100K.zip 0100K.test
zip 0010K.zip 0010K.test
zip 0001K.zip 0001K.test

fi

if [[ "$1" == "pull" ]]; then

URL_BASE="http://$ARTIFACTORY_ADDRESS/artifactory/generic-local/place/platform/arch/version/"

wget $URL_BASE"0001K.zip"
wget $URL_BASE"0010K.zip"
wget $URL_BASE"0100K.zip"
wget $URL_BASE"1000K.zip"

wget $URL_BASE"0001M.zip"
wget $URL_BASE"0010M.zip"
wget $URL_BASE"0100M.zip"
wget $URL_BASE"1000M.zip"

wget $URL_BASE"0001G.zip"
wget $URL_BASE"0010G.zip"

fi

# Q8300 -> 7200 RPM WD Black 1TB
#
# 10240+0 records in
# 10240+0 records out
# 10737418240 bytes (11 GB, 10 GiB) copied, 674.345 s, 15.9 MB/s
# 1024+0 records in
# 1024+0 records out
# 1073741824 bytes (1.1 GB, 1.0 GiB) copied, 67.4192 s, 15.9 MB/s
# 1000+0 records in
# 1000+0 records out
# 1048576000 bytes (1.0 GB, 1000 MiB) copied, 65.6817 s, 16.0 MB/s
# 100+0 records in
# 100+0 records out
# 104857600 bytes (105 MB, 100 MiB) copied, 6.569 s, 16.0 MB/s
# 10+0 records in
# 10+0 records out
# 10485760 bytes (10 MB, 10 MiB) copied, 0.657852 s, 15.9 MB/s
# 1+0 records in
# 1+0 records out
# 1048576 bytes (1.0 MB, 1.0 MiB) copied, 0.0677329 s, 15.5 MB/s
# 1000+0 records in
# 1000+0 records out
# 1024000 bytes (1.0 MB, 1000 KiB) copied, 0.0668451 s, 15.3 MB/s
# 100+0 records in
# 100+0 records out
# 102400 bytes (102 kB, 100 KiB) copied, 0.00860672 s, 11.9 MB/s
# 10+0 records in
# 10+0 records out
# 10240 bytes (10 kB, 10 KiB) copied, 0.00102775 s, 10.0 MB/s
# 1+0 records in
# 1+0 records out
# 1024 bytes (1.0 kB, 1.0 KiB) copied, 0.000222719 s, 4.6 MB/s
#

# 4 Disk RAIDZ1 - Ubuntu VM - Artifactory
#
# --2018-10-07 00:59:54--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/0001K.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 1194 (1.2K) [application/zip]
# Saving to: ‘0001K.zip’
# 
# 0001K.zip                                   100%[==========================================================================================>]   1.17K  --.-KB/s    in 0s      
# 
# 2018-10-07 01:00:27 (166 MB/s) - ‘0001K.zip’ saved [1194/1194]
# 
# --2018-10-07 01:00:27--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/0010K.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 10410 (10K) [application/zip]
# Saving to: ‘0010K.zip’
# 
# 0010K.zip                                   100%[==========================================================================================>]  10.17K  --.-KB/s    in 0s      
# 
# 2018-10-07 01:00:27 (188 MB/s) - ‘0010K.zip’ saved [10410/10410]
# 
# --2018-10-07 01:00:27--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/0100K.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 102590 (100K) [application/zip]
# Saving to: ‘0100K.zip’
# 
# 0100K.zip                                   100%[==========================================================================================>] 100.19K  --.-KB/s    in 0.003s  
# 
# 2018-10-07 01:00:27 (29.9 MB/s) - ‘0100K.zip’ saved [102590/102590]
# 
# --2018-10-07 01:00:27--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/1000K.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 1024330 (1000K) [application/zip]
# Saving to: ‘1000K.zip’
# 
# 1000K.zip                                   100%[==========================================================================================>]   1000K  --.-KB/s    in 0.08s   
# 
# 2018-10-07 01:00:27 (11.7 MB/s) - ‘1000K.zip’ saved [1024330/1024330]
# 
# --2018-10-07 01:00:27--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/0001M.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 1048906 (1.0M) [application/zip]
# Saving to: ‘0001M.zip’
# 
# 0001M.zip                                   100%[==========================================================================================>]   1.00M  5.33MB/s    in 0.2s    
# 
# 2018-10-07 01:00:27 (5.33 MB/s) - ‘0001M.zip’ saved [1048906/1048906]
# 
# --2018-10-07 01:00:27--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/0010M.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 10487530 (10M) [application/zip]
# Saving to: ‘0010M.zip’
# 
# 0010M.zip                                   100%[==========================================================================================>]  10.00M  12.6MB/s    in 0.8s    
# 
# 2018-10-07 01:00:28 (12.6 MB/s) - ‘0010M.zip’ saved [10487530/10487530]
# 
# --2018-10-07 01:00:28--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/0100M.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 104874548 (100M) [application/zip]
# Saving to: ‘0100M.zip’
# 
# 0100M.zip                                   100%[==========================================================================================>] 100.02M  60.4MB/s    in 1.7s    
# 
# 2018-10-07 01:00:30 (60.4 MB/s) - ‘0100M.zip’ saved [104874548/104874548]
# 
# --2018-10-07 01:00:30--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/1000M.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 1048745792 (1000M) [application/zip]
# Saving to: ‘1000M.zip’
# 
# 1000M.zip                                   100%[==========================================================================================>]   1000M  58.1MB/s    in 15s     
# 
# 2018-10-07 01:00:45 (66.9 MB/s) - ‘1000M.zip’ saved [1048745792/1048745792]
# 
# --2018-10-07 01:00:45--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/0001G.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 1073915622 (1.0G) [application/zip]
# Saving to: ‘0001G.zip’
# 
# 0001G.zip                                   100%[==========================================================================================>]   1.00G  84.8MB/s    in 17s     
# 
# 2018-10-07 01:01:02 (59.8 MB/s) - ‘0001G.zip’ saved [1073915622/1073915622]
# 
# --2018-10-07 01:01:02--  http://<server>:8081/artifactory/generic-local/place/platform/arch/version/0010G.zip
# Connecting to <server>:8081... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 10739158731 (10G) [application/zip]
# Saving to: ‘0010G.zip’
# 
# 0010G.zip                                   100%[==========================================================================================>]  10.00G   111MB/s    in 2m 5s   
# 
# 2018-10-07 01:03:11 (82.0 MB/s) - ‘0010G.zip’ saved [10739158731/10739158731]
# 
