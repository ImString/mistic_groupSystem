----------------------------------------------------/ UTILS \----------------------------------------------------
function isPlayerInGroup(player, groupTag)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end
    
    local group = groupPlayer:getGroup()
    if not (group) then
        return false
    end
    
    return true
end

function getGroupFromPlayer(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end
    
    local group = groupPlayer:getGroup()
    if not (group) then
        return false
    end
    
    local responseGroup = {
        ["tag"] = group:getTag(),
        ["name"] = group:getName(),
        ["maxMembers"] = group:getMaxMembers(),
        ["balance"] = group:getBalance(),
        ["groupType"] = (group:getGroupType() == 1 and "Faction" or "Corporation"),
        ["owner"] = group:getOwner(),
    }
    
    return responseGroup
end

----------------------------------------------------/ PLAYER ECONOMY SYSTEM \----------------------------------------------------
function getPlayerBalance(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then return false end

    return groupPlayer:getBalance()
end

function setPlayerBalance(player, balance)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (balance) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then return false end

    groupPlayer:setBalance(balance)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return true
end

function addPlayerBalance(player, balance)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (balance) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then return false end

    groupPlayer:addBalance(balance)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return true
end

function takePlayerBalance(player, balance)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (balance) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then return false end

    groupPlayer:removeBalance(balance)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return true
end

----------------------------------------------------/ LOGS SYSTEM \----------------------------------------------------
function createLog(groupTag, message)
    if not (isHaveProtection()) then return false end
    if not (groupTag) then return false end
    if not (message) then return false end

    local group = getGroupManager():getGroup(groupTag)
    if not (group) then return false end

    getLogsAPI():createLogs(group, message, "success")
    return group
end

----------------------------------------------------/ GROUP ECONOMY SYSTEM \----------------------------------------------------
function getGroupBalance(groupTag)
    if not (isHaveProtection()) then return false end
    if not (groupTag) then return false end

    local group = getGroupManager():getGroup(groupTag)
    if not (group) then return false end

    return group:getBalance()
end

function setGroupBalance(groupTag, balance)
    if not (isHaveProtection()) then return false end
    if not (groupTag) then return false end
    if not (balance) then return false end

    local group = getGroupManager():getGroup(groupTag)
    if not (group) then return false end

    group:setBalance(balance)
    getGroupManager():importGroup(group)
    getSql():updateGroup(group)
    return true
end

function addGroupBalance(groupTag, balance)
    if not (isHaveProtection()) then return false end
    if not (groupTag) then return false end
    if not (balance) then return false end

    local group = getGroupManager():getGroup(groupTag)
    if not (group) then return false end

    group:addBalance(balance)
    getGroupManager():importGroup(group)
    getSql():updateGroup(group)
    return true
end

function takeGroupBalance(groupTag, balance)
    if not (isHaveProtection()) then return false end
    if not (groupTag) then return false end
    if not (balance) then return false end

    local group = getGroupManager():getGroup(groupTag)
    if not (group) then return false end

    group:removeBalance(balance)
    getGroupManager():importGroup(group)
    getSql():updateGroup(group)
    return true
end

----------------------------------------------------/ WEAPONS FABRICATE/SELLING \----------------------------------------------------
function getWeaponsFabricate(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    return groupPlayer:getWeaponsFabricate()
end

function setWeaponsFabricate(player, weaponsFabricate)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (weaponsFabricate) then return false end
    if not (tonumber(weaponsFabricate)) then return false end

    local weaponsFabricate = tonumber(weaponsFabricate)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setWeaponsFabricate(weaponsFabricate)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function addWeaponsFabricate(player, weaponsFabricate)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (weaponsFabricate) then return false end
    if not (tonumber(weaponsFabricate)) then return false end

    local weaponsFabricate = tonumber(weaponsFabricate)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setWeaponsFabricate(groupPlayer:getWeaponsFabricate() + weaponsFabricate)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function removeWeaponsFabricate(player, weaponsFabricate)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (weaponsFabricate) then return false end
    if not (tonumber(weaponsFabricate)) then return false end

    local weaponsFabricate = tonumber(weaponsFabricate)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setWeaponsFabricate(groupPlayer:getWeaponsFabricate() - weaponsFabricate)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function getWeaponsSell(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    return groupPlayer:getWeaponsSell()
end

function setWeaponsSell(player, weaponsSell)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (weaponsSell) then return false end
    if not (tonumber(weaponsSell)) then return false end

    local weaponsSell = tonumber(weaponsSell)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setWeaponsSell(weaponsSell)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function addWeaponsSell(player, weaponsSell)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (weaponsSell) then return false end
    if not (tonumber(weaponsSell)) then return false end

    local weaponsSell = tonumber(weaponsSell)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setWeaponsSell(groupPlayer:getWeaponsSell() + weaponsSell)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function removeWeaponsSell(player, weaponsSell)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (weaponsSell) then return false end
    if not (tonumber(weaponsSell)) then return false end

    local weaponsSell = tonumber(weaponsSell)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setWeaponsSell(groupPlayer:getWeaponsSell() - weaponsSell)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

----------------------------------------------------/ DRUGS FABRICATE/SELLING \----------------------------------------------------
function getDrugsFabricate(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    return groupPlayer:getDrugsFabricate()
end

function setDrugsFabricate(player, drugsFabricate)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (drugsFabricate) then return false end
    if not (tonumber(drugsFabricate)) then return false end

    local drugsFabricate = tonumber(drugsFabricate)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setDrugsFabricate(groupPlayer:getWeaponsFabricate())
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function addDrugsFabricate(player, drugsFabricate)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (drugsFabricate) then return false end
    if not (tonumber(drugsFabricate)) then return false end

    local drugsFabricate = tonumber(drugsFabricate)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setDrugsFabricate(groupPlayer:getDrugsFabricate() + drugsFabricate)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function removeDrugsFabricate(player, drugsFabricate)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (drugsFabricate) then return false end
    if not (tonumber(drugsFabricate)) then return false end

    local drugsFabricate = tonumber(drugsFabricate)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setDrugsFabricate(groupPlayer:getDrugsFabricate() - drugsFabricate)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function getDrugsSell(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    return groupPlayer:getDrugsSell()
end

function setDrugsSell(player, drugsSell)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (drugsSell) then return false end
    if not (tonumber(drugsSell)) then return false end

    local drugsSell = tonumber(drugsSell)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setDrugsSell(drugsSell)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function addDrugsSell(player, drugsSell)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (drugsSell) then return false end
    if not (tonumber(drugsSell)) then return false end

    local drugsSell = tonumber(drugsSell)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setDrugsSell(groupPlayer:getDrugsSell() + drugsSell)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function removeDrugsSell(player, drugsSell)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (drugsSell) then return false end
    if not (tonumber(drugsSell)) then return false end

    local drugsSell = tonumber(drugsSell)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setDrugsSell(groupPlayer:getDrugsSell() - drugsSell)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

----------------------------------------------------/ PLAYERS REMAND \----------------------------------------------------
function getPlayersRemand(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    return groupPlayer:getPlayersRemand()
end

function setPlayersRemand(player, playersRemand)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (playersRemand) then return false end
    if not (tonumber(playersRemand)) then return false end

    local playersRemand = tonumber(playersRemand)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(playersRemand)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function addPlayersRemand(player, playersRemand)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (playersRemand) then return false end
    if not (tonumber(playersRemand)) then return false end

    local playersRemand = tonumber(playersRemand)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(groupPlayer:getPlayersRemand() + playersRemand)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function removePlayersRemand(player, playersRemand)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (playersRemand) then return false end
    if not (tonumber(playersRemand)) then return false end

    local playersRemand = tonumber(playersRemand)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(groupPlayer:getPlayersRemand() - playersRemand)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

----------------------------------------------------/ LEARNED GUNS \----------------------------------------------------
function getLearnedGuns(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    return groupPlayer:getLearnedGuns()
end

function setLearnedGuns(player, learnedGuns)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (learnedGuns) then return false end
    if not (tonumber(learnedGuns)) then return false end

    local learnedGuns = tonumber(learnedGuns)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(playersRemand)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function addLearnedGuns(player, learnedGuns)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (learnedGuns) then return false end
    if not (tonumber(learnedGuns)) then return false end

    local learnedGuns = tonumber(learnedGuns)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(groupPlayer:getLearnedGuns() + learnedGuns)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function removeLearnedGuns(player, learnedGuns)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (learnedGuns) then return false end
    if not (tonumber(learnedGuns)) then return false end

    local learnedGuns = tonumber(learnedGuns)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(groupPlayer:getLearnedGuns() - learnedGuns)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

----------------------------------------------------/ SEIZED DRUGS \----------------------------------------------------

function getSeizedDrugs(player)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end

    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    return groupPlayer:getSeizedDrugs()
end

function setSeizedDrugs(player, seizedDrugs)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (seizedDrugs) then return false end
    if not (tonumber(seizedDrugs)) then return false end

    local seizedDrugs = tonumber(seizedDrugs)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(playersRemand)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function addSeizedDrugs(player, seizedDrugs)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (seizedDrugs) then return false end
    if not (tonumber(seizedDrugs)) then return false end

    local seizedDrugs = tonumber(seizedDrugs)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(groupPlayer:getSeizedDrugs() + seizedDrugs)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end

function removeSeizedDrugs(player, seizedDrugs)
    if not (isHaveProtection()) then return false end
    if not (player) then return false end
    if not (seizedDrugs) then return false end
    if not (tonumber(seizedDrugs)) then return false end

    local seizedDrugs = tonumber(seizedDrugs)
    local groupPlayer = getGroupManager():getGroupPlayerByPlayer(player)
    if not (groupPlayer) then 
        return false 
    end

    groupPlayer:setPlayerRemand(groupPlayer:getSeizedDrugs() - seizedDrugs)
    getGroupManager():importGroupPlayer(groupPlayer)
    getSql():updateGroupPlayer(groupPlayer)
    return groupPlayer
end