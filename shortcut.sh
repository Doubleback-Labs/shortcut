#!/usr/bin/sh

# Author:  TJ Gillis <tj@doublebacklabs.com>
#
# Version 0.0.1
# Release Date 02/06/23 <dd/mm/yy>
#
# Contributors:
#   <This could be your name!>
#
# SPDX-License-Identifier: Unlicense

SHORTCUT_PATH=~/.shortcut
SHORTCUT_BASE_NAME=$(basename ~/.shortcut)
SHORTCUT_PREFIX=__

if [[ -d $SHORTCUT_PATH ]]
then
    echo "$SHORTCUT_PATH already exists"
else
    echo "Create $SHORTCUT_PATH/"
    mkdir $SHORTCUT_PATH
fi

if [[ $CDPATH =~ $SHORTCUT_BASE_NAME ]]
then
    echo "CDPATH already set"
else
    echo "CDPATH must be configured"
    echo "export CDPATH=\$CDPATH:$SHORTCUT_PATH" 
    echo "Then then you must refresh your shell:"
    echo "source ~/.zshrc or source ~/.bashrc or whatever your shell RC is"
    exit 1
fi

echo "CDPATH is $CDPATH"

COMMAND=${1}

if [[ $COMMAND == "." ]]
then
	PATH_TO_ADD=$PWD
fi

if [[ $COMMAND == "add" ]]
then
    PATH_TO_ADD=${2}
fi

if [[ $COMMAND == "remove" ]]
then
    TARGET=${2}
    echo "Target is $TARGET"
	if [ ${TARGET+x} ]
    then
        if [[ $TARGET == "all" ]]
        then
            echo "Remove all!"
            rm -r $SHORTCUT_PATH
            mkdir $SHORTCUT_PATH
        else
            echo "Remove Target"
            rm -r $SHORTCUT_PATH/$TARGET
        fi
    fi

    exit 0
fi

echo "Path to add $PATH_TO_ADD"

BASE_NAME=$(basename $PATH_TO_ADD)
CUSTOM_NAME=${3}

echo "Basename $BASE_NAME"

if [ ${CUSTOM_NAME+x} ]
then
    echo "Custom name set $CUSTOM_NAME"
    ln -s $PATH_TO_ADD $SHORTCUT_PATH/$SHORTCUT_PREFIX$CUSTOM_NAME
else
    echo "Use basename $BASE_NAME"
    ln -s $PATH_TO_ADD $SHORTCUT_PATH/$SHORTCUT_PREFIX$BASE_NAME
fi



