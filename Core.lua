-- Core.lua
-- Initialisierung, Slash-Commands und gemeinsame Hilfsfunktionen.

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

local frame = CreateFrame("Frame", "WLLFCoreFrame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

-- ===== Hilfsfunktionen =====

-- Extrahiert die ItemID aus einem ItemLink oder einem reinen ItemString.
function WLLF:GetItemIDFromLink(link)
    if not link then return nil end
    local itemID = link:match("item:(%d+)")
    return itemID and tonumber(itemID) or nil
end

function WLLF:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99" .. L["ADDON_NAME"] .. ":|r " .. msg)
end

-- ===== Slash-Commands =====

local function HandleSlash(msg)
    msg = msg and msg:trim() or ""
    local cmd, rest = msg:match("^(%S*)%s*(.-)$")
    cmd = (cmd or ""):lower()

    if cmd == "" then
        WLLF.UI:Toggle()
    elseif cmd == "add" then
        local itemID = WLLF:GetItemIDFromLink(rest)
        if not itemID then
            WLLF:Print(L["DRAG_ITEM_HINT"])
            return
        end
        if WLLF.DB:AddItem(itemID) then
            local name = GetItemInfo(itemID) or ("Item:" .. itemID)
            WLLF:Print(string.format(L["ITEM_ADDED"], name))
            WLLF.UI:Refresh()
        else
            local name = GetItemInfo(itemID) or ("Item:" .. itemID)
            WLLF:Print(string.format(L["ITEM_ALREADY_ON_LIST"], name))
        end
    elseif cmd == "remove" then
        local itemID = WLLF:GetItemIDFromLink(rest)
        if itemID and WLLF.DB:RemoveItem(itemID) then
            local name = GetItemInfo(itemID) or ("Item:" .. itemID)
            WLLF:Print(string.format(L["ITEM_REMOVED"], name))
            WLLF.UI:Refresh()
        end
    elseif cmd == "export" then
        WLLF.UI:ShowExport(WLLF.DB:Export())
    elseif cmd == "import" then
        if rest and rest ~= "" then
            local count, ok = WLLF.DB:Import(rest)
            if ok then
                WLLF:Print(string.format(L["IMPORT_SUCCESS"], count))
                WLLF.UI:Refresh()
            else
                WLLF:Print(L["IMPORT_FAILED"])
            end
        else
            WLLF.UI:ShowImport()
        end
    elseif cmd == "clear" then
        WLLF.DB:ClearAll()
        WLLF:Print(L["WISHLIST"] .. " cleared.")
        WLLF.UI:Refresh()
    else
        WLLF:Print(L["SLASH_HELP"])
    end
end

SLASH_WISHLISTLOOTFILTER1 = "/wll"
SLASH_WISHLISTLOOTFILTER2 = "/wishlistlootfilter"
SlashCmdList["WISHLISTLOOTFILTER"] = HandleSlash

-- ===== Events =====

frame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == "WishListLootFilter" then
        WLLF.DB:Init()
    elseif event == "PLAYER_LOGIN" then
        if WLLF.Minimap then
            WLLF.Minimap:Init()
        end
        WLLF:Print("/wll - " .. L["WISHLIST"])
    end
end)
