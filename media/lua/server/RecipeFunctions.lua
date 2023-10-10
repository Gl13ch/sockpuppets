function Recipe.OnCreate.GiveRandomPuppet(items, result, player, selectedItem)
    --ZombRand is built in func will return 3 values: 0,1,2
    local randPuppet = ZombRand(3);
    if randPuppet==0 then
        player:getInventory():AddItem("SockPuppets.Sock_Puppet_Sadge");
    elseif randPuppet==1 then
        player:getInventory():AddItem("SockPuppets.Sock_Puppet_Madge");
    elseif randPuppet==2 then
        player:getInventory():AddItem("SockPuppets.Sock_Puppet_Kooky");
    end
end

function Recipe.OnGiveXP.GGTailoring5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 5);
end