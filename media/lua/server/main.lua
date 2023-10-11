require "timer"
require "talking"
require "enums"

objectData = {}
objectData.State = OTHER

local function initPlayerData(player)
    objectData[player] = {}
    objectData[player].talkTimer 
end

--local function initZombieData(zombie)
--    objectData[zombie] = {}
--    objectData[zombie].talkTimer = Timer:new(ZombRandFloat(SandboxVars.SockPuppets.MinTalkTimer,SandboxVars.SockPuppets.MaxTalkTimer),false)
--end

local function getRandomLine(lines)
    local count = 0
    for i,v in ipairs(lines) do
        count = count + lines[i].lineCount
    end
    local c = ZombRand(count)+1 --should work
    return lines[c] --dont think this works

end

local function GetLinesFromState(puppetId, stateId)
    return lineDB.puppetId.stateId
end

local function OnPlayerUpdate(player)

end
Events.onPlayerUpdate.Add(OnPlayerUpdate)