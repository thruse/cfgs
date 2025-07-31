$cmd_shortcut = "$env:APPDATA\microsoft\windows\start menu\programs\system tools\command prompt.lnk"
$ws_shell = (new-object -comobject wscript.shell).createshortcut($cmd_shortcut)
$ws_shell.targetpath = "$env:windir\system32\cmd.exe"
$ws_shell.arguments = "/k `"$env:devdir\cfgs\shin`""
$ws_shell.save()

# run shortcut as administrator by default hack
$bytes = [system.io.file]::readallbytes($cmd_shortcut)
$bytes[0x15] = $bytes[0x15] -bor 0x20
[system.io.file]::writeallbytes($cmd_shortcut, $bytes)
