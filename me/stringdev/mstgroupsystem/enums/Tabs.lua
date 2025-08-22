class 'Tabs' {
    constructor = function (self)
        self.enum = {
            ["NoHave"] = onRenderNoHave,
            ["HomeFac"] = onRenderHomeF,
            ["HomeCorp"] = onRenderHomeC,
            ["Members"] = onRenderMember,
            ["Economy"] = onRenderEconomy,
            ["Logs"] = onRenderLogs,
        }
    end,

    select = function (self, selectedTab)
        if (self.enum[selectedTab]) then
            self.tabSelect = selectedTab
            return self
        end

        return nil
    end,

    getEventFunction = function (self)
        local selected = self.tabSelect
        return self.enum[selected]
    end,

    toString = function (self)
        return self.tabSelect
    end,
}