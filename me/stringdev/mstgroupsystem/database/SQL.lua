class 'SQL' {
    constructor = function (self)
        
    end,

    openConnection = function (self)
        if not (isHaveProtection()) then return end

        self.core = SQLiteCore()

        if (self.core:checkConnection()) then
            local query = "CREATE TABLE IF NOT EXISTS `mstgroups_groups` (`id` int(11) NOT NULL, `name` varchar(255) NOT NULL, `tag` varchar(255) NOT NULL, `max_members` int(256) NOT NULL DEFAULT "..config["MaxMember"]..", `balance` int(256) NOT NULL DEFAULT 0, `group_type` int(256) NOT NULL, `owner` varchar(255) NOT NULL, `created_at` bigint NOT NULL)"
            self.core:execute(query)
            local query2 = "CREATE TABLE IF NOT EXISTS `mstgroups_players` (`user_id` int(11) NOT NULL, `name` varchar(255) NOT NULL, `nickname` varchar(255), `role` varchar(255) NOT NULL, `group_tag` varchar(255) NOT NULL, `drugs_sell` int(256) NOT NULL DEFAULT 0, `weapons_sell` int(256) NOT NULL DEFAULT 0, `drugs_fabricate` int(256) NOT NULL DEFAULT 0, `weapons_fabricate` int(256) NOT NULL DEFAULT 0, `players_remand` int(256) NOT NULL DEFAULT 0, `learned_guns` int(256) NOT NULL DEFAULT 0, `seized_drugs` int(256) NOT NULL DEFAULT 0, `created_at` bigint NOT NULL, `updated_at` bigint NOT NULL)"
            self.core:execute(query2)
            local query3 = "CREATE TABLE IF NOT EXISTS `mstgroups_logs` (`id` int(11) NOT NULL, `tag` varchar(255) NOT NULL, `message` varchar(256) NOT NULL, `type` TEXT, `created_at` bigint NOT NULL)"
            self.core:execute(query3)
            local query4 = "CREATE TABLE IF NOT EXISTS `mstgroups_transference` (`id` int(11) NOT NULL, `user_name` varchar(255) NOT NULL, `group_tag` varchar(256) NOT NULL, `amount` int(11), `transfer_at` DATETIME NOT NULL)"
            self.core:execute(query4)
        end

        return self
    end,

    insertLogs = function (self, group, log)
        if not (isHaveProtection()) then return end

        local query = "INSERT INTO `mstgroups_logs` (`id`, `tag`, `message`, `type`, `created_at`) "
        local values = "VALUES ("..log:getId()..", '"..group:getTag().."', '"..log:getMessage().."', '"..log:getType():toString().."', '"..log:getCreatedAt().."')"
        getSql().core:insert(query..values)
    end,

    insertGroupPlayer = function (self, gp)
        if not (isHaveProtection()) then return end

        local query = "INSERT INTO `mstgroups_players` (`user_id`, `name`, `nickname`, `role`, `group_tag`, `drugs_sell`, `weapons_sell`, `drugs_fabricate`, `weapons_fabricate`, `players_remand`, `learned_guns`, `seized_drugs`, `created_at`, `updated_at`) "
        local values = "VALUES ("..gp:getId()..", '"..gp:getName().."', '"..gp:getNickName().."', '"..gp:getGroupRole():toString().."', '"..(gp:getGroup() ~= nil and escapeQuotes(gp:getGroup():getTag()) or "Nenhum").."', "..gp:getDrugsSell()..", "..gp:getWeaponsSell()..", "..gp:getDrugsFabricate()..", "..gp:getWeaponsFabricate()..", "..gp:getPlayersRemand()..", "..gp:getLearnedGuns()..", "..gp:getSeizedDrugs()..", "..gp:getCreatedAt()..", "..gp:getUpdatedAt()..");"
        getSql().core:insert(query..values)
    end,

    insertGroup = function (self, group)
        if not (isHaveProtection()) then return end

        local query = "INSERT INTO `mstgroups_groups` (`id`, `name`, `tag`, `max_members`, `balance`, `group_type`, `owner`, `created_at`) "
        local values = "VALUES ("..group:getId()..", '"..group:getName().."', '"..group:getTag().."', "..group:getMaxMembers()..", "..group:getBalance()..", "..group:getGroupType()..", '"..group:getOwner():getName().."', "..group:getCreatedAt()..")"
        getSql().core:insert(query..values)
    end,

    updateGroupPlayer = function (self, gp)
        if not (isHaveProtection()) then return end

        local query = "UPDATE `mstgroups_players` SET nickname = '"..gp:getNickName().."', role = '"..gp:getGroupRole():toString().."', group_tag = '"..(gp:getGroup() ~= nil and escapeQuotes(gp:getGroup():getTag()) or "Nenhum").."', drugs_sell = "..gp:getDrugsSell()..", weapons_sell = "..gp:getWeaponsSell()..", drugs_fabricate = "..gp:getDrugsFabricate()..", weapons_fabricate = "..gp:getWeaponsFabricate()..", players_remand = "..gp:getPlayersRemand()..", learned_guns = "..gp:getLearnedGuns()..", seized_drugs = "..gp:getSeizedDrugs()..", created_at = "..gp:getCreatedAt()..", updated_at = "..gp:getUpdatedAt().." WHERE name = '"..gp:getName().."';"
        getSql().core:update(query)
    end,

    updateGroup = function (self, group)
        if not (isHaveProtection()) then return end

        local query = "UPDATE `mstgroups_groups` SET name = '"..group:getName().."', max_members = "..group:getMaxMembers()..", balance = "..group:getBalance()..", group_type = "..group:getGroupType()..", owner = '"..group:getOwner().."', created_at = "..group:getCreatedAt().." WHERE tag = '"..group:getTag().."'"
        getSql().core:update(query)
    end,

    deleteGroup = function (self, group)
        if not (isHaveProtection()) then return end

        local query = "DELETE FROM `mstgroups_groups` WHERE tag = '"..group:getTag().."';"
        getSql().core:delete(query)
    end,

    deleteAllLogs = function (self, group)
        if not (isHaveProtection()) then return end

        local query = "DELETE FROM `mstgroups_logs` WHERE tag = '"..group:getTag().."';"
        getSql().core:delete(query)
    end,

    deleteTransferPlayer = function (self, accountName)
        if not (isHaveProtection()) then return end

        local query = "DELETE FROM `mstgroups_transference` WHERE user_name = '"..accountName.."'"
        getSql().core:delete(query)
    end,
    
    deleteTransferGroup = function (self, groupTag)
        if not (isHaveProtection()) then return end

        local query = "DELETE FROM `mstgroups_transference` WHERE group_tag = '"..accountName.."'"
        getSql().core:delete(query)
    end,

    insertTransfer = function (self, transfer)
        if not (isHaveProtection()) then return end

        local dateString = os.date("%Y-%m-%d %X", transfer:getTransferAt())
        local query = "INSERT INTO `mstgroups_transference` (`id`, `user_name`, `group_tag`, `amount`, `transfer_at`) "
        local values = "VALUES ("..transfer:getId()..", '"..transfer:getUser():getName().."', '"..(transfer:getGroup() ~= nil and escapeQuotes(transfer:getGroup():getTag()) or "Indefinido").."', "..transfer:getAmount()..", '"..dateString.."')"
        getSql().core:insert(query..values)
    end,

    getTotalTransfer = function (self, group)
        if not (isHaveProtection()) then return 0 end

        local amount = 0

        local query = "SELECT * FROM `mstgroups_transference` WHERE `group_tag` = '"..group:getTag().."'"
        local res = getSql().core:select(query)

        if (res == nil) then
            for _, row in ipairs(res) do
                amount = amount + row["amount"]
            end
        end
        
        return amount
    end,

    getTotalMounthTransfer = function (self, group)
        if not (isHaveProtection()) then return 0 end

        local actualTime = getRealTime()
        local year = actualTime.year + 1900
        local month = actualTime.month + 1
        local query = "SELECT SUM(`amount`) as `somaMes` FROM `mstgroups_transference` WHERE `group_tag` = '"..group:getTag().."' AND `transfer_at` LIKE '"..year.."-"..addZero(month).."%'"
        local res = getSql().core:select(query)

        return res[1]["somaMes"]
    end,
    
    getTotalDailyTransfer = function (self, group)
        if not (isHaveProtection()) then return 0 end

        local actualTime = getRealTime()
        local year = actualTime.year + 1900
        local month = actualTime.month + 1
        local day = actualTime.monthday

        local query = "SELECT SUM(`amount`) as `somaDay` FROM `mstgroups_transference` WHERE `group_tag` = '"..group:getTag().."' AND `transfer_at` LIKE '"..year.."-"..addZero(month).."-"..addZero(day).."%'"
        local res = getSql().core:select(query)

        return res[1]["somaDay"]
    end,

    getMemberOfTheMonth = function (self, group)
        if not (isHaveProtection()) then return 0 end

        local actualTime = getRealTime()
        local year = actualTime.year + 1900
        local month = actualTime.month + 1
        local query = "SELECT SUM(`amount`) as `somaMes` FROM `mstgroups_transference` WHERE `group_tag` = '"..group:getTag().."' AND `transfer_at` LIKE '"..year.."-"..addZero(month).."%'"
        local res = getSql().core:select(query)

        return res[1]["somaMes"]
    end,

    retrievePlayers = function (self)
        if not (isHaveProtection()) then return end

        local out = { }
        local objectClear = {}

        local query = "SELECT * FROM `mstgroups_players`"
        local res = getSql().core:select(query)

        if (res ~= nil) then
            for _, row in ipairs(res) do
                local gp = GroupPlayer()
                local tag = row["group_tag"]
                gp:setId(row["user_id"])
                gp:setName(row["name"])
                gp:setNickName(row["nickname"])
                gp:setGroupRole(GroupRole():select(row["role"]))
                if (tag ~= "Nenhum") then
                    local group = GroupManager():getGroup(tag)
                    gp:setGroup(group)

                    -- ACL Help
                    setTimer(function()
                        if (config["ACLHelp"]["State"]) then
                            local aclGroup = ACLGroup.get(group:getTag())
                            if (aclGroup) then
                                aclGroup:addObject("user."..row["name"])
                            end
    
                            if (group:getGroupType() == 1) then -- Faction
                                local factionGroup = ACLGroup.get(config["ACLHelp"]["FactionAcl"])    
                                factionGroup:addObject("user."..row["name"])
                            elseif (group:getGroupType() == 2) then
                                local policeGroup = ACLGroup.get(config["ACLHelp"]["PoliceAcl"])    
                                policeGroup:addObject("user."..row["name"])
                            end
                        end
                    end, 1000, 1)
                end
                gp:setBalance(0)
                gp:setDrugsSell(row["drugs_sell"])
                gp:setWeaponsSell(row["weapons_sell"])
                gp:setDrugsFabricate(row["drugs_fabricate"])
                gp:setWeaponsFabricate(row["weapons_fabricate"])
                gp:setPlayerRemand(row["players_remand"])
                gp:setLearnedGuns(row["learned_guns"])
                gp:setSeizedDrugs(row["seized_drugs"])
                gp:setInvitations(objectClear)
                gp:setCreatedAt(row["created_at"])
                gp:setUpdatedAt(row["updated_at"])

                table.insert(out, gp)
            end
        end

        return out
    end,

    retrieveGroups = function (self)
        if not (isHaveProtection()) then return end

        local out = { }

        local query = "SELECT * FROM `mstgroups_groups`"
        local res = getSql().core:select(query)

        if (res ~= nil) then
            for _, row in ipairs(res) do
                local groupObject = Group()
                groupObject:setId(row["id"])
                groupObject:setName(row["name"])
                groupObject:setTag(row["tag"])
                groupObject:setMaxMembers(row["max_members"])
                groupObject:setBalance(row["balance"])
                groupObject:setMaxBalance(0)
                groupObject:setMonthlyBalance(0)
                groupObject:setDailyBalance(0)
                groupObject:setGroupType(row["group_type"])
                groupObject:setOwner(row["owner"])
                groupObject:setMemberOfTheMonth("Indefinido")
                groupObject:setCreatedAt(row["created_at"])

                if (config["ACLHelp"]["State"]) then
                    local aclGroup = ACLGroup.get(row["tag"])
                    if (aclGroup) then
                        aclGroup:destroy()
                    end
                    ACLGroup(row["tag"])
                end

                table.insert(out, groupObject)
            end
        end

        return out
    end,

    loadLogs = function (self)
        if not (isHaveProtection()) then return end

        local query = "SELECT * FROM `mstgroups_logs`"
        local res = getSql().core:select(query)

        if (res ~= nil) then
            for _, row in ipairs(res) do
                local group = getGroupManager():getGroup(row["tag"])
                if (group ~= nil) then
                    local logs = Logs()
                    logs:setId(row["id"])
                    logs:setMessage(row["message"])
                    logs:setType(LogsType():select(row["type"]))
                    logs:setCreatedAt(row["created_at"])
                    group:importLogs(logs)

                    getGroupManager():importGroup(group)
                end
            end
        end
    end,

    loadTransference = function (self)
        if not (isHaveProtection()) then return end

        local query = "SELECT * FROM `mstgroups_transference`"
        local res = getSql().core:select(query)

        if (res ~= nil) then
            for _, row in ipairs(res) do
                local groupPlayer = getGroupManager():getGroupPlayer(row["user_name"])
                if (groupPlayer ~= nil) then
                    local group = getGroupManager():getGroup(row["group_tag"])
                    if (group ~= nil) then
                        local transference = Transfer()
                        transference:setId(row["id"])
                        transference:setUser(groupPlayer)
                        transference:setGroup(group)
                        transference:setAmount(row["amount"])
                        transference:setTransferAt(row["transfer_at"])
                        groupPlayer:addBalance(row["amount"])
                        group:addMaxBalance(row["amount"])
                    end
                end
            end
        end
    end,

    loadTop = function (self)
        if not (isHaveProtection()) then return end

        for k, group in pairs(getGroupManager():getGroups()) do
            local amount = self:getTotalMounthTransfer(group) or 0
            local amountDay = self:getTotalDailyTransfer(group) or 0

            group:setMonthlyBalance(amount)
            group:setDailyBalance(amountDay)
        end
    end,

    getFreeID = function (self, table, column)
        if not (isHaveProtection()) then return end

        local newID = false

        local query = "SELECT `"..column.."` FROM `"..table.."` ORDER BY "..column.." ASC"
        local res = getSql().core:select(query)

        if (res ~= nil) then
            for i, id in pairs(res) do
                if (id[column] ~= i) then
                    newID = i
                    break
                end
            end

            if not (newID) then
                newID = #res + 1 
            end
        end

        return newID
    end,

    closeConnection = function (self)
        if not (isHaveProtection()) then return end
        
        getSql().core:close()
    end,
}