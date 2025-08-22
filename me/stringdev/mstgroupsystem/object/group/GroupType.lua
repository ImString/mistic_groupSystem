class 'GroupType' {
    constructor = function (self)
        self.enum = {
            [1] = "Faction",
            [2] = "Corporation",
            [3] = "Community",
        }
    end,

    select = function (self, selectedType)
        if (self.enum[selectedType]) then
            self.typeSelect = selectedType
            return self
        end

        return nil
    end,

    getName = function (self)
        local selected = self.typeSelect
        return self.enum[selected]
    end,

    getType = function (self)
        return self.typeSelect
    end,
}