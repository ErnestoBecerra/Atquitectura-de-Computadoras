@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu Nov 25 19:05:26 -0600 2021
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 39176e68f0634a30bcd6429e083cf3f7 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_Registro_behav xil_defaultlib.tb_Registro -log elaborate.log"
call xelab  -wto 39176e68f0634a30bcd6429e083cf3f7 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_Registro_behav xil_defaultlib.tb_Registro -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
