require "enums"

lineDB = {}
lineDB.SADGE = {}
lineDB.MADGE = {}
lineDB.KOOKY = {}

for i,v in ipairs(lineDB) do
    lineDB[i][1]={}
    lineDB[i][2]={}
    lineDB[i][3]={}
    lineDB[i][4]={}
end

puppetLines = {}
puppetLines.__index = puppetLines

-- puppetLines are table of 

function puppetLines:new(line,...)
    obj = {}
    obj.line = line
    obj.args = {...}
    obj.argsNum = select("#", ...)
    obj.lineCount = obj.argsNum
    setmetatable(obj, self)
    return obj
end

--pick random element from list
local function pickRandom(list)
    local index = ZombRand(#list)+1
    return list[index]
end

function puppetLines:getLine()
    if self.args == nil then
        return self.line    --returns " "
    else
        return pickRandom(self.args)    --might not work because i think args is a table in a table
    end
end

----------------------------------------------------------
--separate first into puppet type, then into dialogue type

-- madge --

--Idea?
--local madgeFirstTimeEquipped = {}
--This needs to be remembered on first time vs re-equipping

local madgeAttackList = {
    "Fuck youuuuu",
    "FUCK YOU",
    "Die, you damn thing",
    "DIE",
    "I'm gonna turn you into paste",
    
}
madgeAttackLines = { puppetLines:new(" ", madgeAttackList) }

local madgeHurtList = {
    "Fuck, piece of shit.",
    "OW",

}
madgeHurtLines = { puppetLines:new(" ", madgeHurtList) }

local madgeOtherList = {
    "Can we kill now?",
    "I want to go fight.",
    "Lemme at em."

}
madgeOtherLines = { puppetLines:new(" ", madgeOtherList) }

local madgeDeathList = {
    "Fuck this shit.",

}
madgeDeathLines = { puppetLines:new(" ", madgeDeathList) }

lineDB.MADGE.ATTACK = madgeAttackLines
lineDB.MADGE.HURT = madgeHurtLines
lineDB.MADGE.OTHER = madgeOtherLines
lineDB.MADGE.DEATH = madgeDeathLines

-- sadge --

--local sadgeFirstTimeEquipped = {
--    "..."
--}

local sadgeAttackList = {
    "Oh bother...",
    "Are we done with all this yet?",
}
sadgeAttackLines = { puppetLines:new(" ", sadgeAttackList) }


local sadgeHurtList = {
    "Please stop.",
    "Owie.",
    "It hurts :(",

}
sadgeHurtLines = { puppetLines:new(" ", sadgeHurtList) }


local sadgeOtherList = {
    "I want to lay down.",
    "I want to go home.",
}
sadgeOtherLines = { puppetLines:new(" ", sadgeOtherList) }


local sadgeDeathList = {
    "Now I can rest.",
    "Time for a deep sleep.",
    "Finally.",
}
sadgeDeathLines = { puppetLines:new(" ", sadgeDeathList) }

lineDB.SADGE.ATTACK = sadgeAttackLines
lineDB.SADGE.HURT = sadgeHurtLines
lineDB.SADGE.OTHER = sadgeOtherLines
lineDB.SADGE.DEATH = sadgeDeathLines


-- kookycrazy --

local kookyAttackList = {
    "WOOooOOoo",
    "YAAAaaaY",

}
kookyAttackLines = {puppetLines:new(" ",kookyAttackList) }

local kookyHurtList = {
    "HAaAHAHAa",
    "OuCHIE, AHAHAHA",

}
kookyHurtLines = {puppetLines:new(" ",kookyHurtList) }

local kookyOtherList = {
    "AAAAAAAAA"
}
kookyOtherLines = {puppetLines:new(" ",kookyOtherList) }

local kookyDeathList = {
    "HaaHAAa OW",
}
kookyDeathLines = {puppetLines:new(" ",kookyDeathList) }

lineDB.KOOKY.ATTACK = kookyAttackLines
lineDB.KOOKY.HURT = kookyHurtLines
lineDB.KOOKY.OTHER = kookyOtherLines
lineDB.KOOKY.DEATH = kookyDeathLines