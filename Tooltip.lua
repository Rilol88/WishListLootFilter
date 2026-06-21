-- Tooltip.lua
-- Hängt eine Zeile "Auf deiner Wunschliste" an Item-Tooltips, falls zutreffend.

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

local function OnTooltipSetItem(tooltip)
    local _, link = tooltip:GetItem()
    if not link then return end

    local itemID = WLLF:GetItemIDFromLink(link)
    if not itemID then return end

    local entry = WLLF.DB:GetItems()[itemID]
    if not entry then return end

    tooltip:AddLine(" ")
    tooltip:AddLine("★ " .. L["ON_WISHLIST"], 1, 0.82, 0)
    if entry.note and entry.note ~= "" then
        tooltip:AddLine(entry.note, 0.8, 0.8, 0.8, true)
    end
end

-- TBC Classic unterstützt GameTooltip:HookScript("OnTooltipSetItem", ...)
GameTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)

-- Itemrefresh-Tooltip (Shift-Klick im Chat etc.) ebenfalls abdecken, falls vorhanden
if ItemRefTooltip then
    ItemRefTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
end
