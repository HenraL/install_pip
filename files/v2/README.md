# Install Pip

## Table of contens
1. [About](#about)
2. [How to run](#how-to-run)
3. [Important note](#important-note)
4. [Program breakdown](#program-breakdown)
    1. [Used libraries](#used-libraries)
    2. [Used links](#used-links)
    3. [Declaring the variables](#declaring-the-variables)
    4. [Declaring the arrays](#declaring-the-arrays)
    5. [Filling the variables](#filling-the-variables)
    6. [Filling the arrays](#filling-the-arrays)
    7. [Declaring the functions](#declaring-the-functions)
        1. [Download a file](#download-a-file)
        2. [Run file](#run-file)
        3. [File exists](#file-exists)
        4. [Open in browser](#open-in-browser)
        5. [Get command response](#get-command-response)
        6. [Get version](#get-version)
        7. [Open installer page](#open-installer-page)
        8. [Check installation](#check-installation)
    8. [Code in the body of the program](#code-in-the-body-of-the-program)
        1. [The questions](#the-questions)
            1. [vbCrLf](#vbcrlf)
            2. [Language](#language)
            3. [If choice = 'French'](#if-choice--french)
            4. [If choice = 'English'](#if-choice--english)
        2. [The Condition blocks](#the-condition-blocks)
            1. [Inform of the chosen language](#inform-of-the-chosen-language)
            2. [Inform user that the program is not dangerous](#inform-user-that-the-program-is-not-dangerous)
                1. [French](#french)
                2. [English](#english)
            3. [Attempt the installation](#attempt-the-installation)
    9. [The totality of the code](#the-totality-of-the-code)
5. [What the online scanners think of it](#what-the-online-scanners-think-of-it)

## About

This program is a script written in `vbs` for `windows` to help users easily install the `pip` package for the `python` language.

## How to run

1. Download the script on to your computer
2. Run the script
3. Follow the windows throughout the installation

## Important note:

An internet connection is required during the installation process.

## Program breakdown
### Used libraries
!! vbs is case insensitive when it comes to importing libraries or system function (ex: If), thus 'WScript.Shell' if the same as 'wscript.shell' !!
Libraries:
* "WinHttp.WinHttpRequest.5.1" : library used here to send a query on the internet
* "Adodb.Stream" : library used here to write content to a file
* "Scripting.FileSystemObject" : library used here to check if a file exists
* "wscript.shell" : library used here to run a program, open a link

### Used links
Links:
* '[https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe](https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe)' : The python 3.10.4 executable (the executable's download page can be found here :[https://www.python.org/downloads/release/python-3104/](https://www.python.org/downloads/release/python-3104/))
* '[https://www.python.org/downloads/](https://www.python.org/downloads/)' : The python download page (that is where you can get the latest version of python)

### Declaring the variables
The keyword `Dim` is used for declaring a variable, an array.
```vbs
Dim FSO 'for the fso library
Dim run_french 'the button answer if French is chosen
Dim run_english 'the button answer if English is chosen
Dim file_name 'the name of the downloaded file
Dim url  'the link to the file that will be downloaded
Dim arguments 'the arguments that will be applied when running the program in 'file_name'
Dim to_nowhere 'used to store the answer of Msgbox (message window function)
Dim the_chosen_language 'the answer provided by the language question
Dim link_answer 'store the answer of the Msgbox asking for the preferred langage
Dim answer_yes 'the button answer if yes is chosen
Dim answer_no 'the button answer if no is chosen
Dim on_foreground 'the value to set the window on the foreground until closed
Dim warning_icon 'the value to inform to display a warning icon
Dim information_icon 'the value to inform to display an information icon
Dim question_icon 'the value to inform to display a question icon
Dim error_icon 'the value to inform to display an error icon
Dim yes_no_cancel 'the value to inform to display the buttons yes, no and cancel in the window
Dim yes_no 'the value to inform to display the yes, no buttons in the window
Dim continue_program 'boolean to inform if the program is to continue running or stop
Dim answer_cancel 'the button answer if cancel is chosen
Dim warning_response 'store the answer of the Msgbox from the warning window
Dim pip_version 'store the version of pip (gathered after installation of it)
Dim the_author 'store the name of the author of the program (Henry Letellier)
Dim checking_command 'store the command to run to test if pip is installed
Dim installer_homepage 'store the homepage of where the executable can be found
```
### Declaring the arrays
The arrays are used to pass more than one argument in some of the functions of this script.
```vbs
Dim download_info(2) 'store filename and link for the download
Dim run_info(2) 'store the filename and arguments for the execution
Dim installation_verification_vars(2) 'store the checking command and installer homepage so that on fail, the executable can be downloaded
```
### Filling the variables
This is done to try and allow an easier maintenance of the program.
```vbs
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
```
### Filling the arrays
```vbs
download_info(0) = file_name 'Array containing the url and the file_name of the file to download
download_info(1) = url

run_info(0) = file_name 'Array containing the file_name and the arguments to use when the script (in the file variable) will be run
run_info(1) = arguments

installation_verification_vars(0) = checking_command 'Array containing the commandline to check the version of the program and the fallback installer if the installation failed
installation_verification_vars(1) = installer_homepage
```
### Declaring the functions
These are the functions used in the program
#### Download a file
```vbs
Function download_a_file(download_info)
    ' Download a file from the internet
    'loading the WinHttp library
    dim xHttp: Set xHttp = createobject("WinHttp.WinHttpRequest.5.1")
    'loading the Adodb library
    dim bStrm: Set bStrm = createobject("Adodb.Stream")
    'declaring the url variable
    dim url
    'declaring the file_name variable
    dim file_name
    'assining element 2 of the array 'download_info' to the url variable
    url = download_info(1)
    'assining element 1 of the array 'download_info' to the file_name variable
    file_name = download_info(0)
    'Fetching the content at the link in the 'url' variable
    xHttp.Open "GET", url, False
    xHttp.Send

    'writing store content to a file whose name is contained in the file_name variable
    with bStrm
        .type = 1 '//binary
        .open
        .write xHttp.responseBody
        .savetofile file_name, 2 '//overwrite
    end with

    'closing the file
    bStrm.close
End Function
```
#### Run file
```vbs
Function run_file(run_info)
    'Run a file as if it was in the terminal
    'declaring variables shl, file_name, arguments and command
    Dim shl
    Dim file_name
    Dim arguments
    Dim command
    'assining element 1 of the run_info array to file_name
    file_name = run_info(0)
    'assining element 2 of the run_info array to arguments
    arguments = run_info(1)
    'compiling file_name with the required command to the command variable
    command = "cmd /c "+Chr(34)+file_name+" "+arguments+Chr(34)
    'loading the 'Scripting.FileSystemObject' library
    Set fso = CreateObject("Scripting.FileSystemObject" )
    'loading the 'wscript.shell' library
    set shl = createobject("wscript.shell")
    'Running the content contained in the variable 'command' and wait for it to finish
    shl.run command,1,True

End Function
```
#### File exists
```vbs
Function file_exists(file_path)
    'Check if the specified file exists
    'loading the library "Scripting.FileSystemObject"
    set FSO = CreateObject("Scripting.FileSystemObject")
    'cheking if the file exist
    If fso.FileExists(file_path) Then
        'if true, return true
        file_exists = true
        'end the function
        Exit Function
    Else
        'otherwise, return false
        file_exists = false
        'end the function
        Exit Function
        'close the if verifications
    End If
End Function
```
#### Open in browser
```vbs
Function open_in_browser(url)
    'Open a link in the browser
    'load the library "WScript.Shell" and open the link contained in the variable
    CreateObject("WScript.Shell").Run(url)
End Function
```
#### Get command response
```vbs
Function get_command_response(command)
    'Run a command and read the output on line 0
    'declare the variable the_result
    Dim the_result
    'assign '' to the variable the_result
    the_result = ""
    'build the command into the variable command
    command = "cmd /c "+Chr(34)+command+Chr(34)
    'load the library "Wscript.Shell"
    set wso = CreateObject("Wscript.Shell")
    'run and store the output of the variable "command"
    set exe = wso.Exec(command)
    'loop through the content until 'end character' found 
    Do Until exe.StdOut.AtEndOfStream
        'convert the array content to a long string and store it in the variable 'the_result'
        the_result=the_result+vbCrLf+exe.StdOut.ReadLine
    Loop
    'Return the content of the variable 'the_result'
    get_command_response=the_result
End Function
```
#### Get version
```vbs
Function get_version(strInput)
    'Isolate the version from a string input
    'Declare the variables version_result, stop_char, version_found, stop_delay, strLength, authedChar, ignored_chars
    Dim version_result
    Dim stop_char
    Dim version_found
    Dim stop_delay
    Dim strLength
    Dim authedChar
    Dim ignored_chars

    'assign "" content to version_result
    version_result = ""
    'assign " " content to stop_char
    stop_char = " "
    'assign "false" content to version_found
    version_found = false
    'assign 1 content to stop_delay
    stop_delay = 1
    'assign "Len(strInput)" content to strLength
    strLength = Len(strInput)
    'assign "." content to authedChar
    authedChar = "."
    'assign "0" content to ignored_chars
    ignored_chars = 0

    'loop through the content of the length taken of the content from the variable strInput
    For intChar = 1 To strLength
        'If the current character is a number and the variable 'version_found' is false
        If IsNumeric(Mid(strInput, intChar, 1)) And version_found = false Then
            'add the character to the variable 'version_result'
            version_result=version_result+Mid(strInput, intChar, 1)
        'If the current character is equal to the content of the variable 'authedChar and the variable 'version_found' is false
        ElseIf Mid(strInput, intChar, 1) = authedChar And version_found = false Then
            'add the character to the variable 'version_result'
            version_result=version_result+Mid(strInput, intChar, 1)
        'If the current character is equal to the content of the variable 'stop_char'
        ElseIf Mid(strInput, intChar, 1) = stop_char And version_found = false Then
            'if the variable 'stop_delay' is greater than 0
            If stop_delay > 0 Then
                'substract 1 to stop_delay
                stop_delay = stop_delay - 1
            'Otherwise
            Else
                'set 'version_found' to true
                version_found = true
                'exit the loop
                Exit For
            End If
        'otherwise
        Else
            'add 1 to ignored_chars
            ignored_chars = ignored_chars+1
        End If
    Next
    'return version_result
    get_version = version_result

End Function
```
#### Open installer page
```vbs
Function open_installer_page(url)
    'Ask if user wishes to open the given url
    'If language is set to french
    If the_chosen_language = run_french Then
        'Display window offering the choice to open the ling of the 'url' variable in their browser
        link_answer = MsgBox("Désirez-vous ouvrir:"+vbCrLf+url+vbCrLf+"Dans votre navigateur ?", yes_no+question_icon+on_foreground, "Ouvrir le lien ?")
        'If the answer is equal to the content of the variable 'answer_yes'
        If link_answer = answer_yes Then
            'Call function open_in_browser
            open_in_browser(url)
            'Inform the user (via a window) that the link is being opened
            to_nowhere = MsgBox("Ouverture de :"+vbCrLf+url, 0+information_icon+on_foreground, "Ouverture du lien !")
        End If
    'Otherwise, if the language corresponds to the content of the variable 'run_english'
    ElseIf the_chosen_language = run_english Then
        'Display window offering the choice to open the ling of the 'url' variable in their browser
        link_answer = MsgBox("Do you wish to open:"+vbCrLf+url+vbCrLf+"In your browser?", yes_no+question_icon+on_foreground, "Open the link?")
        'If the answer is equal to the content of the variable 'answer_yes'
        If link_answer = answer_yes Then
            'Call function open_in_browser
            open_in_browser(url)
            'Inform the user (via a window) that the link is being opened
            to_nowhere = MsgBox("Opening :"+vbCrLf+url, 0+information_icon+on_foreground, "Opening the link!")
        End If
    End If
End Function
```
#### Check installation
```vbs
Function check_installation(installation_verification_vars)
    'Check if the program has correctly been installed
    'Declare the variables command, homepage
    Dim command
    Dim homepage
    'Assing element 1 of the array installation_verification to the variable 'command'
    command = installation_verification_vars(0)
    'Assing element 2 of the array installation_verification to the variable 'homepage'
    homepage = installation_verification_vars(1)

    'Store the result of 'get_command_response(command)' in 'pip_version'
    pip_version = get_command_response(command)
    'If the length of the variable 'pip_version' is greater than 0
    If Len(pip_version) > 0 Then
        'extract the version from the content of pip_version
        pip_version = get_version(pip_version)
        'If 'the_chosen_language' is equal to the content of the variable 'run_french'
        If the_chosen_language = run_french Then
            'Display a window informing the user that pip was successfully installed
            to_nowhere = MsgBox("Pip a correctement été installé sur votre ordinateur !"+vbCrLf+"Sa version est: '"+pip_version+"'", 0+information_icon+on_foreground, "Succès !")
        'If 'the_chosen_language' is equal the content of the variable 'run_english'
        ElseIf the_chosen_language = run_english Then
            'Display a window informing the user that pip was successfully installed
            to_nowhere = MsgBox("Pip has successfully been installed on to your computer !"+vbCrLf+"It's version is: '"+pip_version+"'", 0+information_icon+on_foreground, "Success !")
        End If
    'Otherwise
    Else
        'If the content of the variable 'the_chosen_language' is equal to the content of the variable 'run_french'
        If the_chosen_language = run_french Then
            'Display a window informing the user that pip failed to installed
            to_nowhere = MsgBox("Une erreur inconnue est survenue !"+vbCrLf+vbCrLf+"L'installation de pip est un échec"+vbCrLf+vbCrLf+"Merci de bien vouloir exécuter ce program à nouveau avec les droits d'administrateur."+vbCrLf+vbCrLf+"Si le problème persiste, merci de bien vouloir essayer d'installer python après avoir coché toutes les options de l'installeur.", 0+error_icon+on_foreground, "Échec de l'installation")
            'Call the function open_installer_page
            open_installer_page(homepage)
        'If 'the_chosen_language' is equal the content of the variable 'run_english'
        Else
            'Display a window informing the user that pip failed to installed
            to_nowhere = MsgBox("An unknown error occurred !"+vbCrLf+vbCrLf+"The installation of pip has failed"+vbCrLf+vbCrLf+"Please try running this program with administrator rights."+vbCrLf+vbCrLf+"If the problem is still present, try installing python with all of the options checked.", 0+error_icon+on_foreground, "Installation failed")
            'Call the function open_installer_page
            open_installer_page(homepage)
        End If
    End If
End Function
```
### Code in the body of the program
This is the section about the code that is not in functions and that is not a variable declaration.
#### The questions
##### vbCrLf
```vbs
vbCrLf
Usage:
"text"+vbCrLf+"text2"
Description:
Add a new line in a vbs message.
```
##### Language
```vbs
'Ask for the preferred language and store it in the variable 'the_chosen_language'
the_chosen_language = MsgBox("Do you wish to run this script in French", yes_no+question_icon+0, "Language")
```
##### If choice = 'French'
```vbs
'Ask the user, what they wish to do (once that they have been informed that despite the antivirus potentially considering this script as a threat) that there is nothing to worry about.
' [The reason an antivirus might consider this script as a virus is due to people using this language in the past to create a malware (thus, the reason for this very long and line-per-line explanation of the program)]

warning_response = MsgBox("Ce program est configuré pour, si non présent, télécharger l'installateur de python."+vbCrLf+vbCrLf+"La raison de cette manipulation est dût à la présence du module pip dans l'installeur."+vbCrLf+vbCrLf+"Néanmoins, l'action de télécharger un fichier via ce type de programme et parfois considéré comme malveillant au yeux des antivirus."+vbCrLf+vbCrLf+"Si cela est le cas, il est possible de télécharger en amont l'exécutable, fenêtre suivante, pour passer directement à l'installation."+vbCrLf+vbCrLf+"Cela ne fais pas de ce program un programme malveillant."+vbCrLf+vbCrLf+"Si toutefois vous ne faites pas confiance à ce programme, répondez 'non' pour avoir les étapes à suivre pour installer pip sur votre ordinateur, ce sont les étapes que fais le programme."+vbCrLf+vbCrLf+"Merci de votre compréhension ;-)"+vbCrLf+vbCrLf+"Oui -> Fenêtre suivante"+vbCrLf+"Non -> Etapes que suis le programme"+vbCrLf+"Annuler -> quitter le programme", yes_no_cancel+warning_icon+on_foreground, "A lire attentivement !")

' Ask if the user whishes to open the link contained in the variable 'url'
warning_response = MsgBox("Désirez-vous ouvrir la page de l'installeur ?"+vbCrLf+"Lien:"+vbCrLf+url, yes_no+question_icon+0, "Ouvrir le lien ?")
```

##### If choice = 'English'

```vbs
'Ask the user, what they wish to do (once that they have been informed that despite the antivirus potentially considering this script as a threat) that there is nothing to worry about.
' [The reason an antivirus might consider this script as a virus is due to people using this language in the past to create a malware (thus, the reason for this very long and line-per-line explanation of the program)]

warning_response = MsgBox("This program is configured to download, if not present, the python installer."+vbCrLf+vbCrLf+"The reason of the download is because the python installer also has the ability to install pip."+vbCrLf+vbCrLf+"Nethertheless, the simple action of downloading a file using this langage is sometimes considered as malignant by an antivirus."+vbCrLf+vbCrLf+"If this is the case, it is possible to download the executable, next window, to automatically skip to the installation part."+vbCrLf+vbCrLf+"Nethertheless, this does not make this program a malware."+vbCrLf+vbCrLf+"However, if you do not trust this program, click the 'no' box to display the steps to follow to install pip on your computer, these are the exact steps that are done by the program."+vbCrLf+vbCrLf+"Thank you for your comprehension ;-)"+vbCrLf+vbCrLf+"Yes -> Next window"+vbCrLf+"No -> Steps to follow for the installation"+vbCrLf+"Cancel -> Quit the program", yes_no_cancel+warning_icon+on_foreground, "To be read carefully !")

' Ask if the user whishes to open the link contained in the variable 'url'
warning_response = MsgBox("Do you wish to open the page of the installer?"+vbCrLf+"Link:"+vbCrLf+url, yes_no+question_icon+0, "Open the link?")

```
#### The Condition blocks
This part will cover the if statements contained in the main body of the file
##### Inform of the chosen language
```vbs
'If the content of the variable 'the_chosen_language' is equal to the content of the variable 'run_french'
If the_chosen_language = run_french Then
    ' Display a window confirming the choice of the language to the user
    to_nowhere = MsgBox("Vous avez choisis le français !", 0+information_icon+0, "Français")
    ' Display a window giving the name of the author of the program (Henry Letellier)
    to_nowhere = MsgBox("Ce program a été créé par "+the_author, 0+information_icon+0, "L'Autheur du programme")

'If the content of the variable 'the_chosen_language' is equal to the content of the variable 'run_english'
ElseIf the_chosen_language = run_english Then
    ' Display a window confirming the choice of the language to the user
    to_nowhere = MsgBox("You have chosen English !", 0+information_icon+0, "English")
    ' Display a window giving the name of the author of the program (Henry Letellier)
    to_nowhere = MsgBox("This program was created by "+the_author, 0+information_icon+0, "The Author of the program")
End If
```
##### Inform user that the program is not dangerous
This is the information section and also the moment when you can chose to exit the program (if started twice for example)
###### French
```vbs
'If the content of the variable 'the_chosen_language' is equal to the content of the variable 'run_french'
If the_chosen_language = run_french Then
    'Display warning window
    warning_response = MsgBox("Ce program est configuré pour, si non présent, télécharger l'installateur de python."+vbCrLf+vbCrLf+"La raison de cette manipulation est dût à la présence du module pip dans l'installeur."+vbCrLf+vbCrLf+"Néanmoins, l'action de télécharger un fichier via ce type de programme et parfois considéré comme malveillant au yeux des antivirus."+vbCrLf+vbCrLf+"Si cela est le cas, il est possible de télécharger en amont l'exécutable, fenêtre suivante, pour passer directement à l'installation."+vbCrLf+vbCrLf+"Cela ne fais pas de ce program un programme malveillant."+vbCrLf+vbCrLf+"Si toutefois vous ne faites pas confiance à ce programme, répondez 'non' pour avoir les étapes à suivre pour installer pip sur votre ordinateur, ce sont les étapes que fais le programme."+vbCrLf+vbCrLf+"Merci de votre compréhension ;-)"+vbCrLf+vbCrLf+"Oui -> Fenêtre suivante"+vbCrLf+"Non -> Etapes que suis le programme"+vbCrLf+"Annuler -> quitter le programme", yes_no_cancel+warning_icon+on_foreground, "A lire attentivement !")
    'If the content of the variable 'warning_response' is equal to the content of the variable 'answer_yes'
    If warning_response = answer_yes Then
        'Display message offering to open the link to the installer
        warning_response = MsgBox("Désirez-vous ouvrir la page de l'installeur ?"+vbCrLf+"Lien:"+vbCrLf+url, yes_no+question_icon+0, "Ouvrir le lien ?")
        'If the content of the variable 'warning_response' is equal to the variable 'answer_yes'
        If warning_response = answer_yes Then
            'Call the function open_in_browser
            open_in_browser(url)
            'Display message informing that the link is being opened
            to_nowhere = MsgBox("Ouverture de "+url, 0+information_icon+on_foreground, "Ouverture du lien !")
        End If
    'If the content of the variable 'warning_response' is equal to the content of the variable 'answer_no'
    ElseIf warning_response = answer_no Then
        'Display message with the different stages followed by the program
        to_nowhere = MsgBox("Les étapes que fait le program:"+vbCrLf+"1. Demander la langue désirée"+vbCrLf+"2. Afficher ce message"+vbCrLf+"3. Vérifier si l'exécutable est présent"+vbCrLf+"3.1 Si l'executable n'est pas présent, tenter de le télécharger"+vbCrLf+"3.2 Si 3.1 a été exécuté, vérifier que l'exécutable est présent"+vbCrLf+"4. Lancer l'exécutable avec les arguments '/passive' et 'Include_pip=1'"+vbCrLf+"4.1 L'argument '/passive' permet d'afficher la progression de l'installation"+vbCrLf+"4.2 L'argument 'Include_pip=1' permet de cocher la case 'installer pip', présente quand on passe par les options avancées de la fenêtre d'installation", 0+information_icon+on_foreground, "Les étapes que suit le programme")
        'Display a message informing the user that the program will terminate
        to_nowhere = MsgBox("Ce program va maintenant se fermer."+vbCrLf+"Au revoir et à une prochaine fois :-)", 0+information_icon+on_foreground, "Au revoir")
        continue_program = false
    
    'Otherwise
    Else
        'Display a message informing the user that the program will close
        to_nowhere = MsgBox("Vous avez décidé de quitter le programme."+vbCrLf+"Au revoir et à une prochaine fois :-)", 0+information_icon+on_foreground, "Au revoir :-)")
        'set the content of the variable 'continue_program' to false
        continue_program = false
    End If
```
###### English

```vbs
'If the content of the variable 'the_chosen_language' is equal to the content of the variable 'run_english'
ElseIf the_chosen_language = run_english Then
    'Display warning window
    warning_response = MsgBox("This program is configured to download, if not present, the python installer."+vbCrLf+vbCrLf+"The reason of the download is because the python installer also has the ability to install pip."+vbCrLf+vbCrLf+"Nethertheless, the simple action of downloading a file using this langage is sometimes considered as malignant by an antivirus."+vbCrLf+vbCrLf+"If this is the case, it is possible to download the executable, next window, to automatically skip to the installation part."+vbCrLf+vbCrLf+"Nethertheless, this does not make this program a malware."+vbCrLf+vbCrLf+"However, if you do not trust this program, click the 'no' box to display the steps to follow to install pip on your computer, these are the exact steps that are done by the program."+vbCrLf+vbCrLf+"Thank you for your comprehension ;-)"+vbCrLf+vbCrLf+"Yes -> Next window"+vbCrLf+"No -> Steps to follow for the installation"+vbCrLf+"Cancel -> Quit the program", yes_no_cancel+warning_icon+on_foreground, "To be read carefully !")
    'If the content of the variable 'warning_response' is equal to the content of the variable 'answer_yes'
    If warning_response = answer_yes Then
        warning_response = MsgBox("Do you wish to open the page of the installer?"+vbCrLf+"Link:"+vbCrLf+url, yes_no+question_icon+0, "Open the link?")
        'If the content of the variable 'warning_response' is equal to the variable 'answer_yes'
        If warning_response = answer_yes Then
            'Call the function open_in_browser
            open_in_browser(url)
            'Display message informing that the link is being opened
            to_nowhere = MsgBox("Opening "+url, 0+information_icon+on_foreground, "Opening the link !")
        End If

    'If the content of the variable 'warning_response' is equal to the content of the variable 'answer_no'
    ElseIf warning_response = answer_no Then
        'Display message with the different stages followed by the program
        to_nowhere = MsgBox("The steps executed by the program are: "+vbCrLf+"1. Ask the language preference"+vbCrLf+"2. Display this message"+vbCrLf+"3. Check if the executable is present"+vbCrLf+"3.1 If this is not the case, attempt to download the executable"+vbCrLf+"3.2 If 3.1 was run, check if the executable is present"+vbCrLf+"4. Run the executable with the arguments '/passive' and 'Include_pip=1'"+vbCrLf+"4.1 The argument '/passive' will display the progress of the installation"+vbCrLf+"4.2 The argument 'Include_pip=1' allows to tick the box 'install pip' when in the advanced options of the installer window", 0+information_icon+on_foreground, "The steps followed by the program")
        'Display a message informing the user that the program will terminate
        to_nowhere = MsgBox("This program will now close."+vbCrLf+"Goodbye, see you next time :-)", 0+information_icon+on_foreground, "Goodbye!")
        continue_program = false

    'Otherwise
    Else
        'Display a message informing the user that the program will close
        to_nowhere = MsgBox("You have decided to exit this program."+vbCrLf+"Goodbye, see you next time :-)", 0+information_icon+on_foreground, "Goodbye :-)")
        'set the content of the variable 'continue_program' to false
        continue_program = false
    End If
End If
```
##### Attempt the installation
```vbs
'If the file exists and the content of the variable 'continue_program' is true
If file_exists(file_name) = true And continue_program = true Then
    ' Call the function run_file
    run_file(run_info)
    ' Call the function check_installation
    check_installation(installation_verification_vars)

'If the content of the variable 'continue_program' is true
ElseIf continue_program = true Then
    'Call the function download_a_file
    download_a_file(download_info)

    'If the file exists
    If file_exists(file_name) = true Then
        'Call the function run_file
        run_file(run_info)
        'Call the function check_installation
        check_installation(installation_verification_vars)
    'Otherwise
    Else
        'If the content of the variable 'the_chosen_language' is equal to the content of the variable 'run_french'
        If the_chosen_language = run_french Then
            'Display a message informing that the download of the required files has failed
            to_nowhere = MsgBox("Échec du téléchargement d'un fichier nécessaire pour le bon fonctionnement du programme !"+vbCrLf+"Merci de télécharger l'executable se trouvant à cette adresse:"+vbCrLf+url+vbCrLf+"et de le mettre dans le même dossier que ce programme"+vbCrLf+"Ensuite, merci d'exécuter de programme à nouveau", 0+warning_icon+on_foreground, "Échec du téléchargement !")
            'Call the function open_installer_page
            open_installer_page(url)
        
        'If the content of the variable 'the_chosen_language' is equal to the content of the variable 'run_english'
        ElseIf the_chosen_language = run_english Then
            'Display a message informing that the download of the required files has failed
            to_nowhere = MsgBox("Failed to download the required file !"+vbCrLf+"Please download the required executable at:"+vbCrLf+url+vbCrLf+"And put it in the same folder as this program"+vbCrLf+"Then run this program again.", 0+warning_icon+on_foreground, "Download failed!")
            'Call the function open_installer_page
            open_installer_page(url)
        End If
    End If
End If

```
### The totality of the code
```vbs
'Encoding of the file: Windows1252
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
        link_answer = MsgBox("Désirez-vous ouvrir:"+vbCrLf+url+vbCrLf+"Dans votre navigateur ?", yes_no+question_icon+on_foreground, "Ouvrir le lien ?")
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
            to_nowhere = MsgBox("Pip a correctement été installé sur votre ordinateur !"+vbCrLf+"Sa version est: '"+pip_version+"'", 0+information_icon+on_foreground, "Succès !")
        ElseIf the_chosen_language = run_english Then
            to_nowhere = MsgBox("Pip has successfully been installed on to your computer !"+vbCrLf+"It's version is: '"+pip_version+"'", 0+information_icon+on_foreground, "Success !")
        End If
    Else
        If the_chosen_language = run_french Then
            to_nowhere = MsgBox("Une erreur inconnue est survenue !"+vbCrLf+vbCrLf+"L'installation de pip est un échec"+vbCrLf+vbCrLf+"Merci de bien vouloir exécuter ce program à nouveau avec les droits d'administrateur."+vbCrLf+vbCrLf+"Si le problème persiste, merci de bien vouloir essayer d'installer python après avoir coché toutes les options de l'installeur.", 0+error_icon+on_foreground, "échec de l'installation")
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
    to_nowhere = MsgBox("Vous avez choisis le français !", 0+information_icon+0, "Français")
    to_nowhere = MsgBox("Ce program a été créé par "+the_author, 0+information_icon+0, "L'Autheur du programme")

ElseIf the_chosen_language = run_english Then
    to_nowhere = MsgBox("You have chosen English !", 0+information_icon+0, "English")
    to_nowhere = MsgBox("This program was created by "+the_author, 0+information_icon+0, "The Author of the program")
End If

If the_chosen_language = run_french Then
    warning_response = MsgBox("Ce program est configuré pour, si non présent, télécharger l'installateur de python."+vbCrLf+vbCrLf+"La raison de cette manipulation est dût à la présence du module pip dans l'installeur."+vbCrLf+vbCrLf+"Néanmoins, l'action de télécharger un fichier via ce type de programme et parfois considéré comme malveillant au yeux des antivirus."+vbCrLf+vbCrLf+"Si cela est le cas, il est possible de télécharger en amont l'exécutable, fenêtre suivante, pour passer directement à l'installation."+vbCrLf+vbCrLf+"Cela ne fais pas de ce program un programme malveillant."+vbCrLf+vbCrLf+"Si toutefois vous ne faites pas confiance à ce programme, répondez 'non' pour avoir les étapes à suivre pour installer pip sur votre ordinateur, ce sont les étapes que fais le programme."+vbCrLf+vbCrLf+"Merci de votre compréhension ;-)"+vbCrLf+vbCrLf+"Oui -> Fenêtre suivante"+vbCrLf+"Non -> Etapes que suis le programme"+vbCrLf+"Annuler -> quitter le programme", yes_no_cancel+warning_icon+on_foreground, "A lire attentivement !")
    If warning_response = answer_yes Then
        warning_response = MsgBox("Désirez-vous ouvrir la page de l'installeur ?"+vbCrLf+"Lien:"+vbCrLf+url, yes_no+question_icon+0, "Ouvrir le lien ?")
        If warning_response = answer_yes Then
            open_in_browser(url)
            to_nowhere = MsgBox("Ouverture de "+url, 0+information_icon+on_foreground, "Ouverture du lien !")
        End If

    ElseIf warning_response = answer_no Then
        to_nowhere = MsgBox("Les étapes que fait le program:"+vbCrLf+"1. Demander la langue désirée"+vbCrLf+"2. Afficher ce message"+vbCrLf+"3. Vérifier si l'exécutable est présent"+vbCrLf+"3.1 Si l'executable n'est pas présent, tenter de le télécharger"+vbCrLf+"3.2 Si 3.1 a été exécuté, vérifier que l'exécutable est présent"+vbCrLf+"4. Lancer l'exécutable avec les arguments '/passive' et 'Include_pip=1'"+vbCrLf+"4.1 L'argument '/passive' permet d'afficher la progression de l'installation"+vbCrLf+"4.2 L'argument 'Include_pip=1' permet de cocher la case 'installer pip', présente quand on passe par les options avancées de la fenêtre d'installation", 0+information_icon+on_foreground, "Les étapes que suit le programme")
        to_nowhere = MsgBox("Ce program va maintenant se fermer."+vbCrLf+"Au revoir et à une prochaine fois :-)", 0+information_icon+on_foreground, "Au revoir")
        continue_program = false

    Else
        to_nowhere = MsgBox("Vous avez décidé de quitter le programme."+vbCrLf+"Au revoir et à une prochaine fois :-)", 0+information_icon+on_foreground, "Au revoir :-)")
        continue_program = false
    End If

ElseIf the_chosen_language = run_english Then
    warning_response = MsgBox("This program is configured to download, if not present, the python installer."+vbCrLf+vbCrLf+"The reason of the download is because the python installer also has the ability to install pip."+vbCrLf+vbCrLf+"Nethertheless, the simple action of downloading a file using this langage is sometimes considered as malignant by an antivirus."+vbCrLf+vbCrLf+"If this is the case, it is possible to download the executable, next window, to automatically skip to the installation part."+vbCrLf+vbCrLf+"Nethertheless, this does not make this program a malware."+vbCrLf+vbCrLf+"However, if you do not trust this program, click the 'no' box to display the steps to follow to install pip on your computer, these are the exact steps that are done by the program."+vbCrLf+vbCrLf+"Thank you for your comprehension ;-)"+vbCrLf+vbCrLf+"Yes -> Next window"+vbCrLf+"No -> Steps to follow for the installation"+vbCrLf+"Cancel -> Quit the program", yes_no_cancel+warning_icon+on_foreground, "To be read carefully !")
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
    
        If the_chosen_language = run_french Then
            to_nowhere = MsgBox("échec du téléchargement d'un fichier nécessaire pour le bon fonctionnement du programme !"+vbCrLf+"Merci de télécharger l'executable se trouvant à cette adresse:"+vbCrLf+url+vbCrLf+"et de le mettre dans le même dossier que ce programme"+vbCrLf+"Ensuite, merci d'exécuter de programme à nouveau", 0+warning_icon+on_foreground, "échec du téléchargement !")
            open_installer_page(url)
        ElseIf the_chosen_language = run_english Then
            to_nowhere = MsgBox("Failed to download the required file !"+vbCrLf+"Please download the required executable at:"+vbCrLf+url+vbCrLf+"And put it in the same folder as this program"+vbCrLf+"Then run this program again.", 0+warning_icon+on_foreground, "Download failed!")
            open_installer_page(url)
        End If
    End If
End If

```
## What the online scanners think of it

I have included it because I know that, that is what people turn to when they do not trust a script, but note that their method of detection is close to useless.

If you wish to ensure that the vbs program does not attempt to access the internet, go to [https://www.python.org/downloads/](https://www.python.org/downloads/) and download the python installer. Thus, only the installer will (if it needs to) access the internet and retrieve the files it needs.

Note that the webite the vbs and this README file are referring to is the official python website.

DrWeb:
    * Scan result: [install_pip.vbs - Ok](https://online273.drweb.com/cache/?i=1ff451ce0a706304955efeb7364e172e)
    * Website homepage: [https://vms.drweb.com/scan_file/](https://vms.drweb.com/scan_file/)


INTERNXT:
    * Scan result: safe, all is done via cache, so no web results this time
    * Website homepage: [https://internxt.com/virus-scanner](https://internxt.com/virus-scanner)

<!-- I have hidden it, but I do not understand why it finds a false positive (and yes, I know that it says that it is a trojan [I have emailed-them to try and understand this detection]) -->
<!-- Kaspersky:
    * Scan result: [1 false positive](https://opentip.kaspersky.com/0F4BA2667684C461976E50D79D3DBE32248A1E1D8C5ACC3637C457FA00825F20/)
    * Website homepage: [https://opentip.kaspersky.com/](https://opentip.kaspersky.com/) -->

Jotti:
    * Scan result: [Safe](https://virusscan.jotti.org/fr-FR/filescanjob/77l94etxxu)
    * Website homepage: [https://virusscan.jotti.org/](https://virusscan.jotti.org/)

<!-- I have hidden it, but I do not understand why it finds a false positive -->
<!-- Opswat:
    * Scan result: [1 false positive](https://metadefender.opswat.com/results/file/bzIyMDcxMVNMYXJIcnc0eWpNeG0yNEo5dXU/regular/overview)
    * Website homepage: [https://metadefender.opswat.com/#!/](https://metadefender.opswat.com/#!/) -->

<!-- I have hidden it because, the section Anti-Virus Scan Results for OPSWAT Metadefender does not provide the same results as the OPSWAT website itself -->
<!-- Hybrid analysis:
    * Scan result: [No threats](https://www.hybrid-analysis.com/sample/0f4ba2667684c461976e50d79d3dbe32248a1e1d8c5acc3637c457fa00825f20) (The threats it has flagged is just the python executable being downloaded [just look at the screenshots of the machines])
    * Website homepage: [https://www.hybrid-analysis.com/](https://www.hybrid-analysis.com/) -->

Virustotal:
    * Scan result: [4 false positives](https://www.virustotal.com/gui/file/82c0943515defccead36eda4837819929ea64367c4e65521749935189de6320c) (The file has flagged viruses just because it downloads the python executable using 'YOUR' consent and all the links it follows are presented to you when it asks for your confirmation)
    * Website homepage: [https://www.virustotal.com/gui/home/upload](https://www.virustotal.com/gui/home/upload)
