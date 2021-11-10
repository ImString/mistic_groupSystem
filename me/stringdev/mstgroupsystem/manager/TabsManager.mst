local screenW, screenH = guiGetScreenSize()
local gp = false

local selectLocation = {
    ["NoHave"] = { 1355, -25, 3, 25 },
    ["HomeFac"] = { 1355, 367, 3, 25 },
    ["HomeCorp"] = { 1355, 367, 3, 25 },
    ["Members"] = { 1355, 449, 3, 25 },
    ["Economy"] = { 1355, 532, 3, 25 },
    ["Logs"] = { 1355, 615, 3, 25 },
}

function onRenderBase()
	local bAlpha = interpolateBetween(bAlphaStart, 255, 255, bAlphaFinal, 0, 0, (getTickCount () - tick) / 600, "Linear")
	local posX, posY, posW = interpolateBetween(startPosX, startPosY, startPosW, finishPosX, finishPosY, finishPosW, (getTickCount () - tickPos) / 400, "Linear")
	local i = config["Interface"]

	dxDrawImage(464, 222, 891, 636, background, 0, 0, 0, tocolor(i["Background"][1], i["Background"][2], i["Background"][3], bAlpha), false)
	dxDrawImage(1355, 222, 101, 636, background, 0, 0, 0, tocolor(i["MenuBar"][1], i["MenuBar"][2], i["MenuBar"][3], bAlpha), false)
	dxDrawImage(1375, 249, 62, 49, "me/stringdev/mstgroupsystem/assets/images/logo.png", 0, 0, 0, tocolor(255, 255, 255, bAlpha), false)
	
	dxDrawRectangle(1394, 324, 23, 1, tocolor(63, 65, 72, bAlpha), false)

	dxDrawRectangle(posX, posY, posW, selectLocation[actualTab:toString()][4], tocolor(i["SelectorTab"][1], i["SelectorTab"][2], i["SelectorTab"][3], bAlpha), false)
	dxDrawImage(1391, 365, 29, 29, homeIcon, 0, 0, 0, (actualTab:toString():find("Home") and tocolor(i["IconSelected"][1], i["IconSelected"][2], i["IconSelected"][3], bAlpha) or tocolor(i["IconNotSelected"][1], i["IconNotSelected"][2], i["IconNotSelected"][3], bAlpha)), false)
	dxDrawImage(1390, 449, 31, 25, membersIcon, 0, 0, 0, (actualTab:toString() == "Members" and tocolor(i["IconSelected"][1], i["IconSelected"][2], i["IconSelected"][3], bAlpha) or tocolor(i["IconNotSelected"][1], i["IconNotSelected"][2], i["IconNotSelected"][3], bAlpha)), false)
	dxDrawImage(1390, 529, 31, 31, econIcon, 0, 0, 0, (actualTab:toString() == "Economy" and tocolor(i["IconSelected"][1], i["IconSelected"][2], i["IconSelected"][3], bAlpha) or tocolor(i["IconNotSelected"][1], i["IconNotSelected"][2], i["IconNotSelected"][3], bAlpha)), false)
	if (gp:isSuperior()) then
		dxDrawImage(1390, 612, 31, 31, logsIcon, 0, 0, 0, (actualTab:toString() == "Logs" and tocolor(i["IconSelected"][1], i["IconSelected"][2], i["IconSelected"][3], bAlpha) or tocolor(i["IconNotSelected"][1], i["IconNotSelected"][2], i["IconNotSelected"][3], bAlpha)), false)
	end

	if (gp:getGroup()) then
		if (gp:isLeader()) then
			dxDrawImage(1394, 795, 24, 29, trashIcon, 0, 0, 0, (isCursorOnElement(1391, 795, 29, 25) and tocolor(255, 255, 255, bAlpha) or tocolor(i["IconNotSelected"][1], i["IconNotSelected"][2], i["IconNotSelected"][3], bAlpha)), false)
		else
			dxDrawImage(1391, 795, 29, 25, leaveIcon, 0, 0, 0, (isCursorOnElement(1391, 795, 29, 25) and tocolor(255, 255, 255, bAlpha) or tocolor(i["IconNotSelected"][1], i["IconNotSelected"][2], i["IconNotSelected"][3], bAlpha)), false)
		end

		if (isCursorShowing()) then
			if (isCursorOnElement(1391, 795, 29, 25)) then
				cursorX, cursorY = getHudCursorPos()
				if (cursorX and cursorY) then
					local text = (gp:isLeader() and "Desfazer" or "Sair")
					cursorX, cursorY = cursorX * screenW, cursorY * screenH
					_dxDrawRectangle(cursorX + 12.5, cursorY, dxGetTextWidth(text, 0.75, font9) + 10, 25, tocolor(0, 0, 0, 150))
					_dxDrawText(text, cursorX + 12.5, cursorY, cursorX + (dxGetTextWidth(text, 0.75, font9) + 10) + 12.5, cursorY + 25, tocolor(255, 255, 255), 0.75, font9, "center", "center")
				end
			end
		end
	end
end

function onBindButton(groupPlayer)
	gp = formatGroupPlayer(groupPlayer)

	if (isEventHandlerAdded("onClientRender", getRootElement(), onRenderBase)) then closeGroupPanel() return end
	
	openGroupPanel()
end
addEvent("MST:groupPageManager", true)
addEventHandler("MST:groupPageManager", getRootElement(), onBindButton)

function openGroupPanel(groupPlayer)
	showCursor(true)
	bAlphaStart = 0
	bAlphaFinal = 255
	mAlphaStart = 0
	mAlphaFinal = 190
	cAlphaStart = 0
	cAlphaFinal = 255
	actionAlphaStart = 0
	actionAlphaFinal = 255
	tick = getTickCount()
	tickC = getTickCount()
	tickM = getTickCount()
	tickA = getTickCount()
	addEventHandler("onClientRender", getRootElement(), onRenderBase)

	if (gp:getGroup() == nil) then
		group = gp:getGroup()
		changeActualPage("NoHave")
		onOpenNoHave()
		return
	end

	group = GroupFormmater:formatter(gp:getGroup())

	changeActualPage(group:getGroupType() == 1 and "HomeFac" or "HomeCorp")
end

function closeGroupPanel()
	bAlphaStart = 255
    bAlphaFinal = 0
	mAlphaStart = 190
	mAlphaFinal = 0
	cAlphaStart = 255
	cAlphaFinal = 0
	actionAlphaStart = 255
	actionAlphaFinal = 0
	tick = getTickCount()
	tickC = getTickCount()
	tickM = getTickCount()
	tickA = getTickCount()
	closeActionPageE()
	closeActionPageM()
	setTimer(function()
		if (isEventHandlerAdded("onClientRender", getRootElement(), onRenderBase)) then
			showCursor(false)
			removeEventHandler("onClientRender", getRootElement(), onRenderBase)
			removeEventHandler("onClientRender", getRootElement(), actualTab:getEventFunction())
		end
	end, 600, 1)
end

function updateValues(groupPlayer)
	gp = formatGroupPlayer(groupPlayer)
	if (gp:getGroup() ~= nil) then
		group = formatGroup(gp:getGroup())
		onOpenMembers()
	else
		group = nil
		changeActualPage("NoHave")
		onOpenNoHave()
	end
end
addEvent("MST:updateValues", true)
addEventHandler("MST:updateValues", getRootElement(), updateValues)

function changeActualPage(newPage)
	if (actualTab == nil) then
		actualTab = Tabs():select(newPage)
	end

	startPosX = selectLocation[actualTab:toString()][1]
    startPosY = selectLocation[actualTab:toString()][2]
    startPosW = selectLocation[actualTab:toString()][3]
    startPosH = selectLocation[actualTab:toString()][4]
	finishPosX = selectLocation[newPage][1]
    finishPosY = selectLocation[newPage][2]
    finishPosW = selectLocation[newPage][3]
    finishPosH = selectLocation[newPage][4]
	cAlphaStart = 0
	cAlphaFinal = 255
	tickC = getTickCount()
	tickPos = getTickCount()

	removeEventHandler("onClientRender", getRootElement(), actualTab:getEventFunction())
	actualTab = Tabs():select(newPage)
	addEventHandler("onClientRender", getRootElement(), actualTab:getEventFunction())
end
addEvent("MST:changePage", true)
addEventHandler("MST:changePage", getRootElement(), changeActualPage)

function getHudCursorPos()
	if (isCursorShowing()) then
		return getCursorPosition()
	end
	return false
end

function getGroupPlayer()
	return gp
end

function getGroup()
	return group
end