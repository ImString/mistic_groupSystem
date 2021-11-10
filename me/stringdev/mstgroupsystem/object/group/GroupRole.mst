class 'GroupRole' {
    constructor = function (self)
        -- self.enum = {
        --     ["NONE"] = { "Nenhum", "Nenhum", "" },
        --     ["RECRUIT"] = { "Recruta", "Teste", "#8f8d89-" },
        --     ["MEMBER"] = { "Membro", "Cria", "#37de12+" },
        --     ["CAPTAIN"] = { "Capitao", "Braço direito", "#f59700*" },
        --     ["LEADER"] = { "Lider", "Dono do Morro", "#f71616**" },
        -- }
        self.enum = config["GroupsRoles"]
    end,

    select = function (self, selectedRole)
        if (self.enum[selectedRole]) then
            self.roleSelect = selectedRole
            return self
        end

        return nil
    end,

    getName = function (self, type)
        local selected = self.roleSelect
        if (type == 1 or type == "1" or type == "faction") then
            return self.enum[selected]["Faction"]
        elseif (type == 2 or type == "2" or type == "corporation") then
            return self.enum[selected]["Corporation"]
        end      
    end,
    
    getPrefix = function (self)
        local selected = self.roleSelect
        return self.enum[selected][2]
    end,

    toString = function (self)
        return self.roleSelect
    end,
}