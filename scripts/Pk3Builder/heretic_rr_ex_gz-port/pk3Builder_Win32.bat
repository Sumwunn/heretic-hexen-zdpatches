@echo off

REM Variable(s)
echo -----------------------
echo "Requires DoomTools & 7z"
echo.

REM Prompt for paths
set /p "DIR_DOOMTOOLS=Enter the path for DoomTools (Win32): "
set /p "DIR_7Z=Enter the path for 7-Zip (Win32): "
set TEXTURES_WAD_NAME=rr_ex_textures.wad
set EXTRADATA_WAD_NAME=rr_ex_extradata.wad

REM Build Textures WAD
call "%DIR_DOOMTOOLS%\wtexlist.cmd" iwads\heretic_new.wad ^ | call "%DIR_DOOMTOOLS%\wtexport.cmd" iwads\heretic_new.wad --base-wad iwads\heretic_orig.wad --output %TEXTURES_WAD_NAME% --create

REM Extra Data
call "%DIR_DOOMTOOLS%\wadmerge.cmd" scripts\edWadBuilder.txt

REM Make PK3
"%DIR_7Z%\7z.exe" a -tzip -mx=5 -mm=Deflate heretic_rr_ex-gz-port.pk3 .\sumwunn-rr_ex_patch\* %TEXTURES_WAD_NAME% %EXTRADATA_WAD_NAME%

REM Cleanup
del %TEXTURES_WAD_NAME%
del %EXTRADATA_WAD_NAME%
echo Done
pause
