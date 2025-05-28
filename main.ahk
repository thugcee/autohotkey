#Requires AutoHotkey v2
#SingleInstance force

SetWorkingDir(A_ScriptDir)

; Disable Start on simple press of Win key
~LWin::Send "{Blind}{vkE8}"

CycleExe(exe, group) {
    Local targetWinTitle := "ahk_exe " . exe

    ; Add all windows of the specified executable to the group
    GroupAdd(group, targetWinTitle)

    ; Check if a window of that executable is currently active
    if WinActive(targetWinTitle) {
        ; If yes, activate the next window in the group (cycling)
        GroupActivate(group, "r")
        Return true ; Indicate success
    } else {
        ; If no, check if ANY window of that executable exists
        if WinExist(targetWinTitle) {
            WinActivate(targetWinTitle)
            Return true ; Indicate success
        } else {
            ; No window of this exe was found to activate
            ; Optional: Provide feedback to the user
            ; ToolTip("No '" . exe . "' windows found to activate.")
            ; SetTimer () => ToolTip(), -2000 ; Clear tooltip after 2 seconds
            Return false ; Indicate failure (no window found)
        }
    }
}


#c::Run("C:\Program Files (x86)\CopyQ\copyq.exe", "toggle")
#PgDn::WinMoveBottom("A")
#w::CycleExe("firefox.exe", "firefox")
#a::CycleExe("idea64.exe", "idea")
#x::CycleExe("ms-teams.exe", "teams")
#t::CycleExe("ms-teams.exe", "teams")
#s::CycleExe("chrome.exe", "chrome")
#n::WinActivate("ahk_exe notepad++.exe")
#+f::WinActivate("ahk_class CabinetWClass", "ahk_exe explorer.exe")
#f::WinActivate("ahk_exe TE64.exe")
#m::WinActivate("ahk_exe OUTLOOK.EXE")
#o::WinActivate("ahk_exe Logseq.exe")
#F2::WinActivate("ahk_exe Logseq.exe")
#d::WinActivate("ahk_exe dbeaver.exe")
#z::CycleExe("code.exe", "code")

#Include wezTerm.ahk
; #Include windowsTerminal.ahk

#Include winTab-to-altTab.ahk
