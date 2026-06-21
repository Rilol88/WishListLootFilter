-- Loot.lua
-- Prüft beim Öffnen eines Loot-Fensters, ob ein Wunschlisten-Item dabei ist,
-- und zeigt dafür ein Notification-Fenster + Sound an. Nur eigenes Loot (kein Raid-Chat-Parsing).

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

local lootFrame = CreateFrame("Frame", "WLLFLootFrame")
lootFrame:RegisterEvent("LOOT_OPENED")
lootFrame:RegisterEvent("LOOT_SLOT_CLEARED")

-- Items, die in der aktuell offenen Lootsession bereits gemeldet wurden,
-- damit nicht bei jedem LOOT_OPENED (z.B. nach Looten eines Slots) erneut gepoppt wird.
local announcedThisSession = {}

local function CheckLootSlots()
    local numSlots = GetNumLootItems and GetNumLootItems() or 0
    for slot = 1, numSlots do
        local link = GetLootSlotLink(slot)
        local itemID = link and WLLF:GetItemIDFromLink(link)
        if itemID and WLLF.DB:HasItem(itemID) and not announcedThisSession[itemID] then
            announcedThisSession[itemID] = true
            local icon, name, quantity, rarity = GetLootSlotInfo(slot)
            WLLF.UI:ShowDropAlert(itemID, link, icon, name)
        end
    end
end

lootFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "LOOT_OPENED" then
        wipe(announcedThisSession)
        CheckLootSlots()
    elseif event == "LOOT_SLOT_CLEARED" then
        -- Nach dem Looten eines Slots können sich Slot-Indizes verschieben,
        -- erneut prüfen falls noch weitere Wunschlisten-Items im Fenster liegen.
        CheckLootSlots()
    end
end)
