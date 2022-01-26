@echo off 
TASKLIST /FI "imagename eq WINWORD.EXE" /v /FO list > activeApps/listword.txt
TASKLIST /FI "imagename eq EXCEL.EXE" /v /FO list > activeApps/listexcel.txt
TASKLIST /FI "imagename eq POWERPNT.EXE" /v /FO list > activeApps/listpowerpoint.txt
TASKLIST /FI "imagename eq chrome.exe" /v /FO list > activeApps/listchrome.txt
TASKLIST /FI "imagename eq code.exe" /v /FO list > activeApps/listcode.txt
TASKLIST /FI "imagename eq teams.exe" /v /FO list > activeApps/listteams.txt
TASKLIST /FI "imagename eq studio64.exe" /v /FO list > activeApps/liststudio.txt 
