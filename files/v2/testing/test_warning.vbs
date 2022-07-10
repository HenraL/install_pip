Dim to_nowhere
Dim on_foreground
Dim warning_icon
Dim yes_no_cancel
Dim answer_yes
Dim answer_no
Dim answer_cancel
Dim warning_response
Dim url
Dim yes_no
Dim question_icon
Dim continue_program
Dim information_icon

' Dim blanks
on_foreground = 4096
warning_icon = 48
yes_no_cancel = 3
answer_yes = 6
answer_no = 7
answer_cancel = 3
warning_response = ""
url = "https://www.google.com"
yes_no = 4
question_icon = 32
continue_program = true
information_icon = 64
' blanks = ".                 ."

warning_response = MsgBox("Ce program est configur� pour, si non pr�sent, t�l�charger l'installateur de python."+vbCrLf+vbCrLf+"La raison de cette manipulation est d�t � la pr�sence du module pip dans l'installeur."+vbCrLf+vbCrLf+"N�anmoins, l'action de t�l�charger un fichier via ce type de programme et parfois consid�r� comme malveillant au yeux des antivirus."+vbCrLf+vbCrLf+"Si cela est le cas, il est possible de t�l�charger en amont l'ex�cutable, fen�tre suivante, pour passer directement � l'installation."+vbCrLf+vbCrLf+"Cela ne fais pas de ce program un programme malveillant."+vbCrLf+vbCrLf+"Si toutefois vous ne faites pas confiance � ce programme, r�pondez 'non' pour avoir les �tapes � suivre pour installer pip sur votre ordinateur, ce sont les �tapes que fais le programme."+vbCrLf+vbCrLf+"Merci de votre compr�hension ;-)"+vbCrLf+vbCrLf+"Oui -> Fen�tre suivante"+vbCrLf+"Non -> Etapes que suis le programme"+vbCrLf+"Annuler -> quitter le programme", yes_no_cancel+warning_icon+on_foreground, "A lire attentivement !")'+blanks)
If warning_response = answer_yes And continue_program = true Then
    warning_response = MsgBox("D�sirez-vous ouvrir la page de l'installeur ?"+vbCrLf+"Lien:"+vbCrLf+url, yes_no+question_icon+0, "Ouvrir le lien ?")
    If warning_response = answer_yes Then
        'open_link(url)
        to_nowhere = MsgBox("Ouverture de "+url, 0+information_icon+on_foreground, "Ouverture du lien !")
    End If
ElseIf warning_response = answer_no And continue_program = true Then
    to_nowhere = MsgBox("Les �tapes que fait le program:"+vbCrLf+"1. Demander la langue d�sir�"+vbCrLf+"2. Afficher ce message"+vbCrLf+"3. V�rifier si l'ex�cutable est pr�sent"+vbCrLf+"3.1 Si l'executable n'est pas pr�sent, tenter de le t�l�charger"+vbCrLf+"3.2 Si 3.1 a �t� ex�cut�, v�rifier que l'ex�cutable est pr�sent"+vbCrLf+"4. Lancer l'ex�cutable", 0+information_icon+on_foreground, "Les �tapes que suit le programme")
    to_nowhere = MsgBox("Ce program va maintenant se fermer."+vbCrLf+"Au revoir et � une prochaine fois :-)", 0+information_icon+on_foreground, "Au revoir")
    continue_program = false
Else
    to_nowhere = MsgBox("Vous avez d�cid� de quitter le programme."+vbCrLf+"Au revoir et � une prochaine fois :-)", 0+information_icon+on_foreground, "Au revoir :-)")
    continue_program = false
End If
continue_program = true
warning_response = MsgBox("This program is configured to download, if not present, the python installer."+vbCrLf+vbCrLf+"The reason of the download is because the python installer also has the ability to install pip."+vbCrLf+vbCrLf+"Nethertheless, the simple action of downloading a file using this langage is sometimes considered as malignant by an antivirus."+vbCrLf+vbCrLf+"If this is the case, it is possible to download the executable, next window, to automatically skip to the installation part."+vbCrLf+vbCrLf+"Nethertheless, this does not make this program a malware."+vbCrLf+vbCrLf+"However, if you do not trust this program, click the 'no' box to display the steps to follow to install pip on your computer, these are the exact steps that are done by the program."+vbCrLf+vbCrLf+"Thank you for your comprehension ;-)"+vbCrLf+vbCrLf+"Yes -> Next window"+vbCrLf+"No -> Steps to follow for the installation"+vbCrLf+"Cancel -> Quit the program", yes_no_cancel+warning_icon+on_foreground, "To be read carefully !")'+blanks)
If warning_response = answer_yes And continue_program = true Then
    warning_response = MsgBox("Do you wish to open the page of the installer?"+vbCrLf+"Link:"+vbCrLf+url, yes_no+question_icon+0, "Open the link?")
    If warning_response = answer_yes Then
        'open_link(url)
        to_nowhere = MsgBox("Opening "+url, 0+information_icon+on_foreground, "Opening the link !")
    End If
ElseIf warning_response = answer_no And continue_program = true Then
    to_nowhere = MsgBox("The steps executed by the program are: "+vbCrLf+"1. Ask the language preference"+vbCrLf+"2. Display this message"+vbCrLf+"3. Check if the executable is present"+vbCrLf+"3.1 If this is not the case, attempt to download the executable"+vbCrLf+"3.2 If 3.1 was run, check if the executable is present"+vbCrLf+"4. Run the executable", 0+information_icon+on_foreground, "The steps followed by the program")
    to_nowhere = MsgBox("This program will now close."+vbCrLf+"Goodbye, see you next time :-)", 0+information_icon+on_foreground, "Goodbye!")
    continue_program = false
Else
    to_nowhere = MsgBox("You have decided to exit this program."+vbCrLf+"Goodbye, see you next time :-)", 0+information_icon+on_foreground, "Goodbye :-)")
    continue_program = false
End If
