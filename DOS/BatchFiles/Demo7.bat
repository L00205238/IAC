:: Batch file to demonstrate conditional branching 
:: By: Jarred
:: Initial file: 25OCT26
:: Filename: Demo7.bat

@echo off
cls
title Jarred Find a File
echo *******************************************
echo This batch file will do stuff
echo This is for demonstration purposes only.
echo *******************************************

SET ospath=C:\Windows\
SET filename=explorer.exe

If exist %ospath%%filename% echo %filename% exists 