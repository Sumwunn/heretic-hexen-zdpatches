#!/bin/bash

# Variable(s)
echo "-----------------------"
echo "Requires DoomTools & 7z"
echo ""
read -p "Enter the path for DoomTools (bash): " DOOMTOOLS_DIR
TEXTURES_WAD_NAME=rr_ex_textures.wad
EXTRADATA_WAD_NAME=rr_ex_extradata.wad

# Build Textures WAD
$DOOMTOOLS_DIR/wtexlist iwads/heretic_new.wad | $DOOMTOOLS_DIR/wtexport iwads/heretic_new.wad --base-wad iwads/heretic_orig.wad --output $TEXTURES_WAD_NAME --create

# Extra Data
$DOOMTOOLS_DIR/wadmerge scripts/edWadBuilder.txt

# Make PK3
7z a -tzip -mx=5 -mm=Deflate heretic_rr_ex-gz-port.pk3 ./sumwunn-rr_ex_patch/* $TEXTURES_WAD_NAME $EXTRADATA_WAD_NAME

# Cleanup
rm $TEXTURES_WAD_NAME
rm $EXTRADATA_WAD_NAME
echo "Done"
