#!/sbin/lua

require "io"

local function execute (command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

execute("maim /tmp/screenshot.png")

local screens={}
local keys = {}
local monitors = execute("xrandr --listactivemonitors")
local width, height, x, y, index
for word in string.gmatch(monitors, "%d+:%s+.-%s(.-)%s+.-[\n]") do
    width = tonumber(string.match(word, "^(%d+)/"))
    height = tonumber(string.match(word, "x(%d+)/"))
    x = tonumber(string.match(word, "/%d+%+(%d+)%+%d+"))
    y = tonumber(string.match(word, "/%d+%+%d+%+(%d+)"))
    screens[x]={width=width, height=height, x=x, y=y}

    index = 1
    for _,k in ipairs(keys) do
        if(x<k) then
            break
        end
        index=index+1
    end
    --print(index)
    table.insert(keys,index,x)
end

local command = "convert -background none "
local v
for _,k in ipairs(keys) do
    v=screens[k]
    --v=screens[k]
    command = command .. "\\( -size " .. v["width"] .. "x" .. (2*v["y"]) .. " xc:none  /tmp/screenshot.png " .. "-crop " .. v["width"] .. "x" .. v["height"] .. "+" .. v["x"] .. "+" .. v["y"] .. " -append \\) "
end
command = command .. "+append /tmp/screenshot_fixed.png 2> /dev/null"

execute(command)
