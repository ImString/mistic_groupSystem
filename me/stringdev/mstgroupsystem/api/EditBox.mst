local sx, sy = guiGetScreenSize()

local editBox = { }
local mouseState = "normal"

function dxDrawEditBox(text, x, y, w, h, password, maxCharacter, colorText, alignTextBase, element)
    if not (editBox[element]) then
        editBox[element] = { }
        editBox[element]["Text"] = ""
        editBox[element]["State"] = false
        editBox[element]["Maxime"] = maxCharacter or 10
        editBox[element]["MouseState"] = "normal"
    end

	local getText = editBox[element]["Text"] or ""
	local state = editBox[element]["State"] or false
	local character = editBox[element]["Maxime"] or maxCharacter

	if (#getText == 0 and not state) then
		dxDrawText(text, x, y, x + w - 10, y + h, colorText, 0.7, font4, alignTextBase or "center", "center", true, false, false)
	else
		if (dxGetTextWidth(password and string.gsub(getText, ".", "•") or getText, 0.6, font4) <= w - 10) then
			dxDrawText(password and string.gsub(getText, ".", "•") or getText, x, y, x + w - 10, y + h, colorText, 0.6, font4, "left", "center", true, false, false)
		else
			dxDrawText(password and string.gsub(getText, ".", "•") or getText, x, y, x + w - 10, y + h, colorText, 0.6, font4, "right", "center", true, false, false)
		end
	end
	if (state) then
		if (dxGetTextWidth(password and string.gsub(getText, ".", "•") or getText, 0.6, font4) <= w - 10) then
			dxDrawLine(x + dxGetTextWidth(password and string.gsub(getText, ".", "•") or getText, 0.6, font4), y + 5, x + dxGetTextWidth(password and string.gsub(getText, ".", "•") or getText, 0.6, font4), y + h - 5, tocolor(0, 0, 0, math.abs(math.sin(getTickCount() / 150) * 150)), 1, false)
		else
			dxDrawLine(x + w - 10, y, x + w - 10, y + h - 5, tocolor(0, 0, 0, math.abs(math.sin(getTickCount() / 150) * 150)), 1, false)
		end
	end

	if (isCursorOnElement(x, y, w, h)) then
        editBox[element]["MouseState"] = "hovered"
    else
        editBox[element]["MouseState"] = "normal"
    end
end

function dxClickElement(button, state, cx, cy)
	if (button == "left") and (state == "down") then
		local editBoxId = false
		for id, element in ipairs(getElementsByType("groupScriptBox")) do
			if (editBox[element] and editBox[element]["MouseState"] == "hovered") then
				editBoxId = id
			elseif (editBox[element] and editBox[element]["MouseState"] == "normal") then
				if (editBox[element] and editBox[element]["State"] == true) then
					guiSetInputMode("allow_binds")
                    editBox[element]["State"] = false
				end
			end
		end
		if (editBoxId) then
			if (isElement(getElementsByType("groupScriptBox")[editBoxId])) then
				if (editBox[getElementsByType("groupScriptBox")[editBoxId]] and editBox[getElementsByType("groupScriptBox")[editBoxId]]["State"] == false) then
					guiSetInputMode("no_binds")
                    editBox[getElementsByType("groupScriptBox")[editBoxId]]["State"] = true
				end
			end
		end
	end
end
addEventHandler("onClientClick", getRootElement(), dxClickElement)

function dxCharacterElement(button)
	if (isChatBoxInputActive()) or (isConsoleActive()) or (isMainMenuActive()) then
		return
	end
	for _, element in ipairs(getElementsByType("groupScriptBox")) do
        if (editBox[element] and editBox[element]["State"] == true) then
			if (#editBox[element]["Text"] < editBox[element]["Maxime"]) then
				if (element:getData("number")) then
					if (tonumber(button)) then
                        editBox[element]["Text"] = editBox[element]["Text"]..button
					end
				else
                    editBox[element]["Text"] = editBox[element]["Text"]..(element:getData("forceUpper") and button:upper() or button)
				end
			end
		end
	end
end
addEventHandler("onClientCharacter", getRootElement(), dxCharacterElement)

function dxKeyElement(button, press)
	if (isChatBoxInputActive()) or (isConsoleActive()) or (isMainMenuActive()) then
		return
	end
	if (press) and (button == "backspace") then
		for _, element in ipairs(getElementsByType("groupScriptBox")) do
            if (editBox[element] and editBox[element]["State"] == true) then
				if (#editBox[element]["Text"] > 0) then
                    editBox[element]["Text"] = editBox[element]["Text"]:sub(1, #editBox[element]["Text"] - 1)
				end
			end
		end
	end
end
addEventHandler("onClientKey", getRootElement(), dxKeyElement)

function dxGetEditBoxText(element)
	if not (editBox[element]) then 
		return "" 
	end
	if not (editBox[element]["Text"]) then 
		return "" 
	end

	return editBox[element]["Text"]
end

function dxSetEditBoxText(element, text)
	if not (editBox[element]) then return end

	editBox[element]["Text"] = text
end