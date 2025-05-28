Loop 10
{
   i := A_Index - 1
   HotKey #^%i%,DynHotkey
   HotKey #%i%, DynHotkey
   HotKey #!%i%,DynHotkey
}
Exit

DynHotkey:
   StringRight i, A_ThisHotKey, 1
   StringMid what,A_ThisHotKey, 2, 1
   var := var%i%
   IfEqual what, ^, WinGet var%i%, ID, A  ; Save ID
   Else IfEqual what,!, WinMinimizeAll    ; MinimizeAll
   WinRestore  ahk_id %var%
   WinActivate ahk_id %var%               ; Switch
Return