#!/usr/bin/lua

require "io"

local function execute (command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

io.write(execute("figlet 'Translate'") .. "\n")

local sentence, language
while true do
    io.write("> ")
    sentence = io.read()
    language = execute("trans -identify \"" .. sentence .. "\" 2> /dev/null | head -n 1")
    if string.find(language, "English") then
        io.write("\n"..execute("trans -s english -t pt-PT -show-original n \"" .. sentence .. "\" 2> /dev/null"))
    else
        io.write("\n"..execute("trans -s pt-PT -t english -show-original n \"" .. sentence .. "\" 2> /dev/null"))
    end
    print("\n")
end
