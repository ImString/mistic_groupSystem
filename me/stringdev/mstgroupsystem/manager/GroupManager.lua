local groups = { }
local groupPlayer = { }

class 'GroupManager' {
    loadGroups = function (self)
        local groups = getSql():retrieveGroups()

        for _, group in ipairs(groups) do
            self:importGroup(group)
        end
    end,
    
    loadPlayers = function (self)
        local players = getSql():retrievePlayers()
        local groups = getSql():retrieveGroups()

        for _, groupPlayer in ipairs(players) do
            self:importGroupPlayer(groupPlayer)

            if (groupPlayer:getGroup() ~= nil) then
                groupPlayer:getGroup():importMember(groupPlayer)
            end
        end
    end,

    importGroup = function (self, group)
        groups[group:getTag()] = group
    end,
    
    destroyGroup = function (self, group)
        groups[group:getTag()] = nil
    end,

    importGroupPlayer = function (self, gp)
        groupPlayer[gp:getName()] = gp
    end,

    isGroup = function (self, tag)
        return groups[tag] ~= nil
    end,

    getGroup = function (self, tag)
        return groups[tag]
    end,

    getGroupByName = function (self, name)
        local groupSearch = false
        for _, group in ipairs(groups) do
            if (group:getName() == name) then
                groupSearch = group
                break
            end
        end

        return groupSearch
    end,

    getGroupByPlayerName = function (self, accountName)
        local gp = self:getGroupPlayer(accountName)

        if (gp ~= null) then
            return gp:getGroup()
        end

        return nil
    end,

    getGroups = function (self)
        return getAllValues(groups)
    end,

    getAllGroupsPlayers = function (self)
        return getAllValues(groupPlayer)
    end,

    getGroupPlayerByPlayer = function (self, player)
        local account = player:getAccount()
        if not (account) then
            return false
        end

        local accountName = account:getName()
        return self:getGroupPlayer(accountName)
    end,

    getPlayerByGroupPlayer = function (self, gp)
        local playerSearch = false
        for _, player in ipairs(getElementsByType("player")) do
            if (self:getGroupPlayerByPlayer(player):getName() == gp:getName()) then
                playerSearch = player
                break
            end
        end

        return playerSearch
    end,

    getGroupPlayerByID = function (self, id)
        local groupPlayerSearch = false
        for _, groupPlayer in ipairs(self:getAllGroupsPlayers()) do
            if (groupPlayer:getId() == id) then
                groupPlayerSearch = groupPlayer
                break
            end
        end

        return groupPlayerSearch
    end,

    getGroupPlayer = function (self, accountName)
        local gp = groupPlayer[accountName]
        if (gp == nil) then
            return false
        end

        return gp
    end,

    getNewIdGroup = function (self)
        local result = getSql().core:select("SELECT `id` FROM `mstgroups_groups` ORDER BY `id` ASC")
        local newID = false
        for i, id in pairs(result) do
            if (id["id"] ~= i) then
                newID = i
                break
            end
        end

        if not (newID) then
            newID = #result + 1 
        end

        return newID
    end,
}