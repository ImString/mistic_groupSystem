function onPlayerJoin(_, account)
    local player = source
    local accountName = getAccountName(account)
    local gp = getGroupManager():getGroupPlayer(accountName)

    if not (gp) then
        local id = player:getData(config["ElementData"]["ID"]) or account:getID()
        local playerId = tonumber(id)
        local newGp = GroupPlayer()
        local objectClear = {}

        newGp:setId(playerId)
        newGp:setName(accountName)
        newGp:setNickName(player:getName())
        newGp:setGroup(nil)
        newGp:setGroupRole(GroupRole():select("NONE"))
        newGp:setDrugsSell(0)
        newGp:setWeaponsSell(0)
        newGp:setDrugsFabricate(0)
        newGp:setWeaponsFabricate(0)
        newGp:setPlayerRemand(0)
        newGp:setLearnedGuns(0)
        newGp:setSeizedDrugs(0)
        newGp:setInvitations(objectClear)
        newGp:setCreatedAtMillis()
        newGp:setLastActivityMillis()

        GroupManager():importGroupPlayer(newGp)
        SQL():insertGroupPlayer(newGp)
    else          
        gp:setNickName(player:getName())
        gp:setOnline(true)
        
        getGroupManager():importGroupPlayer(gp)
    end
end
addEventHandler("onPlayerLogin", getRootElement(), onPlayerJoin)