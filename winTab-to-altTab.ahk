; Remap Win-Tab to Alt-Tab
#HotIf WinActive("ahk_class XamlExplorerHostIslandWindow")
Tab::Right
+Tab::Left
#HotIf
#Tab::!Tab
