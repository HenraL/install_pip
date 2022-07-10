' Const WshFinished = 1
' Const WshFailed = 2
' ' strCommand = "ping.exe 127.0.0.1"
' strCommand = "pip --version"

' Set WshShell = CreateObject("WScript.Shell")
' Set WshShellExec = WshShell.Exec(strCommand)

' Select Case WshShellExec.Status
'    Case WshFinished
'        strOutput = WshShellExec.StdOut.ReadAll
'    Case WshFailed
'        strOutput = WshShellExec.StdErr.ReadAll
' End Select

' WScript.StdOut.Write strOutput  'write results to the command line
' WScript.Echo strOutput          'write results to default output
' MsgBox strOutput                'write results in a message box

' ''Test code                                                                             '
' If StrComp(Wscript.ScriptName,"pip --version",vbTextCompare) = 0 Then
'     For Each line In ExecCmd("cmd /c dir")
'         WScript.Echo line
'     Next
' End If

Dim the_resulting_response
set wso = CreateObject("Wscript.Shell")
set exe = wso.Exec("cmd /c dir /s /b *.vbs")
the_resulting_response="Pip's version:"
Do Until exe.StdOut.AtEndOfStream
    ' Wscript.Echo exe.StdOut.ReadLine
    the_resulting_response=the_resulting_response+vbCrLf+exe.StdOut.ReadLine
Loop

set wso = CreateObject("Wscript.Shell")
set exe = wso.Exec("cmd /c pip --version")
Do Until exe.StdOut.AtEndOfStream
    ' Wscript.Echo exe.StdOut.ReadLine
    the_resulting_response=the_resulting_response+vbCrLf+exe.StdOut.ReadLine
Loop

Function get_command_args(command)
    Dim the_result
    the_result = ""
    command = "cmd /c "+Chr(34)+command+Chr(34)
    set wso = CreateObject("Wscript.Shell")
    set exe = wso.Exec(command)'"cmd /c pip --version"
    Do Until exe.StdOut.AtEndOfStream
        ' Wscript.Echo exe.StdOut.ReadLine
        the_result=the_result+vbCrLf+exe.StdOut.ReadLine
    Loop
    get_command_args=the_result
End Function

MsgBox the_resulting_response, 0+0+0, "Pip's version (the_resulting_response)"
MsgBox get_command_args("pip --version"), 0+0+0, "Pip's version (the_result)"
MsgBox Asc("©")
