-- Core.lua
-- Initialization and slash commands

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

local frame = CreateFrame("Frame", "WLLFCoreFrame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

function WLLF:GetItemIDFromLink(link)
    if not link then return nil end
    local itemID = link:match("item:(%d+)")
    return itemID and tonumber(itemID) or nil
end

function WLLF:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99" .. L["ADDON_NAME"] .. ":|r " .. msg)
end

-- ===== Slash Commands =====

local function HandleSlash(msg)
    msg = msg and msg:trim() or ""
    local cmd = msg:lower()

    if cmd == "" or cmd == "browse" then
        WLLF.UI:Toggle()
    elseif cmd == "wishlist" then
        WLLF.UI:ShowWishlist()
    elseif cmd == "clear" then
        WLLF.DB:ClearAll()
        WLLF:Print(L["WISHLIST"] .. " cleared.")
    else
        WLLF:Print("/wll - toggle browser\n/wll wishlist - show wishlist\n/wll clear - clear all items")
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
        local dungeons = WLLF.DungeonLoot:GetContentsByType("dungeon")
        local raids = WLLF.DungeonLoot:GetContentsByType("raid")
        WLLF:Print(string.format("Loaded: %d Dungeons, %d Raids. Use /wll to open.", #dungeons, #raids))
    end
end)
