require "timer"
require "talking"
require "enums"
require "names"

ModuleName = "SockPuppets"

objectData = {}
objectData.State = OTHER

local function initPlayerData(player)
    objectData[player] = {}
        --talkTimer 1 is for other, timer2 would be a shorter timer for things like attacks and taking damage. 
    objectData[player].talkTimer = Timer:new(ZombRandFloat(SandboxVars.SockPuppets.MinTalkTimer*2,SandboxVars.SockPuppets.MaxTalkTimer*2), false)
    objectData[player].talkTimer2 = Timer:new(ZombRandFloat(SandboxVars.SockPuppets.MinTalkTimer,SandboxVars.SockPuppets.MaxTalkTimer), false)
    
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

local function OnClothingUpdated(playerOrCharacter) --there's a chance that this isn't great. if a character is a zombied than this would check every 
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

    if ~playerOrCharacter:playerIsSelf() then
        return 0
    end

    local hands = playerOrCharacter:getInventory():getClothingItem_Hands()

    if hands:getModule() == ModuleName then
        --a puppet is equipped
        objectData[playerOrCharacter].puppetId = hands:getName()
    end
end
Event.OnClothingUpdated.Add(OnClothingUpdated)

local function OnPlayerUpdate(player)
    --if objectData[player] == nil then
    --    initPlayerData(player)
    --end
    local playerData = objectData[player]
    local talkTime = playerData.talkTimer:tick()

    if talkTime and playerData.puppetId ~= nil then
        local line = getRandomLine(GetLinesFromState(playerData.puppetId,OTHER))    --on player update would always be other? trigger for attack, hurt and death would be from other events.
    end
    --print line to screen here
    --also trigger sound
end
Events.OnPlayerUpdate.Add(OnPlayerUpdate)


local function OnPlayerDeath(player)
    --if objectData[player] == nil then
    --    initPlayerData(player)
    --end
    local playerData = objectData[player]
    if playerData.puppetId ~= nil then
        local line = getRandomLine(GetLinesFromState(playerData.puppetId,DEATH))    --on player update would always be other? trigger for attack, hurt and death would be from other events.
    end
    --print line to screen here
    --also trigger sound
end
Events.OnPlayerDeath.Add(OnPlayerDeath)

--check if onweaponhitcharacter triggers on zombies hitting player
    --OnHitZombie works, probably better than 
local function OnWeaponHitXP(player, handWeapon, character, damageSplit)

    local playerData = objectData[player]
    local talkTime = playerData.talkTimer2:tick()

    if talkTime and playerData.puppetId ~= nil then
        local line = getRandomLine(GetLinesFromState(playerData.puppetId,ATTACK))    --on player update would always be other? trigger for attack, hurt and death would be from other events.
    end
    --print line to screen here
    --also trigger sound
end
Events.OnWeaponHitXP.Add(OnWeaponHitXP)
--OnPlayerGetDamage
--local function OnWeaponHitCharacter(wielder, character, handWeapon, damage)
local function OnPlayerGetDamage(player, damageType, damage)
    if objectData[player] == nil or (damageType ~= "WEAPONHIT" and damageType ~= "FALLDOWN" and damageType ~= "FIRE" and damageType ~= "CARHITDAMAGE" and damageType ~= "CARCRASHDAMAGE")  then --specifies damage types that can trigger the puppet talking
        return 0
    end

    local playerData = objectData[player]
    local talkTime = playerData.talkTimer2:tick()

    if talkTime and playerData.puppetId ~= nil then
        local line = getRandomLine(GetLinesFromState(playerData.puppetId,HURT))    --on player update would always be other? trigger for attack, hurt and death would be from other events.
    end
end

Events.OnPlayerGetDamage.Add(OnPlayerGetDamage)