require "timer"
require "talking"
require "enums"

objectData = {}
objectData.State = OTHER

local function initPlayerData(player)
    objectData[player] = {}
    objectData[player].talkTimer = Timer:new(ZombRandFloat(SandboxVars.SockPuppets.MinTalkTimer,SandboxVars.SockPuppets.MaxTalkTimer), false)
    objectData[player].puppetId = nil
end

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

local function onClothingUpdated(playerOrCharacter)
--if player and if puppet is equipped, set puppetId
    local items = playerOrCharacter.getInventory():getItems()
    for i=0, items:size() - 1 do
        local item = items:get(i);
        --check if item is a sockpuppet and item is equipped
        if item:isEquipped() then
            
        end

    end
end

local function OnPlayerUpdate(player)
    if objectData[player] == nil then
        initPlayerData(player)
    end
    local playerData = objectData[player]
    local talkTime = playerData.talkTimer:tick()

    if talkTime then
        local line = getRandomLine(GetLinesFromState())
    end
end
Events.onPlayerUpdate.Add(OnPlayerUpdate)