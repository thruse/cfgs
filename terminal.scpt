on run argv
    if (count of argv) > 0 then
        set scriptPath to item 1 of argv
        tell application "Terminal"
            activate
            do script "bash " & quoted form of scriptPath & " ; exit"
        end tell
    else
        tell application "Terminal"
            activate
            do script ""
        end tell
    end if
end run
