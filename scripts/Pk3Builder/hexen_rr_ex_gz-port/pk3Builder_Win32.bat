@echo off

REM Variable(s)
echo -----------------------
echo Requires DoomTools & 7z
echo.

set /p DOOMTOOLS_DIR="Enter the path for DoomTools (bash): "
set TEXTURES_WAD_NAME=rr_ex_textures.wad
set SPRITES_WAD_NAME=rr_ex_sprites.wad
set EXTRADATA_WAD_NAME=rr_ex_extradata.wad

REM Build Textures WAD
"%DOOMTOOLS_DIR%\wtexlist" iwads\hexen_new.wad | "%DOOMTOOLS_DIR%\wtexport" iwads\hexen_new.wad --base-wad iwads\hexen_orig.wad --output %TEXTURES_WAD_NAME% --create

REM Build Sprites WAD
"%DOOMTOOLS_DIR%\wadmerge" scripts\spriteWadBuilder.txt

REM Build Extra Data WAD
"%DOOMTOOLS_DIR%\wadmerge" scripts\edWadBuilder.txt

REM Make PK3
7z a -tzip -mx=5 -mm=Deflate hexen_rr_ex-gz-port.pk3 .\sumwunn-rr_ex_patch\* ..\..\..\patches\hexen_rerelease_zdpatch\* %TEXTURES_WAD_NAME% %SPRITES_WAD_NAME% %EXTRADATA_WAD_NAME%

REM Cleanup
del %TEXTURES_WAD_NAME%
del %SPRITES_WAD_NAME%
del %EXTRADATA_WAD_NAME%
