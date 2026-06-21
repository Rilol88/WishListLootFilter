-- Loot.lua
-- Detects when wishlist items drop and shows notifications

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

local lootFrame = CreateFrame("Frame", "WLLFLootFrame")
lootFrame:RegisterEvent("LOOT_OPENED")
lootFrame:RegisterEvent("LOOT_SLOT_CLEARED")

local announcedThisSession = {}

local function CheckLootSlots()
    local numSlots = GetNumLootItems and GetNumLootItems() or 0
    for slot = 1, numSlots do
        local link = GetLootSlotLink(slot)
        local itemID = link and WLLF:GetItemIDFromLink(link)
        if itemID and WLLF.DB:HasItem(itemID) and not announcedThisSession[itemID] then
            announcedThisSession[itemID] = true
            local icon, name = GetLootSlotInfo(slot)
            WLLF.UI:ShowDropAlert(itemID, link, icon, name)
        end
    end
end

lootFrame:SetScript("OnEvent", function(self, event)
    if event == "LOOT_OPENED" then
        wipe(announcedThisSession)
        CheckLootSlots()
    elseif event == "LOOT_SLOT_CLEARED" then
        CheckLootSlots()
    end
end)
