#!/usr/bin/lua

require "io"

local function execute (command)
    local handle = io.popen(command)
    handle:close()
end

local function executeAndRead (command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

-- COLOR=$(gdbus call --session --dest org.gnome.Shell.Screenshot --object-path /org/gnome/Shell/Screenshot --method org.gnome.Shell.Screenshot.PickColor)
color = executeAndRead("gdbus call --session --dest org.gnome.Shell.Screenshot --object-path /org/gnome/Shell/Screenshot --method org.gnome.Shell.Screenshot.PickColor")
print(color)
--color="({'color': <(0.11764705882352941, 0.11764705882352941, 0.11764705882352941)>},)"

--RGB=$(echo $COLOR | sed -n "s/.*<(\(.*\))>.*/\1/p")
rgb = color:match("<%((.*)%)>")
hex = "#"
for v in rgb:gmatch("([^,]+)") do
    hex = hex .. string.format("%02x", tonumber(v)*255)
end

execute("wl-copy '".. hex .. "'")
execute("notify-send -t 3000 'Color ".. hex .." copied!'")
