class 'LogsAPI' {
    constructor = function (self)
    end,

    createLogs = function (self, group, text, type)
        if (group and text and type) then
            local logs = Logs()
            local logsType = LogsType():select(type)

            logs:setId(getSql():getFreeID("mstgroups_logs", "id"))
            logs:setMessage(text)
            logs:setType(logsType)
            logs:setCreatedAt(getRealTime().timestamp)
            
            group:importLogs(logs)
            getSql():insertLogs(group, logs)
        end
    end,

    clearLogs = function (self, groupTag)
        if not (groupTag) then return end

        local group = getGroupManager():getGroup(groupTag)
        if not (group) then
            return {"Este grupo nao foi encontrado", "error"}
        end

        local objectClear = { }
        group:setLogs(objectClear)
        getGroupManager():importGroup(group)
        getSql():deleteAllLogs(group)
        
        return {"Logs limpadas com sucesso!", "success"}
    end,
}