@echo off
echo "STARTING BUILD"
set src=".\src"
set maps=".\maps"
set build=".\dist\VVA3MT"
set mission="mission.sqm"
set srcmin=".\dist\src"
ROBOCOPY "%src%" "%srcmin%" /E
FOR /R %srcmin% %%G IN (*.sqf) DO start python .\lib\minify.py "%%G" "%%G"
FOR %%G IN (ALTIS,ENOCH,GM_WEFERLINGEN_SUMMER,GM_WEFERLINGEN_WINTER,MALDEN,STRATIS,TANOA,VR) DO (
IF EXIST %build%.%%G RMDIR /S /Q %build%.%%G
IF EXIST %build%.%%G.pbo DEL %build%.%%G.pbo
MD %build%.%%G
ROBOCOPY "%srcmin%" "%build%.%%G" /E
COPY "%maps%\%%G\%mission%" "%build%.%%G"
start lib/PBOConsole.exe -pack "%build%.%%G" "%build%.%%G.pbo"
echo "BUILT %%G"
)
echo "BUILD COMPLETE"
