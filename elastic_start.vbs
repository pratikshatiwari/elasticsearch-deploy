Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "C:\elk\elasticsearch\bin\elasticsearch.bat" & Chr(34), 0
Set WshShell = Nothing