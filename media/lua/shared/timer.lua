
Timer = {}
Timer.__index = Timer

function Timer:new(limit, start)
    obj = {}
    setmetatable(obj,Timer)
    if start then
        obj.clock = limit
    else
        obj.clock = 0
    end
    obj.limit = limit
end


function Timer:tick()
    local elapsedTime = getGameTime():getRealworldSecondsSinceLastUpdate()
    --increment
    self.clock = self.clock + elapsedTime

    if self.clock > self.limit then
        self.clock = self.clock % self.limit
        return true;
    end
    return false
end