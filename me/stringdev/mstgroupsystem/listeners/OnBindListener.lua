local delayTimer = { }
function onStartBindAll()
    for _, player in ipairs(getElementsByType("player")) do
        bindKey(player, config["BindOpen"], "down", bindOpenInitial)
    end
end
addEventHandler("onResourceStart", resourceRoot, onStartBindAll)

function loginPlayerAddBind()
    bindKey(source, config["BindOpen"], "down", bindOpenInitial)
end
addEventHandler("onPlayerLogin", getRootElement(), loginPlayerAddBind)

function bindOpenInitial(player)
    if (delayTimer[player]) then
        config.notifyS(player, "Aguarde '"..config["DelayOpen"].."' segundos para abrir novamente.", "error", 3) 
        return
    end

    local accountName = getAccountName(getPlayerAccount(player))
    local groupPlayer = getGroupManager():getGroupPlayer(accountName)

    if (groupPlayer:getGroup() ~= nil) then
        groupPlayer:getGroup():updateTopMember()
    end
    
    player:triggerEvent("MST:groupPageManager", player, groupPlayer)

    delayTimer[player] = true
    setTimer(function()
        delayTimer[player] = false
    end, (config["DelayOpen"]*1000), 1)
end