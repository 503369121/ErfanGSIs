#!/bin/bash

# Project OEM-GSI Porter by Erfan Abdi <erfangplus@gmail.com>

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

AB=true
AONLY=true
MOUNTED=false
CLEAN=false

usage()
{
    echo "Usage: [--help|-h|-?] [--ab|-b] [--aonly|-a] [--mounted|-m] [--cleanup|-c] $0 <Firmware link> <Firmware type> [Other args]"
    echo -e "\tFirmware link: Firmware download link or local path"
    echo -e "\tFirmware type: Firmware mode"
    echo -e "\t--ab: Build only AB"
    echo -e "\t--aonly: Build only A-Only"
    echo -e "\t--cleanup: Cleanup downloaded firmware"
    echo -e "\t--help: To show this info"
}

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --ab|-b)
    AONLY=false
    AB=true
    shift
    ;;
    --aonly|-a)
    AONLY=true
    AB=false
    shift
    ;;
    --cleanup|-c)
    CLEAN=true
    shift
    ;;
    --help|-h|-?)
    usage
    exit
    ;;
    *)
    POSITIONAL+=("$1")
    shift
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [[ ! -n $2 ]]; then
    echo "-> ERROR: Enter all needed parameters"
    usage
    exit
fi

URL=$1
shift
SRCTYPE=$1
shift

ORIGINAL_URL=$URL

if [[ $SRCTYPE == *":"* ]]; then
    SRCTYPENAME=`echo "$SRCTYPE" | cut -d ":" -f 2`
else
    SRCTYPENAME=$SRCTYPE
fi

DOWNLOAD()
{
    URL="$1"
    ZIP_NAME="$2"
    echo "-> Downloading firmware to: $ZIP_NAME"
    aria2c -x16 -j$(nproc) -U "Mozilla/5.0" -d "$PROJECT_DIR/input" -o "$ACTUAL_ZIP_NAME" ${URL} > /dev/null 2>&1 || wget -U "Mozilla/5.0" ${URL} -O "$ZIP_NAME" > /dev/null 2>&1
}

MOUNT()
{
    mkdir -p "$PROJECT_DIR/working/system"
    if [ $(uname) == Linux ]; then
        sudo mount -o ro "$1" "$PROJECT_DIR/working/system"
    elif [ $(uname) == Darwin ]; then
        fuse-ext2 "$1" "$PROJECT_DIR/working/system"
    fi
}

UMOUNT()
{
    sudo umount "$1"
}

LEAVE()
{
    UMOUNT "$PROJECT_DIR/working/system"
    rm -rf "$PROJECT_DIR/working"
    exit 1
}

echo " "
echo " "
echo "*********************************"
echo "*          ErfanGSIs            *"
echo "*       Pinkdoge Edition         *"
echo "*********************************"
echo " "
echo " "

echo "-> Updating tools..."
"$PROJECT_DIR"/update.sh

echo "-> Removing possible residuals from previous builds to avoid problems"
   if [ -d "$PROJECT_DIR/working/" ]; then
       sudo umount "$PROJECT_DIR/working/system"
       sudo rm -rf "$PROJECT_DIR/working/"
   fi
   if [ -d "$PROJECT_DIR/tools/ROM_resigner/tmp/" ]; then
       sudo rm -rf "$PROJECT_DIR/tools/ROM_resigner/tmp/"
   fi
   if [ -d "$PROJECT_DIR/tmp/" ]; then
       sudo rm -rf "$PROJECT_DIR/tmp/"
   fi

# Create input & working directory if it does not exist
mkdir -p "$PROJECT_DIR/input" "$PROJECT_DIR/working" "$PROJECT_DIR/output"

if [[ -d "$URL" ]]; then
    MOUNTED=true
fi

ZIP_NAME="$PROJECT_DIR/input/dummy"
if [ $MOUNTED == false ]; then
    if [[ "$URL" == "http"* ]]; then
        # URL detected
        RANDOMM=$(echo $RANDOM)
        ACTUAL_ZIP_NAME="$RANDOMM"_FIRMWARE.tgz
        ZIP_NAME="$PROJECT_DIR"/input/"$RANDOMM"_FIRMWARE.tgz
        DOWNLOAD "$URL" "$ZIP_NAME"
        URL="$ZIP_NAME"
    fi
    "$PROJECT_DIR"/zip2img.sh "$URL" "$PROJECT_DIR/working" || exit 1
    export FIRMWARE_PATH=$URL
    if [ $CLEAN == true ]; then
        rm -rf "$ZIP_NAME"
    fi
    MOUNT "$PROJECT_DIR/working/system.img"
    URL="$PROJECT_DIR/working/system"
fi

if [ $AB == true ]; then
   "$PROJECT_DIR"/make.sh "${URL}" "${SRCTYPE}" AB "$PROJECT_DIR/output" ${@} || LEAVE
fi

if [ $AONLY == true ]; then
    "$PROJECT_DIR"/make.sh "${URL}" "${SRCTYPE}" Aonly "$PROJECT_DIR/output" ${@} || LEAVE
fi

UMOUNT "$PROJECT_DIR/working/system"
rm -rf "$PROJECT_DIR/working"

echo "-> Porting ${SRCTYPENAME} GSI done on: $PROJECT_DIR/output"

DEBUG=false
if [ $DEBUG == true ]; then
echo "AONLY = ${AONLY}"
echo "AB = ${AB}"
echo "MOUNTED = ${MOUNTED}"
echo "URL = ${URL}"
echo "SRCTYPE = ${SRCTYPE}"
echo "SRCTYPENAME = ${SRCTYPENAME}"
echo "OTHER = ${@}"
echo "ZIP_NAME = ${ZIP_NAME}"
fi
