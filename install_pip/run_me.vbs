commande = "install_pip.py"
Set fso = CreateObject("Scripting.FileSystemObject" )
set shl = createobject("wscript.shell" )
shl.run """"+commande+"""",1,false