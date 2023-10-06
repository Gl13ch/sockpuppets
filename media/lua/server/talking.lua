


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

}

local madgeHurtList = {

}

local madgeOtherList = {

}

local madgeDeathList = {
    "Fuck this shit.",

}


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


-- kookycrazy --


local kookyAttackList = {
    "WOOooOOoo",
    "YAAAaaaY",

}

local kookyHurtList = {
    "HAaAHAHAa",
    "OuCHIE, AHAHAHA",

}

local kookyOtherList = {
    "AAAAAAAA",
    
}

local kookyDeathList = {
    "HaaHAAa OW",

}