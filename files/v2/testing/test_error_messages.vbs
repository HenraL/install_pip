Dim url
url = "https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe"
to_nowhere = MsgBox("Echec du t�l�chargeent d'un fichier n�cessaire pour le bon fonctionnement du programe !"+vbCrLf+"Merci de t�l�charger l'executable se trouvant � cette adresse:"+vbCrLf+url+vbCrLf+"et de le mettre dans le m�me dossier que ce programme"+vbCrLf+"Ensuite, merci d'ex�cuter de programme � nouveau", 0+48+4096, "Echec du t�l�chargement !")
to_nowhere = MsgBox("Failed to download the required file !"+vbCrLf+"Please download the required executable at:"+vbCrLf+url+vbCrLf+"And put it in the same folder as this program"+vbCrLf+"Then run this program again.", 0+48+4096, "Download failed !")
