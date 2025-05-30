DEFAULT_CHAT_FRAME:AddMessage("Testing, testing", 1, 0, 1);
BMLoot = CreateFrame("Frame")
BMLoot:RegisterEvent("START_LOOT_ROLL") 
BMLoot:RegisterEvent("LOOT_BIND_CONFIRM")
BMLoot:RegisterEvent("ZONE_CHANGED_NEW_AREA")
BMLoot:SetScript("OnEvent", function()
    if event == "START_LOOT_ROLL" then
        -- Se asume que arg1, arg2, etc., son pasados correctamente por el sistema de eventos de WoW
        -- cuando la función no define explícitamente los parámetros event, self, ...
        local rollID, rollTime, rollItemLink, rollQuantity, rollPlayer = arg1, arg2, arg3, arg4, arg5
		local texture, name, count, quality = GetLootRollItemInfo(rollID)
        if (GetZoneText() == "El Morass Negro" or GetZoneText() == "La Ciénaga Negra") and (name == "Arena Corrupta" or name == "Esencia Arcana") then
            RollOnLoot(rollID, 1)
			StaticPopup1Button1:Click()		
        end	
	elseif event == "ZONE_CHANGED_NEW_AREA" then
		if GetRealZoneText() == "El Morass Negro" or GetRealZoneText() == "La Ciénaga Negra" then
			DEFAULT_CHAT_FRAME:AddMessage("Has entrado en "..GetRealZoneText()..". AUTO-NEED Arena Corrupta y Esencia Arcana.")
		end
	end
end)
