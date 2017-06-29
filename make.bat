@echo off
set zippath="c:\Program Files\7-Zip\7z.exe"
set curlpath="C:\Users\scrudy\Downloads\utilities\curl.exe"
set password=
set host=10.0.0.111
C:
cd \Users\scrudy\source\roku-one-drive
"c:\Program Files\7-Zip\7z.exe" a -tzip source.zip ./source/*
%curlpath% -u rokudev:%password% --digest -F archive=@./source.zip -F mysubmit=Replace http://%host%/plugin_install