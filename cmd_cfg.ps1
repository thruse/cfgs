$cmd_shortcut = "C:\Users\thruse\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk"
$ws_shell = (new-object -comobject wscript.shell).createshortcut($cmd_shortcut)
$ws_shell.targetpath = "c:\windows\system32\cmd.exe"
$ws_shell.arguments = "/k ""set mydir=$env:mydir"" && ""$env:mydir\dev\cfgs\shin"""
$ws_shell.save()

# run shortcut as administrator by default hack
$bytes = [system.io.file]::readallbytes($cmd_shortcut)
$bytes[0x15] = $bytes[0x15] -bor 0x20
[system.io.file]::writeallbytes($cmd_shortcut, $bytes)
