#!/bin/bash

STOP_BALANCER_JS="stopBalancer.js"
PROGRAM="mongodb-backup"
TARGET_BIN="/usr/local/bin"
TARGET_LIB="/usr/local/lib"

# Dispatch files
cp -f $STOP_BALANCER_JS $TARGET_BIN/ 
cp -f $STOP_BALANCER_JS $TARGET_LIB/

if [ -f $TARGET_BIN/$PROGRAM ] && [ -f $TARGET_LIB/$STOP_BALANCER_JS ] ; then
	echo "Done."
else
	echo "Installation failed"
	echo "Check if files has not been renamed and if $TARGET_BIN and $TARGET_LIB directories exist"
fi
