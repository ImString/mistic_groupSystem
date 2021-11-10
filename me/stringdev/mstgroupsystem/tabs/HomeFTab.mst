local visibleState = {
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
}

function onRenderHomeF()
	local contentAlpha = interpolateBetween(cAlphaStart, 255, 255, cAlphaFinal, 0, 0, (getTickCount () - tickC) / 600, "Linear")

	-- Variables
	local rolePlayer = GroupRole():select(getGroupPlayer():getGroupRole().roleSelect):getName(getGroup():getGroupType())
	local groupName = getGroup():getName()
	
	local drugsSell = tostring(getGroupPlayer():getDrugsSell() or 0)
	local weaponsSell = tostring(getGroupPlayer():getWeaponsSell() or 0)
	local drugsFabricate = tostring(getGroupPlayer():getDrugsFabricate() or 0)
	local weaponsFabricate = tostring(getGroupPlayer():getWeaponsFabricate() or 0)

	dxDrawText(removeHex(localPlayer:getName():gsub("_", " ")), 504, 254, 98, 14, tocolor(57, 57, 57, contentAlpha), 0.8, font2, "left", "top", false, false, false, false, false)
	dxDrawText(rolePlayer, 504, 275, 54, 13, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
	dxDrawText("Nome do Grupo", 1174, 254, 1288, 274, tocolor(31, 31, 31, contentAlpha), 0.8, font4, "left", "top", false, false, false, false, false)
	dxDrawText(groupName, 933, 273, 1316, 304, tocolor(31, 31, 31, contentAlpha), 0.8, font6, "right", "center", false, false, false, false, false)

	dxDrawRectangle(504, 307, 61, 1, tocolor(210, 210, 210, contentAlpha), false)
	dxDrawText("Dashboard", 504, 332, 124, 17, tocolor(57, 57, 57, contentAlpha), 0.8, font2, "left", "top", false, false, false, false, false)
	
	dxDrawRectangle(504, 373, 61, 1, tocolor(210, 210, 210, contentAlpha), false)
	
	-- Card's
	dxDrawImage(504, 398, 187, 100, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
	dxDrawText("Drogas Fabricadas", 525, 420, 124, 13, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
	dxDrawText(""..(visibleState[1] and drugsFabricate or drugsFabricate:gsub(".", "*")), 544, 448, 27, 17, tocolor(57, 57, 57, contentAlpha), 0.9, font2, "left", "top", false, false, false, false, false)
	dxDrawImage(661, 468, 15, 15, (visibleState[1] and visibleIcon or invisibleIcon), 0, 0, 0, tocolor(57, 57, 57, contentAlpha), false)
	
	dxDrawImage(700, 398, 187, 100, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
	dxDrawText("Drogas vendidas", 721, 420, 124, 13, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
	dxDrawText(""..(visibleState[2] and drugsSell or drugsSell:gsub(".", "*")), 741, 448, 27, 17, tocolor(57, 57, 57, contentAlpha), 0.9, font2, "left", "top", false, false, false, false, false)
	dxDrawImage(857, 468, 15, 15, (visibleState[2] and visibleIcon or invisibleIcon), 0, 0, 0, tocolor(57, 57, 57, contentAlpha), false)
	
	dxDrawImage(896, 398, 187, 100, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
	dxDrawText("Armas fabricadas", 918, 420, 124, 13, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
	dxDrawText(""..(visibleState[3] and weaponsFabricate or weaponsFabricate:gsub(".", "*")), 936, 448, 27, 17, tocolor(57, 57, 57, contentAlpha), 0.9, font2, "left", "top", false, false, false, false, false)
	dxDrawImage(1053, 468, 15, 15, (visibleState[3] and visibleIcon or invisibleIcon), 0, 0, 0, tocolor(57, 57, 57, contentAlpha), false)
	
    dxDrawImage(1093, 398, 187, 100, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
	dxDrawText("Armas vendidas", 1114, 420, 124, 13, tocolor(57, 57, 57, contentAlpha), 0.6, font4, "left", "top", false, false, false, false, false)
	dxDrawText(""..(visibleState[4] and weaponsSell or weaponsSell:gsub(".", "*")), 1133, 448, 27, 17, tocolor(57, 57, 57, contentAlpha), 0.9, font2, "left", "top", false, false, false, false, false)
	dxDrawImage(1250, 468, 15, 15, (visibleState[4] and visibleIcon or invisibleIcon), 0, 0, 0, tocolor(57, 57, 57, contentAlpha), false)
	
	dxDrawRectangle(504, 522, 61, 1, tocolor(210, 210, 210, contentAlpha), false)
	dxDrawText("Membro do mês", 504, 544, 146, 17, tocolor(57, 57, 57, contentAlpha), 0.8, font2, "left", "top", false, false, false, false, false)
		
	local memberOfTheMonth = formatGroupPlayer(getGroup():getMemberOfTheMonth())
	local memberName = memberOfTheMonth:getNickName()
	local memberRole = GroupRole():select(memberOfTheMonth:getGroupRole().roleSelect):getName(getGroup():getGroupType())

    local memberDrugsSell = tostring(memberOfTheMonth:getDrugsSell() or 0)
	local memberWeaponsSell = tostring(memberOfTheMonth:getWeaponsSell() or 0)
	local memberDrugsFabricate = tostring(memberOfTheMonth:getDrugsFabricate() or 0)
	local memberWeaponsFabricate = tostring(memberOfTheMonth:getWeaponsFabricate() or 0)
	
	dxDrawImage(504, 587, 187, 235, "me/stringdev/mstgroupsystem/assets/images/card.png_encrypt", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
	dxDrawImage(580, 569, 35, 35, "me/stringdev/mstgroupsystem/assets/images/avatar/"..(memberOfTheMonth:getGroupRole().roleSelect:lower())..".png", 0, 0, 0, tocolor(255, 255, 255, contentAlpha), false)
	dxDrawText(removeHex(memberName):gsub("_", " "), 504, 607, 691, 617, tocolor(57, 57, 57, contentAlpha), 0.5, font2, "center", "top", false, false, false, false, false)
	dxDrawText(memberRole, 504, 618, 691, 631, tocolor(57, 57, 57, contentAlpha), 0.5, font4, "center", "top", false, false, false, false, false)

	dxDrawRectangle(589, 651, 17, 1, tocolor(182, 182, 182, contentAlpha), false)
	dxDrawText("Drogas F.", 535, 673, 49, 9, tocolor(57, 57, 57, contentAlpha), 0.5, font4, "left", "top", false, false, false, false, false)
	dxDrawText(""..memberDrugsFabricate, 535, 687, 12, 10, tocolor(57, 57, 57, contentAlpha), 0.5, font2, "left", "top", false, false, false, false, false)
	dxDrawText("Drogas V.", 611, 673, 49, 9, tocolor(57, 57, 57, contentAlpha), 0.5, font4, "left", "top", false, false, false, false, false)
	dxDrawText(""..memberDrugsSell, 611, 687, 12, 10, tocolor(57, 57, 57, contentAlpha), 0.5, font2, "left", "top", false, false, false, false, false)
	dxDrawRectangle(592, 717, 11, 1, tocolor(182, 182, 182, contentAlpha), false)
	dxDrawText("Armas F.", 535, 734, 45, 10, tocolor(57, 57, 57, contentAlpha), 0.5, font4, "left", "top", false, false, false, false, false)
	dxDrawText(""..memberWeaponsFabricate, 535, 748, 12, 10, tocolor(57, 57, 57, contentAlpha), 0.5, font2, "left", "top", false, false, false, false, false)
	dxDrawText("Armas V.", 611, 734, 45, 10, tocolor(57, 57, 57, contentAlpha), 0.5, font4, "left", "top", false, false, false, false, false)
	dxDrawText(""..memberWeaponsSell, 611, 748, 12, 10, tocolor(57, 57, 57, contentAlpha), 0.5, font2, "left", "top", false, false, false, false, false)

    dxDrawText((getRealTime().monthday).."/"..addZero(getRealTime().month+1).."/"..(getRealTime().year+1900), 504, 780, 691, 800, tocolor(57, 57, 57, contentAlpha), 0.5, font9, "center", "top", false, false, false, false, false)
end

function onClickTabs(button, state)
	if (isEventHandlerAdded("onClientRender", getRootElement(), onRenderBase)) then
		if (button ~= "left") then return end
		if (getGroup() == nil) then return end
		
		if (getGroup():getGroupType() == 1) then
			if (state == "down") then
				if (isCursorOnElement(1391, 365, 29, 29)) then -- Home
					if (actualTab:toString() == "HomeFac") then return end
					changeActualPage("HomeFac")
				end
				
				if (isCursorOnElement(1390, 449, 31, 25)) then -- Members
					if (actualTab:toString() == "Members") then return end
					changeActualPage("Members")
					onOpenMembers()
				end
				
				if (isCursorOnElement(1390, 529, 31, 31)) then -- Economia
					if (actualTab:toString() == "Economy") then return end
					changeActualPage("Economy")
					onOpenEconomy()
				end
				
				if (isCursorOnElement(1390, 612, 31, 31)) then -- Logs
					if (actualTab:toString() == "Logs") then return end
					if (getGroupPlayer():isSuperior()) then
						changeActualPage("Logs")
						onOpenLogs()
					end
				end

				if (isCursorOnElement(661, 468, 15, 15)) then -- Visible1
					visibleState[1] = not visibleState[1]
				end
				
				if (isCursorOnElement(857, 468, 15, 15)) then -- Visible2
					visibleState[2] = not visibleState[2]
				end
				
				if (isCursorOnElement(1053, 468, 15, 15)) then -- Visible3
					visibleState[3] = not visibleState[3]
				end
				
                if (isCursorOnElement(1250, 468, 15, 15)) then -- Visible4
					visibleState[4] = not visibleState[4]
				end

				if (isCursorOnElement(1391, 795, 29, 25)) then
					closeGroupPanel()

					if (getGroupPlayer():isLeader()) then
						triggerServerEvent("MST:destroyGroup", localPlayer, localPlayer)
						return
					end

					triggerServerEvent("MST:leaveGroup", localPlayer, localPlayer)
				end
			end
		end
	end
end
addEventHandler("onClientClick", getRootElement(), onClickTabs)