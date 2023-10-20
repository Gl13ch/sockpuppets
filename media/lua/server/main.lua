require "timer"
require "talking"
require "enums"
require "names"

ModuleName = "SockPuppets"

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

local function onClothingUpdated(playerOrCharacter) --there's a chance that this isn't great. if a character is a zombied than this would check every 
    --getClothingItem_Hands --maybe???
    --getWornItems      --contender
    --getClothingItemName
--if player and if puppet is equipped, set puppetId
    --local items = playerOrCharacter.getInventory():getItems()
    --for i=0, items:size() - 1 do
    --    local item = items:get(i);
    --    --check if item is a sockpuppet and item is equipped
    --    if item:isEquipped() then
    --    end
    --end
    local hands = playerOrCharacter.getInventory():getClothingItem_Hands()

    if hands:getModule() == ModuleName then
        --a puppet is equipped
        objectData[playerOrCharacter].puppetId = hands:getName()
    end
end
Event.onClothingUpdated.Add(onClothingUpdated)

local function OnPlayerUpdate(player)
    if objectData[player] == nil then
        initPlayerData(player)
    end
    
    local playerData = objectData[player]
    local talkTime = playerData.talkTimer:tick()

    if talkTime then
        local line = getRandomLine(GetLinesFromState(playerData.puppetId,OTHER))    --on player update would always be other? trigger for attack, hurt and death would be from other events.
    end
end
Events.onPlayerUpdate.Add(OnPlayerUpdate)

