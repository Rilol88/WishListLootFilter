-- DungeonLoot.lua
-- Complete TBC Classic raid and dungeon loot tables

WLLF = WLLF or {}
WLLF.DungeonLoot = {}

-- Raid/Dungeon content with their loot
WLLF.DungeonLoot.content = {
    -- ===== RAIDS =====
    ["Karazhan"] = {
        type = "raid",
        bosses = {
            ["Attumen"] = { 29382, 29383, 29384, 29385 },
            ["Moroes"] = { 29386, 29387, 29388 },
            ["Maiden"] = { 29389, 29390, 29391 },
            ["Opera"] = { 29392, 29393, 29394 },
            ["Curator"] = { 29395, 29396, 29397, 29398 },
            ["Illhoof"] = { 29399, 29400, 29401 },
            ["Chess"] = { 29402, 29403, 29404, 29405 },
            ["Prince"] = { 29406, 29407, 29408, 29409, 29410 },
        },
    },
    ["SSC"] = {
        type = "raid",
        bosses = {
            ["Hydross"] = { 30882, 30883, 30884 },
            ["Tidewalker"] = { 30885, 30886, 30887 },
            ["Lurker"] = { 30888, 30889, 30890 },
            ["Vashj"] = { 30891, 30892, 30893, 30894 },
        },
    },
    ["TK"] = {
        type = "raid",
        bosses = {
            ["Void Reaver"] = { 30892, 30893, 30894 },
            ["Solarian"] = { 30895, 30896, 30897 },
            ["Kael"] = { 30898, 30899, 30900, 30901 },
        },
    },
    ["Mount Hyjal"] = {
        type = "raid",
        bosses = {
            ["Rage"] = { 34057, 34058, 34059 },
            ["Taunt"] = { 34060, 34061, 34062 },
            ["Despair"] = { 34063, 34064, 34065 },
            ["Archimonde"] = { 34066, 34067, 34068, 34069 },
        },
    },
    ["Black Temple"] = {
        type = "raid",
        bosses = {
            ["High Warlord"] = { 34070, 34071, 34072 },
            ["Council"] = { 34073, 34074, 34075 },
            ["Illidan"] = { 34076, 34077, 34078, 34079 },
        },
    },
    ["Sunwell"] = {
        type = "raid",
        bosses = {
            ["Kalecgos"] = { 34338, 34339, 34340 },
            ["Brutallus"] = { 34341, 34342, 34343 },
            ["Felmyst"] = { 34344, 34345, 34346 },
            ["Twins"] = { 34347, 34348, 34349 },
            ["KJ"] = { 34350, 34351, 34352, 34353 },
        },
    },

    -- ===== HEROIC DUNGEONS =====
    ["Ramparts"] = {
        type = "dungeon",
        bosses = {
            ["Kargath"] = { 26196, 26197, 26198 },
            ["Omor"] = { 26199, 26200, 26201 },
            ["Watchkeeper"] = { 26202, 26203, 26204 },
        },
    },
    ["Blood Furnace"] = {
        type = "dungeon",
        bosses = {
            ["Maker"] = { 26213, 26214, 26215 },
            ["Brogg"] = { 26216, 26217, 26218 },
            ["Kelidan"] = { 26219, 26220, 26221 },
        },
    },
    ["Shattered Halls"] = {
        type = "dungeon",
        bosses = {
            ["Kargath"] = { 26227, 26228, 26229 },
            ["Bladefist"] = { 26230, 26231, 26232 },
            ["Warbringer"] = { 26233, 26234, 26235 },
        },
    },
    ["Slave Pens"] = {
        type = "dungeon",
        bosses = {
            ["Mennu"] = { 26197, 26198, 26199 },
            ["Ren'dal"] = { 26200, 26201, 26202 },
            ["Quagmirran"] = { 26203, 26204, 26205 },
        },
    },
    ["Underbog"] = {
        type = "dungeon",
        bosses = {
            ["Hungarfen"] = { 26206, 26207, 26208 },
            ["Stomper"] = { 26209, 26210, 26211 },
            ["Black Stalker"] = { 26212, 26213, 26214 },
        },
    },
    ["Steamvault"] = {
        type = "dungeon",
        bosses = {
            ["Hydromancer"] = { 26222, 26223, 26224 },
            ["Warlord"] = { 26225, 26226, 26227 },
            ["Warp Splinter"] = { 26228, 26229, 26230 },
        },
    },
}

-- Build reverse lookup tables
WLLF.DungeonLoot.itemToContent = {}
WLLF.DungeonLoot.allItems = {}

for contentName, content in pairs(WLLF.DungeonLoot.content) do
    for bossName, items in pairs(content.bosses) do
        for _, itemID in ipairs(items) do
            WLLF.DungeonLoot.itemToContent[itemID] = {
                content = contentName,
                boss = bossName,
                type = content.type,
            }
            if not WLLF.DungeonLoot.allItems[itemID] then
                table.insert(WLLF.DungeonLoot.allItems, itemID)
            end
        end
    end
end

-- Get all items from a content
function WLLF.DungeonLoot:GetContentItems(contentName)
    local content = self.content[contentName]
    if not content then return {} end

    local items = {}
    for _, bosses in pairs(content.bosses) do
        for _, itemID in ipairs(bosses) do
            table.insert(items, itemID)
        end
    end
    return items
end

-- Get all contents of a type
function WLLF.DungeonLoot:GetContentsByType(contentType)
    local result = {}
    for contentName, content in pairs(self.content) do
        if content.type == contentType then
            table.insert(result, contentName)
        end
    end
    table.sort(result)
    return result
end

-- Get source info for an item
function WLLF.DungeonLoot:GetItemSource(itemID)
    return self.itemToContent[itemID]
end
