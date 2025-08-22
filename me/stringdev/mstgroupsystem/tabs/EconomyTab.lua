local scroll = { }
local values = { }
local action = { }
local visible = 9

local visibleState = {
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
}

local addBalanceBox = createElement("groupScriptBox")
addBalanceBox:setData("number", true)
local removeBalanceBox = createElement("groupScriptBox")
removeBalanceBox:setData("number", true)

function onRenderEconomy()
    local mAlpha = interpolateBetween(mAlphaStart, 255, 255, mAlphaFinal, 0, 0, (getTickCount () - tickM) / 600, "Linear")
    local actionAlpha = interpolateBetween(actionAlphaStart, 255, 255, actionAlphaFinal, 0, 0, (getTickCount () - tickA) / 600, "Linear")
    local contentAlpha = interpolateBetween(cAlphaStart, 255, 255, cAlphaFinal, 0, 0, (getTickCount () - tickC) / 600, "Linear")
    local i = config["Interface"]

    dxDrawText("Cofre da "..(getGroup():getGroupType() == 1 and "facção" or "corporação"), 504, 252, 89, 17, tocolor(57, 57, 57, contentAlpha), 0.7, font1, "left", "top", false, false, false, false, false)
    
    if (getGroupPlayer():isLeader()) then
        drawButton(999, 258, 137, 40, "Adicionar Saldo", { 41, 40, 50, contentAlpha }, { 56, 59, 67, contentAlpha }, { 0.6, font9, "center", "center" } )
        drawButton(1143, 258, 137, 40, "Retirar Saldo", { 41, 40, 50, contentAlpha }, { 56, 59, 67, contentAlpha }, { 0.6, font9, "center", "center" } )
    else
        drawButton(1145, 258, 137, 40, "Adicionar Saldo", { 41, 40, 50, contentAlpha }, { 56, 59, 67, contentAlpha }, { 0.6, font9, "center", "center" } )
    end

    dxDrawRectangle(504, 293, 61, 1, tocolor(210, 210, 210, contentAlpha), false)

    local groupMoney = "R$"..formatNumber(getGroup():getBalance() or 0, ".")
    local groupMonthlyBalance = "R$"..formatNumber(getGroup():getMonthlyBalance() or 0, ".")
    local groupDailyBalance = "R$"..formatNumber(getGroup():getDailyBalance() or 0, ".")
    local groupTotalBalance = "R$"..formatNumber(getGroup():getMaxBalance() or 0, ".")

    dxDrawImage(504, 318, 187, 100, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
    dxDrawText("Saldo Total", 525, 340, 61, 10, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
    dxDrawText(""..(visibleState[1] and groupMoney or groupMoney:gsub(".", "*")), 525, 367, 11, 17, tocolor(57, 57, 57, contentAlpha), 0.9, font2, "left", "top", false, false, false, false, false)
    dxDrawImage(661, 388, 15, 15, (visibleState[1] and visibleIcon or invisibleIcon), 0, 0, 0, tocolor(57, 57, 57, contentAlpha), false)

    dxDrawImage(700, 318, 187, 100, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
    dxDrawText("Renda Mensal", 721, 340, 80, 10, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
    dxDrawText(""..(visibleState[2] and groupMonthlyBalance or groupMonthlyBalance:gsub(".", "*")), 721, 367, 11, 17, tocolor(57, 57, 57, contentAlpha), 0.9, font2, "left", "top", false, false, false, false, false)
    dxDrawImage(857, 388, 15, 15, (visibleState[2] and visibleIcon or invisibleIcon), 0, 0, 0, tocolor(57, 57, 57, contentAlpha), false)

    dxDrawImage(896, 318, 187, 100, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
    dxDrawText("Renda Diaria", 918, 340, 73, 10, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
    dxDrawText(""..(visibleState[3] and groupDailyBalance or groupDailyBalance:gsub(".", "*")), 918, 367, 11, 17, tocolor(57, 57, 57, contentAlpha), 0.9, font2, "left", "top", false, false, false, false, false)
    dxDrawImage(1053, 388, 15, 15, (visibleState[3] and visibleIcon or invisibleIcon), 0, 0, 0, tocolor(57, 57, 57, contentAlpha), false)
    
    dxDrawImage(1093, 318, 187, 100, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
    dxDrawText("Renda Total", 1114, 340, 67, 10, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
    dxDrawText(""..(visibleState[4] and groupTotalBalance or groupTotalBalance:gsub(".", "*")), 1114, 367, 11, 17, tocolor(57, 57, 57, contentAlpha), 0.9, font2, "left", "top", false, false, false, false, false)
    dxDrawImage(1250, 388, 15, 15, (visibleState[4] and visibleIcon or invisibleIcon), 0, 0, 0, tocolor(57, 57, 57, contentAlpha), false)

    dxDrawRectangle(504, 487, 810, 42, tocolor(57, 57, 57, contentAlpha), false)
    if (getGroup():getGroupType() == 2) then
        dxDrawText("Nome/ID", 523, 500, 54, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Jogadores P.", 705, 500, 46, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Drogas Ap.", 880, 500, 46, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Armas Ap.", 1044, 500, 46, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Renda", 1249, 500, 41, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)

        local data = scroll["MST.GridEconomy"] or 0
        local ammount = 0
        for i = 1, visible do
            local valuesTable = values[i + data]
            ammount = ammount + 1

            dxDrawRectangle(504, 528 + 33 * ammount - 25, 810, 31, tocolor(57, 57, 57, contentAlpha), false)

            if (valuesTable) then
                local groupPlayerList = formatGroupPlayer(valuesTable)
                local playerListName = groupPlayerList:getNickName() or "ERROR"
                local playerListID = groupPlayerList:getId() or "N/A"
                local playerBalance = groupPlayerList:getBalance() or 0
                local playerRemand = groupPlayerList:getPlayersRemand() or 0
	            local playerSeizedD = groupPlayerList:getSeizedDrugs() or 0
	            local playerLearnedG = groupPlayerList:getLearnedGuns() or 0

                dxDrawText(removeHex(playerListName).." # "..playerListID, 523, 534 + 33 * ammount - 25, 159, 10, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
                dxDrawText(""..formatNumber(playerRemand, "."), 651, 534 + 33 * ammount - 25, 844, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "center", "top", false, false, false, false, false)
                dxDrawText(""..formatNumber(playerSeizedD, "."), 821, 534 + 33 * ammount - 25, 1014, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "center", "top", false, false, false, false, false)
                dxDrawText(""..formatNumber(playerLearnedG, "."), 981, 534 + 33 * ammount - 25, 1174, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "center", "top", false, false, false, false, false)
                dxDrawText("R$"..formatNumber(playerBalance, "."), 1143, 534 + 33 * ammount - 25, 1296, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "right", "top", false, false, false, false, false)
            end
        end
    else
        dxDrawText("Nome/ID", 523, 500, 54, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Drogas F.", 667, 500, 65, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Drogas V.", 822, 500, 65, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Armas F.", 977, 500, 60, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Armas V.", 1132, 500, 60, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)
        dxDrawText("Renda", 1249, 500, 41, 12, tocolor(255, 255, 255, contentAlpha), 0.6, font2, "left", "top", false, false, false, false, false)

        local data = scroll["MST.GridEconomy"] or 0
        local ammount = 0
        for i = 1, visible do
            local valuesTable = values[i + data]
            ammount = ammount + 1

            dxDrawRectangle(504, 528 + 33 * ammount - 25, 810, 31, tocolor(57, 57, 57, contentAlpha), false)

            if (valuesTable) then
                local groupPlayerList = formatGroupPlayer(valuesTable)
                local playerListName = groupPlayerList:getNickName() or "ERROR"
                local playerListID = groupPlayerList:getId() or "N/A"
                local playerBalance = groupPlayerList:getBalance() or 0
                local playeDrugsSell = groupPlayerList:getDrugsSell() or 0
	            local playerWeaponsSell = groupPlayerList:getWeaponsSell() or 0
	            local playerDrugsFabricate = groupPlayerList:getDrugsFabricate() or 0
	            local playerWeaponsFabricate = groupPlayerList:getWeaponsFabricate() or 0

                dxDrawText(removeHex(playerListName).." # "..playerListID, 523, 534 + 33 * ammount - 25, 159, 10, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
                dxDrawText(""..formatNumber(playerDrugsFabricate, "."), 667, 534 + 33 * ammount - 25, 732, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "center", "top", false, false, false, false, false)
                dxDrawText(""..formatNumber(playeDrugsSell, "."), 822, 534 + 33 * ammount - 25, 887, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "center", "top", false, false, false, false, false)
                dxDrawText(""..formatNumber(playerWeaponsFabricate, "."), 977, 534 + 33 * ammount - 25, 1037, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "center", "top", false, false, false, false, false)
                dxDrawText(""..formatNumber(playerWeaponsSell, "."), 1116, 534 + 33 * ammount - 25, 1199, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "center", "top", false, false, false, false, false)
                dxDrawText("R$"..formatNumber(playerBalance, "."), 1143, 534 + 33 * ammount - 25, 1296, 552, tocolor(255, 255, 255, contentAlpha), 0.6, font4, "right", "top", false, false, false, false, false)
            end
        end
    end

    if (action["State"] == "AddBalance") then
        dxDrawImage(464, 222, 891, 636, background, 0, 0, 0, tocolor(0, 0, 0, mAlpha), false)
        dxRoundedRectangle(771, 470, 277, 122, false, tocolor(228, 228, 228, actionAlpha), false, false)
        drawButton(771, 551, 277, 41, "ADICIONAR SALDO", { 100, 69, 139, actionAlpha }, { 123, 88, 168, actionAlpha }, { 0.6, font2, "center", "center" } )
        dxDrawImage(893, 454, 33, 33, moneyIcon, 0, 0, 0, tocolor(255, 255, 255, actionAlpha), false)
        dxDrawRectangle(852, 531, 115, 1, tocolor(205, 205, 205, actionAlpha), false)
        dxDrawEditBox("Digite a Quantia", 771, 504, 277, 18, false, 9, tocolor(42, 42, 42, actionAlpha), "center", addBalanceBox)
    end
    
    if (action["State"] == "RemoveBalance") then
        dxDrawImage(464, 222, 891, 636, background, 0, 0, 0, tocolor(0, 0, 0, mAlpha), false)
        dxRoundedRectangle(771, 470, 277, 122, false, tocolor(228, 228, 228, actionAlpha), false, false)
        drawButton(771, 551, 277, 41, "RETIRAR SALDO", { 100, 69, 139, actionAlpha }, { 123, 88, 168, actionAlpha }, { 0.6, font2, "center", "center" } )
        dxDrawImage(893, 454, 33, 33, moneyIcon, 0, 0, 0, tocolor(255, 255, 255, actionAlpha), false)
        dxDrawRectangle(852, 531, 115, 1, tocolor(205, 205, 205, actionAlpha), false)
        dxDrawEditBox("Digite a Quantia", 771, 504, 277, 18, false, 9, tocolor(42, 42, 42, actionAlpha), "center", removeBalanceBox)
    end
end

function onOpenEconomy()
    values = { }
    action["State"] = nil

    local members = getGroup():getMembers()
    table.sort(members, compare)

    values = members
    triggerServerEvent("MST:reloadTops", localPlayer, localPlayer)
end

function compare(a,b)
    return formatGroupPlayer(a):getBalance() > formatGroupPlayer(b):getBalance()
end

function onClickBalance(button, state)
	if (isEventHandlerAdded("onClientRender", getRootElement(), onRenderEconomy)) then
		if (state == "down") then
            if (isCursorOnElement(661, 388, 15, 15)) then
                visibleState[1] = not visibleState[1]
            end

            if (isCursorOnElement(857, 388, 15, 15)) then
                visibleState[2] = not visibleState[2]
            end

            if (isCursorOnElement(1053, 388, 15, 15)) then
                visibleState[3] = not visibleState[3]
            end

            if (isCursorOnElement(1250, 388, 15, 15)) then
                visibleState[4] = not visibleState[4]
            end

            if (isCursorOnElement(1145, 258, 137, 40)) then
                if (action["State"] == nil) then
                    if not (getGroupPlayer():isLeader()) then 
                        openActionPageE("AddBalance")
                    end
                end
            end

            if (isCursorOnElement(999, 258, 137, 40)) then
                if (action["State"] == nil) then
                    if (getGroupPlayer():isLeader()) then
                        openActionPageE("AddBalance")
                    end
                end
            end
            
            if (isCursorOnElement(1143, 258, 137, 40)) then
                if (action["State"] == nil) then
                    if (getGroupPlayer():isLeader()) then
                        openActionPageE("RemoveBalance")
                    end
                end
            end

            -- Add Balance Area
            if (isCursorOnElement(771, 551, 277, 41)) then -- Confirm Balance
                if (action["State"] == "AddBalance") then
                    local amountDeposit = tonumber(dxGetEditBoxText(addBalanceBox))
                    if (amountDeposit == nil or amountDeposit == false or amountDeposit < 0) then
                        config.notifyC("Informe uma quantia valida.", "error")
                        return
                    end

                    triggerServerEvent("MST:depositBalance", localPlayer, localPlayer, amountDeposit)
                    dxSetEditBoxText(addBalanceBox, "")
                    closeActionPageE()
                end
            end

            -- Remove Balance Area
            if (isCursorOnElement(771, 551, 277, 41)) then -- Confirm Remove Balance
                if (action["State"] == "RemoveBalance") then
                    local amountRemove = tonumber(dxGetEditBoxText(removeBalanceBox))
                    if (amountRemove == nil or amountRemove == false or amountRemove < 0) then
                        config.notifyC("Informe uma quantia valida.", "error")
                        return
                    end

                    triggerServerEvent("MST:removeBalance", localPlayer, localPlayer, amountRemove)
                    dxSetEditBoxText(removeBalanceBox, "")
                    closeActionPageE()
                end
            end
        end
    end
end
addEventHandler("onClientClick", getRootElement(), onClickBalance)

function openActionPageE(page)
    action["State"] = page
    mAlphaStart = 0
	mAlphaFinal = 190
    actionAlphaStart = 0
	actionAlphaFinal = 255
    tickM = getTickCount()
    tickA = getTickCount()
end

function closeActionPageE()
    if (action["State"]) then
        mAlphaStart = 190
	    mAlphaFinal = 0
        actionAlphaStart = 255
	    actionAlphaFinal = 0
        tickM = getTickCount()
        tickA = getTickCount()
        setTimer(function()
            action["State"] = nil
            dxSetEditBoxText(addBalanceBox, "")
            dxSetEditBoxText(removeBalanceBox, "")
        end, 600, 1)
    end
end