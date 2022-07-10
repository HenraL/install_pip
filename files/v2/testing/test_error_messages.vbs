Dim url
url = "https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe"
to_nowhere = MsgBox("Echec du téléchargeent d'un fichier nécessaire pour le bon fonctionnement du programe !"+vbCrLf+"Merci de télécharger l'executable se trouvant à cette adresse:"+vbCrLf+url+vbCrLf+"et de le mettre dans le même dossier que ce programme"+vbCrLf+"Ensuite, merci d'exécuter de programme à nouveau", 0+48+4096, "Echec du téléchargement !")
to_nowhere = MsgBox("Failed to download the required file !"+vbCrLf+"Please download the required executable at:"+vbCrLf+url+vbCrLf+"And put it in the same folder as this program"+vbCrLf+"Then run this program again.", 0+48+4096, "Download failed !")
