function onUpdateNick(oldNick, newNick, changedByUser)
    local player = source
    local accountName = getAccountName(getPlayerAccount(player))

    local gp = GroupManager():getGroupPlayer(accountName)
    gp:setNickName(newNick)
    GroupManager():importGroupPlayer(gp)
    SQL():updateGroupPlayer(gp)
end
addEventHandler("onPlayerChangeNick", getRootElement(), onUpdateNick)