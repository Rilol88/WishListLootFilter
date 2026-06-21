-- Tooltip.lua
-- Shows wishlist marker in item tooltips

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

local function OnTooltipSetItem(tooltip)
    local _, link = tooltip:GetItem()
    if not link then return end

    local itemID = WLLF:GetItemIDFromLink(link)
    if not itemID then return end

    if not WLLF.DB:HasItem(itemID) then return end

    tooltip:AddLine(" ")
    tooltip:AddLine("★ " .. L["WISHLIST"], 1, 0.82, 0)

    local source = WLLF.DungeonLoot:GetItemSource(itemID)
    if source then
        tooltip:AddLine(source.content .. " - " .. source.boss, 0.7, 0.9, 1, true)
    end
end

GameTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
if ItemRefTooltip then
    ItemRefTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
end
