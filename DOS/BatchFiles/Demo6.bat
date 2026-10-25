:: Batch file to take arguments at runtime 
:: By: Jarred
:: Initial file: 25OCT26
:: Filename: Demo6.bat

@echo off
cls
title Jarreds user prompt test
echo *******************************************
echo Welcome 
echo This batch file will do stuff
echo This is for demonstration purposes only.
echo *******************************************

set /p NAME=What is your name?
echo Your name is %NAME%