# RTSP Image Recorder
A script to save images from an IP camera using the RTSP protocol.

## How does it works ?
The script will connect to the RTSP stream of your IP camera and take an image that it will redirect to a file at the location of your choice.

The script will record an image about every two seconds.

## Installation

### Downloading the script
### Manual
```
wget https://raw.githubusercontent.com/IceroDev/RTSP-IR/main/rtsp.sh
```

## Disclaimer
This script is given as is. I can't be responsible for modifications, loss of access or misconfiguration made on your side. You have to make sure that your configurations work or that your script is executable. Make a test before putting in production with a crontab.

# Testing
To validate a distribution/distribution version, please insert a pull request.
| Distribution | Compatible ? |
|:------------:|:------------:|
|   Debian 10  |      yes     |
|   Debian 11  |      yes     |
| Ubuntu 20.04 |      yes     |
|  Centos 7/8  |      no      |
