class 'Invites' {
    constructor = function (self)
    end,

    getInviteId = function (self)
        return self.inviteId
    end,

    setInviteId = function (self, inviteId)
        self.inviteId = inviteId
    end,
    
    getInvited = function (self) -- Pessoa que enviou
        return self.invited
    end,

    setInvited = function (self, invited)
        self.invited = invited
    end,

    getGroupTagInvite = function (self)
        return self.groupTagInvite
    end,

    setGroupTagInvite = function (self, groupTagInvite)
        self.groupTagInvite = groupTagInvite
    end,
    
    getGroupNameInvite = function (self)
        return self.groupNameInvite
    end,

    setGroupNameInvite = function (self, groupNameInvite)
        self.groupNameInvite = groupNameInvite
    end,

    getCreatedAt = function (self)
        return self.createdAt
    end,

    setCreatedAt = function (self, createdAt)
        self.createdAt = createdAt
    end,
}