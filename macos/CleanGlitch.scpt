tell application "System Preferences"
    reveal anchor "displaysDisplayTab" of pane id "com.apple.preference.displays"
    delay 1
    tell application "System Events"
        tell pop up button "Rotation:" of tab group 1 of window 1 of application process "System Preferences"
            click
            click menu item "180°" of menu 1
            my clickRevertButton()
        end tell
    end tell
end tell

quit application "System Preferences"

on clickRevertButton()
    set wasClicked to false
    repeat until wasClicked
        delay 0.1
        tell application "System Events"
            try
                click button "Revert" of sheet 1 of window 1 of application process "System Preferences"
                set wasClicked to true
            end try
        end tell
    end repeat
end clickRevertButton
