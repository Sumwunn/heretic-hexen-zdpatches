@echo off

REM Variable(s)
echo Requires DoomTools & 7z
echo.

set /p DOOMTOOLS_DIR="Enter the path for DoomTools (Win32): "
set TEXTURES_WAD_NAME=rr_ex_textures.wad
set EXTRADATA_WAD_NAME=rr_ex_extradata.wad

REM Build Textures WAD
"%DOOMTOOLS_DIR%\wtexlist" iwads\heretic_new.wad | "%DOOMTOOLS_DIR%\wtexport" iwads\heretic_new.wad --base-wad iwads\heretic_orig.wad --output %TEXTURES_WAD_NAME% --create

REM Extra Data
"%DOOMTOOLS_DIR%\wadmerge" scripts\edWadBuilder.txt

REM Make PK3
7z a -tzip -mx=5 -mm=Deflate heretic_rr_ex-gz-port.pk3 .\sumwunn-rr_ex_patch\* %TEXTURES_WAD_NAME% %EXTRADATA_WAD_NAME%

REM Cleanup
del %TEXTURES_WAD_NAME%
del %EXTRADATA_WAD_NAME%
