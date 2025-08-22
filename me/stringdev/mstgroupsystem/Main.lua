local sql = false
local groupManager = false

-- Script Started
function startScript()
    -- Load ACLHelp
    if (config["ACLHelp"]["State"]) then
        local policeGroup = ACLGroup.get(config["ACLHelp"]["PoliceAcl"])
        if (policeGroup) then
            policeGroup:destroy()
        end

        local factionGroup = ACLGroup.get(config["ACLHelp"]["FactionAcl"])
        if (factionGroup) then
            factionGroup:destroy()
        end

        ACLGroup(config["ACLHelp"]["PoliceAcl"])
        ACLGroup(config["ACLHelp"]["FactionAcl"])
    end

    -- Load Normal
    groupManager = GroupManager()
    sql = SQL():openConnection()
    groupManager:loadGroups()
    groupManager:loadPlayers()
    sql:loadTransference()
    sql:loadLogs()
    sql:loadTop()

    setTimer(function()
        CommandManager():loadCommands()
    end, 1000, 1)
    
    setTimer(function()
        for _, player in ipairs(getElementsByType("player")) do
            local playerAccount = player:getAccount()
            
            if (isGuestAccount(playerAccount)) then return end
            
            local accountName = playerAccount:getName()
            if not (groupManager:getGroupPlayer(accountName)) then
                local newGp = GroupPlayer()
                local objectClear = {}
                
                local playerId = player:getData(config["ElementData"]["ID"]) or playerAccount:getID()
    
                newGp:setId(playerId)
                newGp:setName(accountName)
                newGp:setNickName(player:getName())
                newGp:setGroup(nil)
                newGp:setGroupRole(GroupRole():select("NONE"))
                newGp:setOnline(true)
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
    
                getGroupManager():importGroupPlayer(newGp)
                getSql():insertGroupPlayer(newGp)
            else
                local gp = getGroupManager():getGroupPlayer(accountName)
                
                gp:setNickName(player:getName())
                gp:setOnline(true)

                getGroupManager():importGroupPlayer(gp)
            end
        end
    end, 1000, 1)
end
addEventHandler("onResourceStart", resourceRoot, startScript)

function getPlayerAPI()
    return PlayerAPI()
end

function getGroupAPI()
    return GroupAPI()
end

function getTransferAPI()
    return TransferAPI()
end

function getLogsAPI()
    return LogsAPI()
end

function getGroupManager()
    return groupManager
end

function getSql()
    return sql
end