#!/usr/bin/env fish
set tmp (mktemp -t "yazi-cwd.XXXXXX")
command yazi --cwd-file="$tmp" 2>/dev/null
set cwd (string trim (cat $tmp))
command rm -f -- "$tmp"
if test -d "$cwd"
    kitty --detach --directory="$cwd"
end
