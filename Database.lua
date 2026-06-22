-- Database.lua
-- Verwaltet die Wishlist-Daten (SavedVariables) und Export/Import.

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

WLLF.DB = {}
local DB = WLLF.DB

-- Struktur:
-- WishListLootFilterCharDB.items[itemID] = { note = "...", source = "...", addedAt = time() }
-- (per-Charakter, da Wunschlisten meist klassen-/charakterspezifisch sind)

local defaults = {
    items = {},
    settings = {
        notifySound = true,
        minimapAngle = 215,
        minimapHide = false,
        selectedPhase = (WLLF.CURRENT_PHASE or 2),
        selectedSpec = nil,    -- wird beim ersten Start anhand der Spielerklasse gesetzt
        selectedSlot = "ALL",
        activeTab = "dungeon", -- "dungeon" | "raid" | "mine"
    },
}

function DB:Init()
    WishListLootFilterCharDB = WishListLootFilterCharDB or {}
    for k, v in pairs(defaults) do
        if WishListLootFilterCharDB[k] == nil then
            if type(v) == "table" then
                WishListLootFilterCharDB[k] = {}
            else
                WishListLootFilterCharDB[k] = v
            end
        end
    end
    self.data = WishListLootFilterCharDB
end

function DB:GetItems()
    return self.data.items
end

function DB:HasItem(itemID)
    return self.data.items[itemID] ~= nil
end

function DB:AddItem(itemID, note, source)
    if not itemID then return false end
    if self.data.items[itemID] then
        return false -- bereits vorhanden
    end
    self.data.items[itemID] = {
        note = note or "",
        source = source or "",
        addedAt = time(),
    }
    return true
end

function DB:RemoveItem(itemID)
    if not itemID or not self.data.items[itemID] then return false end
    self.data.items[itemID] = nil
    return true
end

function DB:ClearAll()
    self.data.items = {}
end

function DB:GetSetting(key)
    return self.data.settings[key]
end

function DB:SetSetting(key, value)
    self.data.settings[key] = value
end

-- ===== Export / Import =====
-- Format: WLLF:v1:itemID1,itemID2,itemID3,...
-- (Notizen/Quellen werden bewusst nicht exportiert, um den String kurz zu halten)

function DB:Export()
    local ids = {}
    for itemID in pairs(self.data.items) do
        table.insert(ids, itemID)
    end
    table.sort(ids)
    return "WLLF:v1:" .. table.concat(ids, ",")
end

function DB:Import(str)
    if not str then return 0, false end
    str = str:trim()
    local prefix, version, payload = str:match("^(%a+):(%a%d+):(.*)$")
    if prefix ~= "WLLF" or not payload then
        return 0, false
    end

    local count = 0
    for idStr in payload:gmatch("[^,]+") do
        local itemID = tonumber(idStr)
        if itemID and not self.data.items[itemID] then
            self.data.items[itemID] = {
                note = "",
                source = "",
                addedAt = time(),
            }
            count = count + 1
        end
    end
    return count, true
end
