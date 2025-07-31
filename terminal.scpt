on run argv
    if (count of argv) > 0 then
        set scriptPath to quoted form of (item 1 of argv)

        set paramList to ""
        if (count of argv) > 1 then
            repeat with i from 2 to count of argv
                set paramList to paramList & " " & quoted form of (item i of argv)
            end repeat
        end if

        set fullCommand to scriptPath & paramList

        tell application "Terminal"
            activate
            do script fullCommand & " ; exit"
        end tell
    else
        tell application "Terminal"
            activate
            do script ""
        end tell
    end if
end run
