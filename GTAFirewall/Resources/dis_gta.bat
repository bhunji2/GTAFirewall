@echo off
::�ȥ����]�w�nGTA5.exe�����ɪ���m�A�_�h�����𤣷|���@��
SET GTAPath="D:\SteamLibrary\steamapps\common\Grand Theft Auto V\gta5.exe"

::########################################## �`�N���U�Фŭק� ##########################################
SET RuleName="GTA 5 ��H���}�ԧ���"
SET File=".check"

netsh advfirewall firewall show rule name=%RuleName% | findstr /C:%RuleName% > %File%

FOR /F "usebackq" %%A IN ('%File%') DO set size=%%~zA

if %size% EQU 0 (
    ::�p�G�䤣��ӳW�h�A�h�n�s�W
    netsh advfirewall firewall add rule name=%RuleName% dir=in action=block program=%GTAPath% enable=yes
    netsh advfirewall firewall add rule name=%RuleName% dir=out action=block program=%GTAPath% enable=yes
    IF %ERRORLEVEL% EQU 0 echo GTA5�T��s�u���\(A)
) ELSE (
    ::�p�G���h��s�W�h
    netsh advfirewall firewall set rule name=%RuleName% new program=%GTAPath% action=block enable=yes
    IF %ERRORLEVEL% EQU 0 echo GTA5�T��s�u���\(E)
)
del /F /Q %File%
::pause
@echo on