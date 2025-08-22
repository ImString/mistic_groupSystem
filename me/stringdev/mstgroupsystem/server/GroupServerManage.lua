function createGroup(player, tag, name, maxMember, ownerID, groupType)
    if not (player) then return end
    if not (tag) then return end
    if not (name) then return end
    if not (maxMember) then return end
    if not (ownerID) then return end
    if not (groupType) then return end

    local groupPlayer = getGroupManager():getGroupPlayerByID(tonumber(ownerID))
    if not (groupPlayer) then 
        config.notifyS(player, "Ocorreu um problema ao encontrar o dono do grupo.", "error")
        return
    end
    
    if (groupPlayer:isHaveGroup()) then
        config.notifyS(player, "Este jogador já está em um grupo.", "error")
        return
    end

    if (getGroupManager():isGroup(tag)) then
        config.notifyS(player, "Já existe um grupo com esta tag.", "error")
        return
    end

    if (getGroupManager():getGroupByName(name)) then
        config.notifyS(player, "Já existe um grupo com este nome.", "error")
        return
    end

    local createdGroup = getGroupAPI():createGroup(name, tag, tonumber(groupType), groupPlayer, maxMember)
    config.notifyS(player, createdGroup[1], createdGroup[2])
end
addEvent("MST:createGroup", true)
addEventHandler("MST:createGroup", getRootElement(), createGroup)

function destroyGroup(player)
    if not (player) then return end

    local groupPlayer = getGroupManager():getGroupPlayer(player:getAccount():getName())
    if not (groupPlayer) then 
        config.notifyS(player, "Algum problema aconteceu com você. Relogue.", "error")
        return
    end

    if not (groupPlayer:getGroup()) then
        config.notifyS(player, "Você não está em grupo.", "error")
        return
    end

    if not (groupPlayer:isLeader()) then
        config.notifyS(player, "Apenas o líder pode desfazer o grupo.", "error")
        return
    end

    local savedMembers = { }
    savedMembers = groupPlayer:getGroup():getMembers()

    local destroyedGroup = getGroupAPI():destroyGroup(groupPlayer:getGroup():getTag())
    config.notifyS(player, destroyedGroup[1], destroyedGroup[2])

    for _, groupPlayer in ipairs(savedMembers) do
        local searchPlayerTarget = getGroupManager():getPlayerByGroupPlayer(groupPlayer)
        if (searchPlayerTarget) then
            searchPlayerTarget:triggerEvent("MST:updateValues", searchPlayerTarget, groupPlayer)
        end
    end
end
addEvent("MST:destroyGroup", true)
addEventHandler("MST:destroyGroup", getRootElement(), destroyGroup)

function clearLog(player)
    if not (player) then return end

    local groupPlayer = getGroupManager():getGroupPlayer(player:getAccount():getName())
    if not (groupPlayer) then 
        config.notifyS(player, "Algum problema aconteceu com você. Relogue.", "error")
        return
    end

    if not (groupPlayer:getGroup()) then
        config.notifyS(player, "Você não está em grupo.", "error")
        return
    end

    if not (groupPlayer:isLeader()) then
        config.notifyS(player, "Apenas o líder pode limpar as logs do grupo.", "error")
        return
    end

    if (#groupPlayer:getGroup():getLogs() <= 0) then
        config.notifyS(player, "Seu grupo não possui nenhuma mensagem no historico.", "error")
        return
    end

    local clearedLogs = getLogsAPI():clearLogs(groupPlayer:getGroup():getTag())
    config.notifyS(player, clearedLogs[1], clearedLogs[2])
end
addEvent("MST:clearLog", true)
addEventHandler("MST:clearLog", getRootElement(), clearLog)