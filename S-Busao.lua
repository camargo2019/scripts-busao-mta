------------------------------------------
--- 		CAMARGO SCRIPTS  		   ---
     -----     Busão BRP     -----
------------------------------------------


local MarkerSistem = {}

function CMR_IniciarSistema_Busao(res)
	if res == getThisResource() then
		for i, mark in ipairs(PositionBusao) do
			MarkerSistem[i] = createMarker(mark["MarkerPegarBus"][1], mark["MarkerPegarBus"][2], mark["MarkerPegarBus"][3]-1, "cylinder", 1.5, 255, 255, 0, 170)
			createBlipAttachedTo(MarkerSistem[i], 53)
		end
	end
end
addEventHandler("onResourceStart", root, CMR_IniciarSistema_Busao)

function CMR_MarkerHit_Busao(hit)
	if hit then
		for a, b in ipairs(MarkerSistem) do
			if b == hit then
				if isGuestAccount(getPlayerAccount(source)) then
					return
				end
				local x, y, z = getElementPosition(source)
				triggerClientEvent(source, "CMR:AbriDX:Busao", source, getZoneName(x, y, z, true))
			end
		end
	end
end
addEventHandler("onPlayerMarkerHit", root, CMR_MarkerHit_Busao)


function CMR_MoverPlayer_Busao(localidade)
	if localidade then
		for a, loc in ipairs(PositionBusao) do
			if loc["Local"] == localidade then
				setElementPosition(source, loc["MarkerSairBus"][1], loc["MarkerSairBus"][2], loc["MarkerSairBus"][3])
				triggerClientEvent(source, "CMR:AbriDX:Busao", source, false)
				return
			end
		end
	end
end
addEvent("CMR:MoverPlayer:Busao", true)
addEventHandler("CMR:MoverPlayer:Busao", root, CMR_MoverPlayer_Busao)
