@echo off
ping -t api.smart-connect.cloud|cmd /q /v /c "(pause&pause)>nul & for /l %%a in () do (set /p "data=" && echo(!date! !time! !data!)&ping -n 2 api.smart-connect.cloud>nul"