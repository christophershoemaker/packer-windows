rem del /q C:/Windows/Temp/*
rem for /d %%i in ('C:/Windows/Temp/*') do rd /s /q %%i

del /q C:/Windows/Temp/*
for /d %%i in (C:/Windows/Temp/*) do @rd /s /q %%i