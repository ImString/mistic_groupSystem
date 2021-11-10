function reloadTops(player)
    if (player) then
        local accountName = getAccountName(getPlayerAccount(player))
        local groupPlayer = getGroupManager():getGroupPlayer(accountName)
        local group = groupPlayer:getGroup()
        local amount = getSql():getTotalMounthTransfer(group)
        local amountDay = getSql():getTotalDailyTransfer(group)

        group:setMonthlyBalance(amount)
        group:setDailyBalance(amountDay)
        player:triggerEvent("MST:updateValues", player, groupPlayer)
    end
end
addEvent("MST:reloadTops", true)
addEventHandler("MST:reloadTops", getRootElement(), reloadTops)

function depositBalance(player, amount)
    if (player and amount) then
        local accountName = getAccountName(getPlayerAccount(player))
        local groupPlayer = getGroupManager():getGroupPlayer(accountName)
        local playerBalance = getPlayerMoney(player)
        local group = groupPlayer:getGroup()
        local groupTag = group:getTag()
        amount = tonumber(amount)

        if (playerBalance < amount) then
            config.notifyS(player, "Você não possui 'R$"..formatNumber(amount, ".").."' na carteira.", "aviso")
            return
        end
        
        takePlayerMoney(player, amount)
        getTransferAPI():createTransfer(accountName, groupTag, amount)
        config.notifyS(player, "Você deposito 'R$"..formatNumber(amount, ".").."' para a "..group:getName()..".", "success")
        setTimer(function()
            reloadTops(player)
        end, 500, 1)
    end
end
addEvent("MST:depositBalance", true)
addEventHandler("MST:depositBalance", getRootElement(), depositBalance)

function removeBalance(player, amount)
    if (player and amount) then
        local accountName = getAccountName(getPlayerAccount(player))
        local groupPlayer = getGroupManager():getGroupPlayer(accountName)
        local group = groupPlayer:getGroup()
        local groupBalance = group:getBalance()
        local groupTag = group:getTag()
        amount = tonumber(amount)

        if (groupBalance < amount) then
            config.notifyS(player, "O grupo não possui 'R$"..formatNumber(amount, ".").."' no cofre.", "aviso")
            return
        end
        
        givePlayerMoney(player, amount)
        getTransferAPI():removeBalance(accountName, groupTag, amount)
        config.notifyS(player, "Você removeu 'R$"..formatNumber(amount, ".").."' do cofre de '"..group:getName().."'.", "success")
        setTimer(function()
            reloadTops(player)
        end, 500, 1)
    end
end
addEvent("MST:removeBalance", true)
addEventHandler("MST:removeBalance", getRootElement(), removeBalance)