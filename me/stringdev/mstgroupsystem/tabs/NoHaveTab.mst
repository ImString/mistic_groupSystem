local scroll = { }
local values = { }
local action = { }
local visible = 11
local selectedItem = false

function onRenderNoHave()
    local contentAlpha = interpolateBetween(cAlphaStart, 255, 255, cAlphaFinal, 0, 0, (getTickCount () - tickC) / 600, "Linear")
    local i = config["Interface"]

    dxDrawText("Convites de Grupo", 504, 252, 174, 17, tocolor(57, 57, 57, contentAlpha), 0.7, font1, "left", "top", false, false, false, false, false)
    dxDrawRectangle(508, 286, 61, 1, tocolor(129, 129, 129, contentAlpha), false)

    local data = scroll["MST.GridInvites"] or 0
    local ammount = 0
    for i = 1, visible do
        local valuesTable = values[i + data]
        ammount = ammount + 1

        if (valuesTable) then
            local invUpdateTimestamp = valuesTable.createdAt or getRealTime().timestamp
            local invUpdateTime = getRealTime(invUpdateTimestamp)
            local invFormattedTime = string.format("%02d:%02d - %02d/%02d/%04d", invUpdateTime.hour, invUpdateTime.minute, invUpdateTime.monthday, invUpdateTime.month + 1, invUpdateTime.year + 1900)

            dxDrawText(valuesTable.groupNameInvite..", convidou você", 501, 346 + 42 * ammount - 50, 194, 14, (selectedItem == valuesTable and tocolor(57, 57, 57, contentAlpha) or tocolor(139, 139, 139, contentAlpha)), 0.7, font2, "left", "top", false, false, false, false, false)
            dxDrawText(invFormattedTime, 501, 362 + 42 * ammount - 50, 742, 13, (selectedItem == valuesTable and tocolor(57, 57, 57, contentAlpha) or tocolor(139, 139, 139, contentAlpha)), 0.5, font4, "left", "top", false, false, false, false, false)
            dxDrawRectangle(501, 362 + 42 * ammount - 29, 34, 1, tocolor(200, 200, 200, contentAlpha), false)
        end
    end

    dxRoundedRectangle(1168, 792, 161, 40, false, tocolor(i["ButtonColor"][1], i["ButtonColor"][2], i["ButtonColor"][3], contentAlpha), tocolor(i["ButtonColorPassed"][1], i["ButtonColorPassed"][2], i["ButtonColorPassed"][3], contentAlpha), false)
    dxDrawImage(1183, 805, 15, 15, newUserIcon, 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
    dxDrawText("Entrar no Grupo", 1209, 804, 100, 12, tocolor(255, 255, 255, contentAlpha), 0.5, font9, "left", "top", false, false, false, false, false)
end

function onOpenNoHave()
    values = { }
    values = getGroupPlayer():getInvitations()
end

function onClickNoHave(button, state)
	if (isEventHandlerAdded("onClientRender", getRootElement(), onRenderNoHave)) then
        if (state == "down") then
            if (getGroup() == nil) then
                if (isCursorOnElement(1168, 792, 161, 40)) then
                    if (getGroup()) then
                        config.notifyC("Você já esta em um grupo.", "error")
                        return
                    end
                
                    if not (selectedItem) then
                        config.notifyC("Você não selecionou nenhum convite.", "error")
                        return
                    end

                    triggerServerEvent("MST:joinGroup", localPlayer, localPlayer, selectedItem.groupTagInvite)
                    closeGroupPanel()
                    return
                end

                if (isCursorOnElement(464, 222, 992, 636)) then
                    local ammount = 0
                    for i = 1, visible do
                        local offset = scroll["MST.GridInvites"] or 0
                        local valuesTable = values[i + offset]
                        ammount = ammount+1
                    
                        if (valuesTable) then
                            if (isCursorOnElement(494, 314 + 43 * ammount - 29, 848, 46)) then
                                selectedItem = valuesTable
                                break
                            end
                        end
                    end
                end
			end
		end
	end
end
addEventHandler("onClientClick", getRootElement(), onClickNoHave)