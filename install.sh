#!/bin/bash

STOP_BALANCER_JS="stopBalancer.js"
PROGRAM="mongodb-backup"
CONF="${PROGRAM}.conf"
TARGET_BIN="/usr/local/bin"
TARGET_LIB="/usr/local/lib"

# Check if directories exist
[ -d $TARGET_BIN ] || mkdir $TARGET_BIN
[ -d $TARGET_LIB ] || mkdir $TARGET_LIB

# Dispatch files
cp -f $PROGRAM $TARGET_BIN/ 
cp -f $STOP_BALANCER_JS $TARGET_LIB/
cp -f $CONF /etc/

if [ -f "$TARGET_BIN/$PROGRAM" ] && [ -f "$TARGET_LIB/$STOP_BALANCER_JS" ] && [ -f "$CONF" ]; then
	echo "Done."
else
	echo "Installation failed"
	echo "Check if files has not been renamed"
fi
