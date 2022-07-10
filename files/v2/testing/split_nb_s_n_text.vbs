Function SplitNumAndText(strInput)	
	Dim strNumbers, strLetters
	strNumbers = "" : strLetters = ""
	
	For intChar = 1 To Len(strInput)
		If IsNumeric(Mid(strInput, intChar, 1)) Then
			strNumbers = strNumbers & Mid(strInput, intChar, 1)
		Else
			strLetters = strLetters & Mid(strInput, intChar, 1)
		End If
	Next
	SplitNumAndText = strNumbers & " and " & strLetters
End Function

msgbox SplitNumAndText("a12ghf4 22.33.44 kkk")

Function get_version(strInput)
    Dim version_result
    Dim stop_char
    Dim version_found
    Dim stop_delay
    Dim strLength
    Dim authedChar
    Dim ignored_chars

    version_result = ""
    stop_char = " "
    version_found = false
    stop_delay = 1
    strLength = Len(strInput)
    authedChar = "."
    ignored_chars = 0

    For intChar = 1 To strLength
        If IsNumeric(Mid(strInput, intChar, 1)) And version_found = false Then
            version_result=version_result+Mid(strInput, intChar, 1)
        ElseIf Mid(strInput, intChar, 1) = authedChar And version_found = false Then
            version_result=version_result+Mid(strInput, intChar, 1)
        ElseIf Mid(strInput, intChar, 1) = stop_char And version_found = false Then
            If stop_delay > 0 Then
                stop_delay = stop_delay - 1
            Else
                version_found = true
                Exit For
            End If
        Else
            ignored_chars = ignored_chars+1
        End If
    Next
    get_version = version_result

End Function

Dim pip_version
pip_version = get_version("pip 22.1.2 from C:\Users\....\AppData\Roaming\Python\Python310\site-packages\pip (python 3.10)")
msgbox "oooo"+pip_version+"qqqq", 0+0+0, "Pip's version"
