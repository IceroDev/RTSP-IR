#!/bin/bash

#    ______ _______ ______ ______       _ ______  
#   (_____ (_______) _____|_____ \     | (_____ \ 
#    _____) )  _  ( (____  _____) )____| |_____) )
#   |  __  /  | |  \____ \|  ____(_____) |  __  / 
#   | |  \ \  | |  _____) ) |          | | |  \ \ 
#   |_|   |_| |_| (______/|_|          |_|_|   |_|                                            
#           Save images from RTSP Stream  
#             Developed by Jean Staffe               

######## Configurations ########
rtspIPandPath=""                        # The IP camera, port and url example "192.168.1.111/myvideo"
rtspUser=""                             # The RTSP username
rtspPassword=""                         # The RTSP password
outputDirectory="/camera"               # The directory where the recordings should be stored. You MUST create a specific directory for the software !!!
maxStoringDays=5                        # The maximum age of stored files
################################

#################################################################################################
################################## Do not edit below this line ##################################
#################################################################################################

while true; do
    if [ "$EUID" -ne 0 ]
    then echo "ERROR: This script can only be run as root"
    exit
    fi

    if ! command -v ffmpeg &> /dev/null
    then
        echo "ffmpeg could not be found, installing"
        apt install ffmpeg -y
    fi

    dirTimecode=$(date +%d-%m-%Y)
    fileTimecode=$(date +%s)

    if [[ -d $outputDirectory/$dirTimecode ]]
    then
        cd $outputDirectory/$dirTimecode
        ffmpeg -y -rtsp_transport tcp -i rtsp://$rtspUser:$rtspPassword@$rtspIPandPath -vframes 1 $fileTimecode.jpg
        find $outputDirectory/ -mindepth 1 -mtime +$maxStoringDays -delete
        find $outputDirectory/ -empty -type d -delete
    else
        mkdir $outputDirectory/$dirTimecode
        cd $outputDirectory/$dirTimecode
        ffmpeg -y -rtsp_transport tcp -i rtsp://$rtspUser:$rtspPassword@$rtspIPandPath -vframes 1 $fileTimecode.jpg
        find $outputDirectory/ -mindepth 1 -mtime +$maxStoringDays -delete
        find $outputDirectory/ -empty -type d -delete
    fi
done
