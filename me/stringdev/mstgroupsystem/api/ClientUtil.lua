local sW, sH = guiGetScreenSize()
resX, resY = 1920, 1080

function aToR(X, Y, sX, sY)
	local xd = X/resX or X
	local yd = Y/resY or Y
	local xsd = sX/resX or sX
	local ysd = sY/resY or sY
	return xd*sW, yd*sH, xsd*sW, ysd*sH
end

_dxDrawRectangle = dxDrawRectangle
function dxDrawRectangle(x, y, w, h, color, post)
	local x, y, w, h = aToR(x, y, w, h)

	return _dxDrawRectangle(x, y, w, h, color, post)
end

_dxDrawText = dxDrawText
function dxDrawText(text, x, y, w, h, color, scale, font, alignX, alignY, clip, wbreak, post, colorcode, sPP, fR, fRCX, fRCY)
	local x, y, w, h = aToR(x, y, w, h)

	return _dxDrawText(text, x, y, w, h, color, (sH / resY) * scale, font, alignX, alignY, clip, wbreak, post, colorcode, sPP, fR, fRCX, fRCY)
end

_dxDrawImage = dxDrawImage
function dxDrawImage( x, y, w, h, image, rot, rotcox, rotcoy, color, post)
	local x, y, w, h = aToR(x, y, w, h)

    return _dxDrawImage(x, y, w, h, image, rot, rotcox, rotcoy, color, post)
end

_dxDrawImageSection = dxDrawImageSection
function dxDrawImageSection(x, y, w, h, u, v, us, uz, image, rot, rotcox, rotcoy, color, post)
	local x, y, w, h = aToR(x, y, w, h)

	return _dxDrawImageSection(x, y, w, h, u, v, us, uz, image, rot, rotcox, rotcoy, color, post)
end

_dxDrawLine = dxDrawLine
function dxDrawLine(startX, startY, endX, endY, color, width, postGUI)
	local startX, startY, endX, endY = aToR( startX, startY, endX, endY)

	return _dxDrawLine(startX, startY, endX, endY, color, width, postGUI)
end

------------------------------------------------------------------------------------------------------------------------------------------------

local x,y = guiGetScreenSize()
function isCursorOnElement(xR, yR, wR, hR)
	local x, y, w, h = aToR(xR, yR, wR, hR)
    if (isCursorShowing()) then
	    local mx,my = getCursorPosition()
     	local fullx,fully = guiGetScreenSize()
	    cursorx,cursory = mx*fullx,my*fully
	    if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
	    	return true
	    else
		    return false
		end
	end
end

function drawButton(x, y, w, h, text, color, next_color, utils, postGUI)
	if (isCursorOnElement(x, y, w, h)) then
		dxRoundedRectangle(x, y, w, h, false, tocolor(next_color[1] or 255, next_color[2] or 255, next_color[3] or 255, next_color[4] or 255), false, postGUI)
	else
		dxRoundedRectangle(x, y, w, h, false, tocolor(color[1] or 255, color[2] or 255, color[3] or 255, color[4] or 255), false, postGUI)
	end
	if (text) then
		dxDrawText(text, x, y, x + w, y + h, tocolor(255, 255, 255, color[4] or 255), utils[1] or 1, utils[2] or "default", utils[3] or "center", utils[4] or "center", true, true, postGUI);
	end
end

function dxRoundedRectangle(x, y, w, h, borderColor, bgColor, passedColor, postGUI)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = bgColor
		end
		
		if (not bgColor) then
			bgColor = borderColor
		end
		
		if (passedColor and isCursorOnElement(x, y, w, h)) then
			bgColor = passedColor
			borderColor = passedColor
		end

		--> Background
		dxDrawRectangle(x, y, w, h, bgColor, postGUI);
		
		--> Border
		dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI); -- top
		dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI); -- bottom
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI); -- left
		dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI); -- right
	end
end

function getPositionFromElementOffset(element, offX, offY, offZ) 
    local m = getElementMatrix(element) 
    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1] 
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2] 
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3] 
    return x, y, z 
end

------------------------------------------------------------
function formatGroup(group)
	if not (group) then return end
    return GroupFormmater():formatter(group)
end

function formatGroupPlayer(groupPlayer)
	if not (groupPlayer) then return end
    return PlayerFormmater():formatter(groupPlayer)
end

function formatLogs(log)
	if not (log) then return end
    return LogsFormmater():formatter(log)
end

function formatTransfer(transfer)
	if not (transfer) then return end
    return TransferFormmater():formatter(transfer)
end