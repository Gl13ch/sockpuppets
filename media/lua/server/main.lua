require "timer"

local objectData = {}

local function initZombieData(zombie)
    objectData[zombie] = {}
    objectData[zombie].talkTimer = Timer:new(ZombRandFloat(SandboxVars.SockPuppets.MinTalkTimer,SandboxVars.SockPuppets.MaxTalkTimer),false)
end

