$shortcut = (new-object -comobject wscript.shell).createshortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk")
$shortcut.arguments = "/k cd %HOMEDRIVE%%HOMEPATH%"
$shortcut.save()
