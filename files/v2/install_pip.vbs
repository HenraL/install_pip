'Declaring the majority of the variables that will be used
Dim FSO
Dim run_french
Dim run_english
Dim file_name
Dim url
Dim arguments
Dim to_nowhere
Dim the_chosen_language
Dim link_answer
Dim answer_yes
Dim answer_no
Dim on_foreground
Dim warning_icon
Dim information_icon
Dim question_icon
Dim error_icon
Dim yes_no_cancel
Dim yes_no
Dim continue_program
Dim answer_cancel
Dim warning_response
Dim pip_version
Dim the_author
Dim checking_command
Dim installer_homepage

'Declaring the array's that will be used
Dim download_info(2)
Dim run_info(2)
Dim installation_verification_vars(2)

'Assining content to the variables
run_french = 6 'the integer that represents the yes button
run_english = 7 'the integer that represents the no button
file_name = "python-3.10.4-amd64.exe" 'Change this variable to change the name of the file that will be run
url = "https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe" 'Change this variable to change the location where the content will be downloaded
arguments = "/passive Include_pip=1" 'Change this argument (or leave blank "") to change the arguments called when the file will be run
link_answer = "" 'Leave empty
answer_yes = 6 'The integer that represents the yes button
answer_no = 7 'The integer that represents the no button
on_foreground = 4096 'If used, the window will stay in the foreground until closed
warning_icon = 48 'The integer that represents the warning icon
information_icon = 64 'The integer that represents the information icon
question_icon = 32 'The integer that represents the question icon
error_icon = 16 'The integer that represents the error icon
yes_no_cancel = 3 'If used, the buttons yes, no and cancel will be displayed
yes_no = 4 'If used, the buttons yes, no will be dissplayed
continue_program = true 'If set to false, the program will not run
answer_cancel = 3 'The integer that represents the cancel button
warning_response = "" 'Leave empty
pip_version = "" 'Leave empty
the_author = "(c) Henry Letellier" 'Do not touch
checking_command = "pip --version" 'The command used to make sure the program is well and truly installed on the computer
installer_homepage = "https://www.python.org/downloads/" 'The variable containing the homepage of the installer the program is dependent on, used if the installation has failed

'Assining content to the array's
download_info(0) = file_name 'Array containing the url and the file_name of the file to download
download_info(1) = url

run_info(0) = file_name 'Array containing the file_name and the arguments to use when the script (in the file variable) will be run
run_info(1) = arguments

installation_verification_vars(0) = checking_command 'Array containing the commandline to check the version of the program and the fallback installer if the installation failed
installation_verification_vars(1) = installer_homepage

'Declaring functions
Function download_a_file(download_info)
    ' Download a file from the internet
    dim xHttp: Set xHttp = createobject("WinHttp.WinHttpRequest.5.1")
    dim bStrm: Set bStrm = createobject("Adodb.Stream")
    dim url
    dim file_name
    url = download_info(1)
    file_name = download_info(0)
    xHttp.Open "GET", url, False
    xHttp.Send

    with bStrm
        .type = 1 '//binary
        .open
        .write xHttp.responseBody
        .savetofile file_name, 2 '//overwrite
    end with

    bStrm.close
End Function

Function run_file(run_info)
    'Run a file as if it was in the terminal
    Dim shl
    Dim file_name
    Dim arguments
    Dim command
    file_name = run_info(0)
    arguments = run_info(1)
    command = "cmd /c "+Chr(34)+file_name+" "+arguments+Chr(34)
    Set fso = CreateObject("Scripting.FileSystemObject" )
    set shl = createobject("wscript.shell")
    shl.run command,1,True

End Function

Function file_exists(file_path)
    'Check if the specified file exists
    set FSO = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(file_path) Then
        file_exists = true
        Exit Function
    Else
        file_exists = false
        Exit Function
    End If
End Function

Function open_in_browser(url)
    'Open a link in the browser
    CreateObject("WScript.Shell").Run(url)
End Function

Function get_command_response(command)
    'Run a command and read the output on line 0
    Dim the_result
    the_result = ""
    command = "cmd /c "+Chr(34)+command+Chr(34)
    set wso = CreateObject("Wscript.Shell")
    set exe = wso.Exec(command)
    Do Until exe.StdOut.AtEndOfStream
        the_result=the_result+vbCrLf+exe.StdOut.ReadLine
    Loop
    get_command_response=the_result
End Function

Function get_version(strInput)
    'Isolate the version from a string input
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

Function open_installer_page(url)
    'Ask if user wishes to open the given url
    If the_chosen_language = run_french Then
        link_answer = MsgBox("D�sirez-vous ouvrir:"+vbCrLf+url+vbCrLf+"Dans votre navigateur ?", yes_no+question_icon+on_foreground, "Ouvrir le lien ?")
        If link_answer = answer_yes Then
            open_in_browser(url)
            to_nowhere = MsgBox("Ouverture de :"+vbCrLf+url, 0+information_icon+on_foreground, "Ouverture du lien !")
        End If

    ElseIf the_chosen_language = run_english Then
        link_answer = MsgBox("Do you wish to open:"+vbCrLf+url+vbCrLf+"In your browser?", yes_no+question_icon+on_foreground, "Open the link?")
        If link_answer = answer_yes Then
            open_in_browser(url)
            to_nowhere = MsgBox("Opening :"+vbCrLf+url, 0+information_icon+on_foreground, "Opening the link!")
        End If
    End If
End Function

Function check_installation(installation_verification_vars)
    'Check if the program has correctly been installed
    Dim command
    Dim homepage
    command = installation_verification_vars(0)
    homepage = installation_verification_vars(1)

    pip_version = get_command_response(command)
    If Len(pip_version) > 0 Then
        pip_version = get_version(pip_version)
        If the_chosen_language = run_french Then
            to_nowhere = MsgBox("Pip a correctement �t� install� sur votre ordinateur !"+vbCrLf+"Sa version est: '"+pip_version+"'", 0+information_icon+on_foreground, "Succ�s !")
        ElseIf the_chosen_language = run_english Then
            to_nowhere = MsgBox("Pip has successfully been installed on to your computer !"+vbCrLf+"It's version is: '"+pip_version+"'", 0+information_icon+on_foreground, "Success !")
        End If
    Else
        If the_chosen_language = run_french Then
            to_nowhere = MsgBox("Une erreur inconnue est survenue !"+vbCrLf+vbCrLf+"L'installation de pip est un �chec"+vbCrLf+vbCrLf+"Merci de bien vouloir ex�cuter ce program � nouveau avec les droits d'administrateur."+vbCrLf+vbCrLf+"Si le probl�me persiste, merci de bien vouloir essayer d'installer python apr�s avoir coch� toutes les options de l'installeur.", 0+error_icon+on_foreground, "�chec de l'installation")
            open_installer_page(homepage)
        Else
            to_nowhere = MsgBox("An unknown error occurred !"+vbCrLf+vbCrLf+"The installation of pip has failed"+vbCrLf+vbCrLf+"Please try running this program with administrator rights."+vbCrLf+vbCrLf+"If the problem is still present, try installing python with all of the options checked.", 0+error_icon+on_foreground, "Installation failed")
            open_installer_page(homepage)
        End If
    End If
End Function

'Starting the program
the_chosen_language = MsgBox("Do you wish to run this script in French", yes_no+question_icon+0, "Language")

If the_chosen_language = run_french Then
    to_nowhere = MsgBox("Vous avez choisis le fran�ais !", 0+information_icon+0, "Fran�ais")
    to_nowhere = MsgBox("Ce program a �t� cr�� par "+the_author, 0+information_icon+0, "L'Autheur du programme")

ElseIf the_chosen_language = run_english Then
    to_nowhere = MsgBox("You have chosen English !", 0+information_icon+0, "English")
    to_nowhere = MsgBox("This program was created by "+the_author, 0+information_icon+0, "The Author of the program")
End If

If the_chosen_language = run_french Then
    warning_response = MsgBox("Ce program est configur� pour, si non pr�sent, t�l�charger l'installateur de python."+vbCrLf+vbCrLf+"La raison de cette manipulation est d�t � la pr�sence du module pip dans l'installeur."+vbCrLf+vbCrLf+"N�anmoins, l'action de t�l�charger un fichier via ce type de programme et parfois consid�r� comme malveillant au yeux des antivirus."+vbCrLf+vbCrLf+"Si cela est le cas, il est possible de t�l�charger en amont l'ex�cutable, fen�tre suivante, pour passer directement � l'installation."+vbCrLf+vbCrLf+"Cela ne fais pas de ce program un programme malveillant."+vbCrLf+vbCrLf+"Si toutefois vous ne faites pas confiance � ce programme, r�pondez 'non' pour avoir les �tapes � suivre pour installer pip sur votre ordinateur, ce sont les �tapes que fais le programme."+vbCrLf+vbCrLf+"Merci de votre compr�hension ;-)"+vbCrLf+vbCrLf+"Oui -> Fen�tre suivante"+vbCrLf+"Non -> Etapes que suis le programme"+vbCrLf+"Annuler -> quitter le programme", yes_no_cancel+warning_icon+on_foreground, "A lire attentivement !")'+blanks)
    If warning_response = answer_yes Then
        warning_response = MsgBox("D�sirez-vous ouvrir la page de l'installeur ?"+vbCrLf+"Lien:"+vbCrLf+url, yes_no+question_icon+0, "Ouvrir le lien ?")
        If warning_response = answer_yes Then
            open_in_browser(url)
            to_nowhere = MsgBox("Ouverture de "+url, 0+information_icon+on_foreground, "Ouverture du lien !")
        End If

    ElseIf warning_response = answer_no Then
        to_nowhere = MsgBox("Les �tapes que fait le program:"+vbCrLf+"1. Demander la langue d�sir�"+vbCrLf+"2. Afficher ce message"+vbCrLf+"3. V�rifier si l'ex�cutable est pr�sent"+vbCrLf+"3.1 Si l'executable n'est pas pr�sent, tenter de le t�l�charger"+vbCrLf+"3.2 Si 3.1 a �t� ex�cut�, v�rifier que l'ex�cutable est pr�sent"+vbCrLf+"4. Lancer l'ex�cutable avec les arguments '/passive' et 'Include_pip=1'"+vbCrLf+"4.1 L'argument '/passive' permet d'afficher la progression de l'installation"+vbCrLf+"4.2 L'argument 'Include_pip=1' permet de cocher la case 'installer pip', pr�sente quand on passe par les options avanc�s de la fen�tre d'installation", 0+information_icon+on_foreground, "Les �tapes que suit le programme")
        to_nowhere = MsgBox("Ce program va maintenant se fermer."+vbCrLf+"Au revoir et � une prochaine fois :-)", 0+information_icon+on_foreground, "Au revoir")
        continue_program = false

    Else
        to_nowhere = MsgBox("Vous avez d�cid� de quitter le programme."+vbCrLf+"Au revoir et � une prochaine fois :-)", 0+information_icon+on_foreground, "Au revoir :-)")
        continue_program = false
    End If

ElseIf the_chosen_language = run_english Then
    warning_response = MsgBox("This program is configured to download, if not present, the python installer."+vbCrLf+vbCrLf+"The reason of the download is because the python installer also has the ability to install pip."+vbCrLf+vbCrLf+"Nethertheless, the simple action of downloading a file using this langage is sometimes considered as malignant by an antivirus."+vbCrLf+vbCrLf+"If this is the case, it is possible to download the executable, next window, to automatically skip to the installation part."+vbCrLf+vbCrLf+"Nethertheless, this does not make this program a malware."+vbCrLf+vbCrLf+"However, if you do not trust this program, click the 'no' box to display the steps to follow to install pip on your computer, these are the exact steps that are done by the program."+vbCrLf+vbCrLf+"Thank you for your comprehension ;-)"+vbCrLf+vbCrLf+"Yes -> Next window"+vbCrLf+"No -> Steps to follow for the installation"+vbCrLf+"Cancel -> Quit the program", yes_no_cancel+warning_icon+on_foreground, "To be read carefully !")'+blanks)
    If warning_response = answer_yes Then
        warning_response = MsgBox("Do you wish to open the page of the installer?"+vbCrLf+"Link:"+vbCrLf+url, yes_no+question_icon+0, "Open the link?")
        If warning_response = answer_yes Then
            open_in_browser(url)
            to_nowhere = MsgBox("Opening "+url, 0+information_icon+on_foreground, "Opening the link !")
        End If

    ElseIf warning_response = answer_no Then
        to_nowhere = MsgBox("The steps executed by the program are: "+vbCrLf+"1. Ask the language preference"+vbCrLf+"2. Display this message"+vbCrLf+"3. Check if the executable is present"+vbCrLf+"3.1 If this is not the case, attempt to download the executable"+vbCrLf+"3.2 If 3.1 was run, check if the executable is present"+vbCrLf+"4. Run the executable with the arguments '/passive' and 'Include_pip=1'"+vbCrLf+"4.1 The argument '/passive' will display the progress of the installation"+vbCrLf+"4.2 The argument 'Include_pip=1' allows to tick the box 'install pip' when in the advanced options of the installer window", 0+information_icon+on_foreground, "The steps followed by the program")
        to_nowhere = MsgBox("This program will now close."+vbCrLf+"Goodbye, see you next time :-)", 0+information_icon+on_foreground, "Goodbye!")
        continue_program = false

    Else
        to_nowhere = MsgBox("You have decided to exit this program."+vbCrLf+"Goodbye, see you next time :-)", 0+information_icon+on_foreground, "Goodbye :-)")
        continue_program = false
    End If
End If

If file_exists(file_name) = true And continue_program = true Then
    run_file(run_info)
    check_installation(installation_verification_vars)

ElseIf continue_program = true Then
    download_a_file(download_info)

    If file_exists(file_name) = true Then
        run_file(run_info)
        check_installation(installation_verification_vars)
    Else
    
        If the_chosen_language = French Then
            to_nowhere = MsgBox("�chec du t�l�chargement d'un fichier n�cessaire pour le bon fonctionnement du programme !"+vbCrLf+"Merci de t�l�charger l'executable se trouvant � cette adresse:"+vbCrLf+url+vbCrLf+"et de le mettre dans le m�me dossier que ce programme"+vbCrLf+"Ensuite, merci d'ex�cuter de programme � nouveau", 0+warning_icon+on_foreground, "�chec du t�l�chargement !")
            open_installer_page(url)
        ElseIf the_chosen_language = English Then
            to_nowhere = MsgBox("Failed to download the required file !"+vbCrLf+"Please download the required executable at:"+vbCrLf+url+vbCrLf+"And put it in the same folder as this program"+vbCrLf+"Then run this program again.", 0+warning_icon+on_foreground, "Download failed!")
            open_installer_page(url)
        End If
    End If
End If
