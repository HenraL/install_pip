REM met la couleur à écriture verte sur fond noir
color 0A
REM n'affiche pas C:\... mais juste la comande
echo off
REM netoie l'écran
cls
echo Si l'invite des comandes vous affiche "WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'NewConnectionError('<pip._vendor.urllib3.connection.VerifiedHTTPSConnection object at 0x0451F7B0>: Failed to establish a new connection: [Errno 11001] getaddrinfo failed')'..."
echo Essayez d'‚x‚cuter l'invite des comandes en mode administrateur ou d'activer votre wifi.
REM première balise
:inst
echo Voulez-vous installer pip? [(o)ui/(n)on/(m)ettre a jour]:
REM variable pour récupérer votre choix
set /p choice=
REM instructions
if %choice%==o goto i
REM instructions
if %choice%==O goto i
REM instructions
if %choice%==0 goto i
REM instructions
if %choice%==n goto n
REM instructions
if %choice%==N goto n
REM instructions
if %choice%==m goto m
REM instructions
if %choice%==M goto m
REM message d'erreur
echo Veuillez n'entrer que la lettre "o" ou la lettre "n" ou la lettre "m".
REM instructions
goto choice
REM balise
:i
REM texte
echo Installation:
REM affiche C:\....
echo on
REM première tentative d'installation
get-pip.py
REM n'affiche pas C:\... mais juste la comande
echo off
REM on met la commande en pause
pause
echo pip a ‚t‚ install‚ sur votre ordinateur.
REM balise
:q
REM question
echo Voulez-vous mettre a jour pip [(o)ui/(n)on]:
set /p choice=
REM instructions
if %choice%==o goto m
REM instructions
if %choice%==O goto m
REM instructions
if %choice%==0 goto m
REM instructions
if %choice%==n goto n
REM instructions
if %choice%==N goto n
REM message d'erreur
echo Veuillez n'entrer que la lettre "o" ou la lettre "n".
REM instructions
goto q
REM balise
:m
REM affiche C:\....
echo on
REM ligne de code pour mettre a jour pip
pip install pip
REM n'affiche pas C:\... mais juste la comande
echo off
REM Texte
echo pip a ‚t‚ mis a jour sur votre ordinateur.
REM instructions
goto n
REM balise
:n
REM texte
echo Au revoir
REM texte
echo cr‚‚ par Henry Letellier
REM texte
echo " ._____. "
REM texte
echo " |.   .| "
REM texte
echo " |  |  | "
REM texte
echo " |\___/| "
REM texte
echo " |_____| "
REM temp de pause
timeout 3
REM met l'invite en pause
pause
REM met l'invite en pause
pause