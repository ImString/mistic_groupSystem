local scroll = { }
local values = { }
local visible = 11

function onRenderLogs()
    local contentAlpha = interpolateBetween(cAlphaStart, 255, 255, cAlphaFinal, 0, 0, (getTickCount () - tickC) / 600, "Linear")
    local i = config["Interface"]

    dxDrawText("Historico", 504, 252, 89, 17, tocolor(57, 57, 57, contentAlpha), 0.7, font1, "left", "top", false, false, false, false, false)
    dxDrawRectangle(508, 298, 61, 1, tocolor(210, 210, 210, contentAlpha), false)
    if (getGroupPlayer():isLeader()) then
        drawButton(1145, 254, 173, 40, "Limpar Historico", { 60, 65, 75, contentAlpha }, { 42, 45, 49, contentAlpha }, { 0.6, font2, "center", "center" } )
    end

    dxDrawImage(508, 323, 795, 493, "me/stringdev/mstgroupsystem/assets/images/card2.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)

    local data = scroll["MST.GridLogs"] or 0
    local ammount = 0
    for i = 1, visible do
        local valuesTable = values[i + data]
        ammount = ammount + 1

        if (valuesTable) then
            local logs = formatLogs(valuesTable)
            local logText = logs:getMessage() or "ERROR 404"
            local logUpdateTimestamp = logs:getCreatedAt() or getRealTime().timestamp
            local logUpdateTime = getRealTime(logUpdateTimestamp)
            local logFormattedTime = string.format("%02d:%02d - %02d/%02d/%04d", logUpdateTime.hour, logUpdateTime.minute, logUpdateTime.monthday, logUpdateTime.month + 1, logUpdateTime.year + 1900)

            dxDrawText(logFormattedTime, 532, 346 + 42 * ammount - 50, 194, 14, tocolor(57, 57, 57, contentAlpha), 0.7, font2, "left", "top", false, false, false, false, false)
            dxDrawText(logText, 532, 362 + 42 * ammount - 50, 742, 13, tocolor(57, 57, 57, contentAlpha), 0.5, font4, "left", "top", false, false, false, false, false)
            dxDrawRectangle(532, 362 + 42 * ammount - 29, 34, 1, tocolor(200, 200, 200, contentAlpha), false)
        end
    end

    -- dxDrawRectangle(1284, 329, 11, 475, tocolor(41, 44, 50, contentAlpha), false)
    -- dxDrawImage(1286, 331, 6, 80, "me/stringdev/mstgroupsystem/assets/images/scroll.png", 0, 0, 0, tocolor(239, 239, 239, contentAlpha), false)
end

function onOpenLogs()
    values = { }
    values = table.reverse(getGroup():getLogs())
end

function onClickLogs(button, state)
    if (isEventHandlerAdded("onClientRender", getRootElement(), onRenderLogs)) then
        if (button == "left" and state == "down") then
            if (isCursorOnElement(1145, 254, 173, 40)) then
                if not (getGroupPlayer():isLeader()) then return end

                triggerServerEvent("MST:clearLog", localPlayer, localPlayer)
                closeGroupPanel()
            end
        end
    end
end
addEventHandler("onClientClick", getRootElement(), onClickLogs)

function valuesGridLog(button)
    if not (isCursorShowing()) then return end
    if (isEventHandlerAdded("onClientRender", getRootElement(), onRenderLogs)) then
        if (isCursorOnElement(508, 323, 795, 493)) then
            local data = scroll["MST.GridLogs"] or 0
            if button == "mouse_wheel_up" and data > 0 then
                data = data - 1
            elseif button == "mouse_wheel_down" and data < #values - visible then
                data = data + 1
            end
            scroll["MST.GridLogs"] = data
        end
    end
end
bindKey("mouse_wheel_up", "down", valuesGridLog)
bindKey("mouse_wheel_down", "down", valuesGridLog)