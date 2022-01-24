class 'IDSystem' {
    getPlayerID = function (self, player)
        return player:getData(config["ElementData"]["ID"]) or "N/A"
    end,

    getPlayerByID = function (self, id)
    	local playerSearch = false

    	for i, player in ipairs(getElementsByType("player")) do
    		if (player:getData(config["ElementData"]["ID"]) == id) then
    			playerSearch = player
    			break
    		end
    	end
        
    	return playerSearch
    end,
}