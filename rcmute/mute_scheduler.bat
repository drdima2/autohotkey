@echo off
setlocal

set "TaskName=RC_Mute"
set "TaskCommand=%~dp0mute.bat"
set "StartTime=00:00"
set "ScheduleDaily=TRUE"
set "DaysOfWeek=MON,TUE,WED,THU,FRI,SAT,SUN"
set "TaskFolder=\RC"

schtasks /create /tn "%TaskName%" /tr "%TaskCommand%" /sc daily /st %StartTime% /f /ru %USERNAME% /rl HIGHEST /it

endlocal