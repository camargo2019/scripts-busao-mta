------------------------------------------
--- 		CAMARGO SCRIPTS  		   ---
     -----     Busão BRP     -----
------------------------------------------
local screenW, screenH = guiGetScreenSize()
local resW, resH = 1366, 768
local x, y = (screenW/resW), (screenH/resH)

local CMR_Font_18 = dxCreateFont("font/font.ttf", x*18)
local CMR_Font_16 = dxCreateFont("font/font.ttf", x*16)
local CMR_Font_14 = dxCreateFont("font/font.ttf", x*14)
local CMR_Font_12 = dxCreateFont("font/font.ttf", x*12)
local CMR_Font_11 = dxCreateFont("font/font.ttf", x*11)
local CMR_Font_10 = dxCreateFont("font/font.ttf", x*10)
local CMR_Font_8 = dxCreateFont("font/font.ttf", x*8)
local CMR_Font_6 = dxCreateFont("font/font.ttf", x*6)

local CMR_Font_10_impact = dxCreateFont("font/impact.ttf", x*10)

local Painel = false

local LocalidadeC

function CMR_Painel_Busao()
	if LocalidadeC == "Los Santos" then
		dxDrawImage(x*433, y*259, x*500, y*250, "img/LS.png")
	end
	if LocalidadeC == "San Fierro" then
		dxDrawImage(x*433, y*259, x*500, y*250, "img/SF.png")
	end
	if LocalidadeC == "Las Venturas" then
		dxDrawImage(x*433, y*259, x*500, y*250, "img/LV.png")
	end
	dxDrawText("X", x*905, y*270, x*40, y*40, tocolor(255, 0, 0, 255), 1.0, CMR_Font_14)
end

function CMR_PainelClick_Busao(_, state)
	if Painel then
		if state == "down" then
			if isCursor(x*900, y*273, x*20, y*20) then
				playSoundFrontEnd(43)
				CMR_AbriDX_Busao(false)
			end
			if LocalidadeC == "Los Santos" then
				if isCursor(x*465, y*342, x*200, y*110) then
					playSoundFrontEnd(43)
					triggerServerEvent("CMR:MoverPlayer:Busao", localPlayer, "San Fierro")
				end

				if isCursor(x*700, y*342, x*200, y*110) then
					playSoundFrontEnd(43)
					triggerServerEvent("CMR:MoverPlayer:Busao", localPlayer, "Las Venturas")
				end
			end

			if LocalidadeC == "Las Venturas" then
				if isCursor(x*465, y*342, x*200, y*110) then
					playSoundFrontEnd(43)
					triggerServerEvent("CMR:MoverPlayer:Busao", localPlayer, "San Fierro")
				end

				if isCursor(x*700, y*342, x*200, y*110) then
					playSoundFrontEnd(43)
					triggerServerEvent("CMR:MoverPlayer:Busao", localPlayer, "Los Santos")
				end
			end

			if LocalidadeC == "San Fierro" then
				if isCursor(x*465, y*342, x*200, y*110) then
					playSoundFrontEnd(43)
					triggerServerEvent("CMR:MoverPlayer:Busao", localPlayer, "Las Venturas")
				end

				if isCursor(x*700, y*342, x*200, y*110) then
					playSoundFrontEnd(43)
					triggerServerEvent("CMR:MoverPlayer:Busao", localPlayer, "Los Santos")
				end
			end

		end
	end
end

function CMR_AbriDX_Busao(localidade)
	if not Painel then
		LocalidadeC = localidade
		Painel = true
		showCursor(true)
		addEventHandler("onClientRender", root, CMR_Painel_Busao)
		addEventHandler("onClientClick", root, CMR_PainelClick_Busao)
	else
		LocalidadeC = localidade
		Painel = false
		showCursor(false)
		removeEventHandler("onClientRender", root, CMR_Painel_Busao)
		removeEventHandler("onClientClick", root, CMR_PainelClick_Busao)
	end
end
addEvent("CMR:AbriDX:Busao", true)
addEventHandler("CMR:AbriDX:Busao", root, CMR_AbriDX_Busao)

function isCursor(x,y,w,h)
	local mx,my = getCursorPosition()
	if mx and my then
		local fullx,fully = guiGetScreenSize()
		
		cursorx, cursory = mx*fullx,my*fully
		
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
			return true
		else
			return false
		end
	end
end