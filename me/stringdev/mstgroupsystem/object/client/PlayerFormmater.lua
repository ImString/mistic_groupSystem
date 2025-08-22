class 'PlayerFormmater' {
    formatter = function (self, groupPlayer)
        self.id = groupPlayer.id
        self.name = groupPlayer.name
        self.nickname = groupPlayer.nickname
        self.group = groupPlayer.group
        self.groupRole = groupPlayer.groupRole
        self.online = groupPlayer.online or false
        self.balance = groupPlayer.balance
        self.drugsSell = groupPlayer.drugsSell
        self.weaponsSell = groupPlayer.weaponsSell
        self.drugsFabricate = groupPlayer.drugsFabricate
        self.weaponsFabricate = groupPlayer.weaponsFabricate
        self.playersRemand = groupPlayer.playersRemand
        self.learnedGuns = groupPlayer.learnedGuns
        self.seizedDrugs = groupPlayer.seizedDrugs
        self.invitations = groupPlayer.invitations
        self.createdAt = groupPlayer.createdAt
        self.updatedAt = groupPlayer.updatedAt

        return self
    end,

    isLeader = function (self)
        if (self:getGroupRole().roleSelect == GroupRole():select("LEADER").roleSelect) then
            return true
        end

        return false
    end,
    
    isSuperior = function (self)
        if (self:getGroupRole().roleSelect == GroupRole():select("LEADER").roleSelect) then
            return true
        end

        if (self:getGroupRole().roleSelect == GroupRole():select("CAPTAIN").roleSelect) then
            return true
        end

        return false
    end,

    isOnline = function (self)
        return self.online
    end,

    isHaveGroup = function (self)
        return group ~= nil
    end,

    getId = function (self)
        return self.id
    end,

    getName = function (self)
        return self.name
    end,

    getNickName = function (self)
        return self.nickname
    end,
    
    getGroup = function (self)
        return self.group
    end,

    getGroupRole = function (self)
        return self.groupRole
    end,

    getBalance = function (self)
        return self.balance or 0
    end,
    
    getDrugsSell = function (self)
        return self.drugsSell or 0
    end,

    getWeaponsSell = function (self)
        return self.weaponsSell or 0
    end,

    getDrugsFabricate = function (self)
        return self.drugsFabricate or 0
    end,

    getWeaponsFabricate = function (self)
        return self.weaponsFabricate or 0
    end,

    getPlayersRemand = function (self)
        return self.playersRemand or 0
    end,

    getLearnedGuns = function (self)
        return self.learnedGuns or 0
    end,

    getSeizedDrugs = function (self)
        return self.seizedDrugs or 0
    end,

    getInvitations = function (self)
        return self.invitations or {}
    end,

    getCreatedAt = function (self)
        return self.createdAt
    end,

    getUpdatedAt = function (self)
        return self.updatedAt
    end,
}