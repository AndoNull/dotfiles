-- vim: ft=lua
hl.bind(
	"CTRL+SUPER+ALT+Slash",
	hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"),
	{ description = "Edit user keybinds" }
)
-- togglesplit  -  Split screen horizontally
hl.bind("SUPER + H", hl.dsp.layout("togglesplit"), { description = "Toggle split direction" })

-- toggle laptop screen
hl.bind(
	"SUPER + SHIFT + D",
	hl.dsp.exec_cmd("bash ~/.config/hypr/custom/scripts/toggle_laptop_screen.sh"),
	{ description = "Toggle laptop screen" }
)

-- Teclas multimedia teclado externo
hl.bind("XF86Tools", hl.dsp.global("quickshell:sidebarLeftToggle"), { description = "F1 - Sidebar AI" })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { description = "F5 - Stop media" })
hl.bind("XF86Mail", hl.dsp.exec_cmd("xdg-open https://mail.google.com"), { description = "F9 - Mail" })
hl.bind("XF86HomePage", hl.dsp.exec_cmd(browser), { description = "F10 - Browser" })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk"), { description = "F12 - Calculadora" })

hl.bind(
	"CTRL + SUPER + R",
	hl.dsp.exec_cmd("sleep 0.3; killall ydotool qs quickshell"),
	{ description = "Restart widgets" }
)
