hl.exec_cmd("bash ~/.config/hypr/custom/scripts/notify-iphone-send.sh")
hl.exec_cmd("systemctl --user start hyprland-session.target")

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)
