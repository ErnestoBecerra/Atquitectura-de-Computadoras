@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu Nov 25 17:59:08 -0600 2021
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 7ad394d92ab24ff2962eab7e33d3d2f5 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_Contador_behav xil_defaultlib.tb_Contador -log elaborate.log"
call xelab  -wto 7ad394d92ab24ff2962eab7e33d3d2f5 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_Contador_behav xil_defaultlib.tb_Contador -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
