function Recipe.OnCreate.GiveRandomPuppet(items, result, player, selectedItem)
    --ZombRand is built in func will return 3 values: 0,1,2
    local randPuppet = ZombRand(3);
    if randPuppet==0 then
        player:getInventory():AddItem("sockPuppets.Sock_Puppet_Sadge");
    elseif randPuppet==1 then
        player:getInventory():AddItem("sockPuppets.Sock_Puppet_Madge");
    elseif randPuppet==2 then
        player:getInventory():AddItem("sockPuppets.Sock_Puppet_Kooky");
    end
end

function Recipe.OnGiveXP.TailoringXp5(recipe, ingredients, result, player)
    player:getXp():AddXp(Perks.Tailoring, 3);
end

-- keep [Recipe.GetItemTypes.SewingNeedle]

--Used for server-side scripts. Item spawning, core farming, weather and other server-side events. These only get loaded when the game is actually started (loading a save, starting a server, etc).