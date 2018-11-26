#!/bin/bash

NVIM_CONFIG_PATH=${HOME}/.config/nvim/init.vim
if [ -f "$NVIM_CONFIG_PATH" ];
then
	mv -v $NVIM_CONFIG_PATH $NVIM_CONFIG_PATH.backup.$(date "+%Y-%m-%d-%H%M%S")
fi

ln -sfv ${PWD}/config/nvim/init.vim $NVIM_CONFIG_PATH 
