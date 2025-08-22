class 'LogsType' {
    constructor = function (self)
        self.enum = {
            ["success"] = { "Sucesso", tocolor(76, 133, 95), "#4C855F" },
            ["warning"] = { "Alerta", tocolor(166, 168, 54), "#A6A836" },
            ["error"] = { "Erro", tocolor(168, 54, 54), "#A83636" },
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
        return self.enum[selected][1]
    end,
    
    getColor = function (self)
        local selected = self.typeSelect
        return self.enum[selected][2]
    end,
    
    getHex = function (self)
        local selected = self.typeSelect
        return self.enum[selected][3]
    end,

    toString = function (self)
        return self.typeSelect
    end,
}