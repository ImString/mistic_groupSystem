class 'SQLiteCore' {
    constructor = function (self)
        self.dbName = "data"
        self.dbLocation = "resources"
        self:initialize()
    end,

    initialize = function (self)
        if (self.dbName:find("/") or self.dbName:find("\\") or ends_with(self.dbName, ".db")) then
            error("The database name can not contain: /, \\, or .db", 2);
            return
        end

        self.connection = Connection("sqlite", self.dbLocation.."/"..self.dbName..".db")
    end,

    getConnection = function (self)
        if (self.connection == nil) then
            self:initialize()
        end

        return self.connection
    end,

    checkConnection = function (self)
        return self:getConnection() ~= nil
    end,

    close = function (self)
        self.connection = nil
    end,

    select = function (self, ...)
        return dbPoll(dbQuery(self:getConnection(), ...), -1)
    end,

    insert = function (self, query)
        return dbExec(self:getConnection(), query)
    end,
    
    update = function (self, query)
        return dbExec(self:getConnection(), query)
    end,
    
    delete = function (self, query)
        return dbExec(self:getConnection(), query)
    end,

    execute = function (self, ...)
        return self:getConnection():exec(...) 
    end,
}