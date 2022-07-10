from time import sleep
import os, platform
loop,c,installbatfr,installbateng=5,"o","""REM met la couleur à écriture verte sur fond noir\ncolor 0A\nREM n'affiche pas C:\... mais juste la comande\necho off\nREM netoie l'écran\ncls\necho Si l'invite des comandes vous affiche "WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'NewConnectionError('<pip._vendor.urllib3.connection.VerifiedHTTPSConnection object at 0x0451F7B0>: Failed to establish a new connection: [Errno 11001] getaddrinfo failed')'..."\necho Essayez d'‚x‚cuter l'invite des comandes en mode administrateur ou d'activer votre wifi.\nREM première balise\n:inst\necho Voulez-vous installer pip? [(o)ui/(n)on/(m)ettre a jour]:\nREM variable pour récupérer votre choix\nset /p choice=\nREM instructions\nif %choice%==o goto i\nREM instructions\nif %choice%==O goto i\nREM instructions\nif %choice%==0 goto i\nREM instructions\nif %choice%==n goto n\nREM instructions\nif %choice%==N goto n\nREM instructions\nif %choice%==m goto m\nREM instructions\nif %choice%==M goto m\nREM message d'erreur\necho Veuillez n'entrer que la lettre "o" ou la lettre "n" ou la lettre "m".\nREM instructions\ngoto choice\nREM balise\n:i\nREM texte\necho Installation:\nREM affiche C:\....\necho on\nREM première tentative d'installation\nget-pip.py\nREM n'affiche pas C:\... mais juste la comande\necho off\nREM on met la commande en pause\npause\necho pip a ‚t‚ install‚ sur votre ordinateur.\nREM balise\n:q\nREM question\necho Voulez-vous mettre a jour pip [(o)ui/(n)on]:\nset /p choice=\nREM instructions\nif %choice%==o goto m\nREM instructions\nif %choice%==O goto m\nREM instructions\nif %choice%==0 goto m\nREM instructions\nif %choice%==n goto n\nREM instructions\nif %choice%==N goto n\nREM message d'erreur\necho Veuillez n'entrer que la lettre "o" ou la lettre "n".\nREM instructions\ngoto q\nREM balise\n:m\nREM affiche C:\....\necho on\nREM ligne de code pour mettre a jour pip\npip install pip\nREM n'affiche pas C:\... mais juste la comande\necho off\nREM Texte\necho pip a ‚t‚ mis a jour sur votre ordinateur.\nREM instructions\ngoto n\nREM balise\n:n\nREM texte\necho Au revoir\nREM texte\necho cr‚‚ par Henry Letellier\nREM texte\necho " ._____. "\nREM texte\necho " |.   .| "\nREM texte\necho " |  |  | "\nREM texte\necho " |\___/| "\nREM texte\necho " |_____| "\nREM temp de pause\ntimeout 3\nREM met l'invite en pause\npause\nREM met l'invite en pause\npause""","""REM sets the color to background black, writing green\ncolor 0A\nREM hides C:\... and just shows the required text\necho off\nREM clears screen\ncls\nREM code mark, goes to it if asked in the code\n:inst\necho If the shell shows the message "WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'NewConnectionError('<pip._vendor.urllib3.connection.VerifiedHTTPSConnection object at 0x0451F7B0>: Failed to establish a new connection: [Errno 11001] getaddrinfo failed')'..."\necho try to run the program with admin writes or make sure you have an active connection.\nREM question\necho  Do you whant to install pip? [(y)es/(n)o/(U)update]:\nREM variable pour récupérer votre choix\nset /p choice=\nREM instructions\nif %choice%==y goto i\nREM instructions\nif %choice%==Y goto i\nREM instructions\nif %choice%==n goto n\nREM instructions\nif %choice%==N goto n\nREM instructions\nif %choice%==u goto m\nREM instructions\nif %choice%==U goto m\nREM error message\necho Please make sure you've entered either "y" for yes or "n" for no or "u" for update.\nREM instructions\ngoto choice\nREM code mark, goes to it if asked in the code\n:i\nREM text\necho Installing...:\nREM shows C:\....\necho on\nREM first try to install pip\nget-pip.py\nREM hides C:\... and just shows the required text\necho off\nREM we pause the code until a key is hit\npause\necho Pip has succefully been installed on your computer.\nREM code mark, goes to it if asked in the code\n:q\nREM question\necho Do you whant to update pip? [(Y)es/(N)o]:\nset /p choice=\nREM instructions\nif %choice%==y goto m\nREM instructions\nif %choice%==Y goto m\nREM instructions\nif %choice%==n goto n\nREM instructions\nif %choice%==N goto n\nREM error message\necho Please make sure you've entered either "y" for yes or "n" for no.\nREM instruction\ngoto q\nREM code mark, goes to it if asked in the code\ngoto q\nREM balise\n:m\nREM shows C:\....\necho on\nREM line of code to update pip\npip install pip\nREM hides C:\... and just shows the required text\necho off\nREM Text\necho pip has been updated on youre computer.\nREM instructions\ngoto n\nREM code mark, goes to it if asked in the code\n:n\nREM text\necho Goodbye.\nREM text\necho created by Henry Letellier\nREM text\necho " ._____. "\nREM text\necho " |.   .| "\nREM text\necho " |  |  | "\nREM text\necho " |\___/| "\nREM text\necho " |_____| "\nREM sleep time\ntimeout 3\nREM we pause the code until a key is hit\npause\nREM we pause the code until a key is hit\npause """
if platform.system() == "Windows":
    while c=="o":
        b=input("What language do you whant the installer to be in? [(fr)ench/(eng)lish]:")
        if b=="fr":
            print("Vous avez défini la langue au Français")
            c="fr"
        elif b=="eng":
            print("You've set the language to English")
            c="eng"
        else:
            print("Please ensure you've entrered 'fr' for fench or 'eng' for english\n You've entrered {}.".format(b))
    def OPEN(a):
        if platform.system() == "Windows":
            os.system("start {} ".format(a))
        else:
            if b=="eng":
                print("Please run the program on a windows computer for compatibility mode.")
            elif b=="fr":
                print("Merci d'exécuter ce program sous windows.")
    def cls():
        if platform.system() == "Windows":
            os.system("cls")
        else:
            if b=="eng":
                print("Please run the program on a windows computer for compatibility mode.")
            elif b=="fr":
                print("Merci d'exécuter ce program sous windows.")
    try:
        f=open("get-pip.py", "r")
        s=f.read()
        print(s)
        f.close()
        cls()
    except:
        if b=="eng":
            print("Can't find the file 'get-pip.py' make sure you have it and put it in the same place that you put this program.")
        elif b=="fr":
            print("Fichier 'get-pip.py' non trouvé, assurez-vous qu'il se trouve au même endroit que ce program.")
    if b=="fr":
        try:
            f=open("install_pip_fr.bat", "w")
            s=f.write(installbatfr)
            f.close()
            OPEN("open_fr.vbs")
            print("Si le message 'Le système ne peut trouver le fichier open_fr.vbs' assurez-vous d'avoir téléchargé et placé dans le même endroit que ce program le fichier 'open_fr.vbs'.")
            sleep(9)
        except:
            f=open("install_pip_fr.bat", "w")
            s=f.write(installbatfr)
            f.close()
            print("Assurez-vous d'avoir téléchargé le fichier open-fr.vbs")
    elif b=="eng":
        try:
            f=open("install_pip_eng.bat", "w")
            s=f.write(installbateng)
            f.close()
            OPEN("open_eng.vbs")
            print("If the command shows 'The system can't find the file (or something like that) open_fr.vbs'please ensure you've downloaded and put the file open_fr.vbs' in the same place that program.")
            sleep(9)
        except:
            f=open("install_pip_eng.bat", "w")
            s=f.write(installbateng)
            f.close()
            print("Make sure you've downloaded the file open_eng.vbs")
                
else:
    if b=="eng":
        print("Please run this program in a windows environement.")
    elif b=="fr":
        print("Merci d'exécuter ce program sous windows.")
    sleep(5)