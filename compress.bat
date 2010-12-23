@setlocal
@echo off
set path="C:\Program Files\WinRAR\";%path%

for /f "tokens=2-4 delims=/ " %%g in ('date /t') do (
  set mm=%%g
  set dd=%%h
  set yy=%%i
)
set filename=ex%yy:~2,2%%mm%%dd%.log

for /F %%i in ('dir -d /s/b *.log') do call :do_compress %%i
goto :eof

:do_compress
set fname=%1
IF NOT %fname:~-12% == %filename% ( rar a -ep -df %1.rar %1 )