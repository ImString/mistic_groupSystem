class 'CreateGroupCommand' {
    commandName = config["GroupCreateCommand"]["Command"],
    aliases = config["GroupCreateCommand"]["Aliases"],
    
    execute = function (player)
        if not (isPlayerInACL(player, config["GroupCreateCommand"]["ACL"])) then return end

        player:triggerEvent("MST:createGroupPanel", player)
    end,

    getName = function (self)
        return self.commandName
    end,

    getAliases = function (self)
        return self.aliases
    end,

    getFunction = function (self, ...)
        return self.execute
    end,
}