-- Monitor: LG externo = principal, laptop = secundario
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = "1",
})
hl.monitor({
	output = "eDP-1",
	mode = "1366x768@60",
	position = "1920x0",
	scale = "1",
})

-- Workspaces 1-7 en el LG (principal)
for i = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "HDMI-A-1",
	})
end

-- Workspaces 8-14 en la laptop
for i = 6, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "eDP-1",
	})
end

-- Al inicio (con delay para que los monitores estén listos)
hl.on("hyprland.start", function()
	for i = 1, 7 do
		hl.dispatch(hl.dsp.workspace.move({ workspace = i, monitor = "HDMI-A-1" }))
	end
	hl.dispatch(hl.dsp.focus({ monitor = "HDMI-A-1" }))
	hl.dispatch(hl.dsp.focus({ workspace = 1 }))
end)

-- Cuando conectas el monitor en caliente
hl.on("monitor.added", function(m)
	if m.name == "HDMI-A-1" then
		for i = 1, 5 do
			hl.dispatch(hl.dsp.workspace.move({ workspace = i, monitor = "HDMI-A-1" }))
		end
		hl.dispatch(hl.dsp.focus({ monitor = "HDMI-A-1" }))
		hl.dispatch(hl.dsp.focus({ workspace = 1 }))
	end
end)

-- Ventana sola: centrada y más pequeña en monitor externo
hl.workspace_rule({ workspace = "w[tv1] m[HDMI-A-1]", gaps_out = 40 })

-- Ventana sola: normal en laptop
hl.workspace_rule({ workspace = "w[tv1] m[eDP-1]", gaps_out = 5 })
hl.on("monitor.added", function(m)
	if m.name == "HDMI-A-1" then
		hl.config({ misc = { mouse_move_enables_dpms = false, key_press_enables_dpms = false } })
	end
end)

-- Solucion bug lockscreen
hl.config({
	misc = {
		allow_session_lock_restore = true,
	},
})
