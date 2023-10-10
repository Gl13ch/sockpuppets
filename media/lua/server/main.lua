require "timer"
require "enums"

local objectData = {}

local function initZombieData(zombie)
    objectData[zombie] = {}
    objectData[zombie].talkTimer = Timer:new(ZombRandFloat(SandboxVars.SockPuppets.MinTalkTimer,SandboxVars.SockPuppets.MaxTalkTimer),false)
end

local function getRandomLine(lines)
    local count = 0
    for i,v in ipairs(lines) do
        count = count + lines[i].lineCount
    end


end
