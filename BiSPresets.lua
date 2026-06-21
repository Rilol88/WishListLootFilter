-- BiSPresets.lua
-- Best-in-Slot item presets for TBC classes/specs.

WLLF = WLLF or {}
WLLF.BiSPresets = {
    ["WARRIOR-Tank"] = {
        34009,  -- Chestguard of the Uncrowned
        34010,  -- Pauldrons of the Uncrowned
        34011,  -- Legguards of the Uncrowned
        33121,  -- Hyjal Plate Helm
        32235,  -- Vambraces of Steadiness
        32237,  -- Girdle of the Steadfast
        30109,  -- Bracers of the Ancient Phalanx
        29201,  -- Black Soul Trappings
    },
    ["WARRIOR-DPS"] = {
        34016,  -- Lawbringer Helm
        34017,  -- Lawbringer Chestplate
        34015,  -- Lawbringer Legplates
        32247,  -- Vambraces of Invulnerability
        30105,  -- Girdle of the Fearless
        30110,  -- Bracers of the Endless Mage
    },
    ["ROGUE-DPS"] = {
        34055,  -- Trickster's Handguards
        34054,  -- Trickster's Bindings
        34053,  -- Trickster's Leather Chestpiece
        31343,  -- Blind-Seers Icon
        30881,  -- Icon of Unyielding Strength
        32837,  -- Blind-Seers Icon
    },
    ["PRIEST-Healer"] = {
        34069,  -- Holy Cloak of the Virtuous
        34070,  -- Holy Vestments of the Virtuous
        34071,  -- Holy Trousers of the Virtuous
        30093,  -- Robe of Eternal Light
        32236,  -- Virtuous Gloves
        30103,  -- Circle of Eternal Forces
    },
    ["PRIEST-Shadow"] = {
        34073,  -- Void Reaper's Contract
        34072,  -- Void Reaper's Cloak
        34074,  -- Void Reaper's Tunic
        30106,  -- Mantle of the Immortal Sage
        30108,  -- Leggings of Eternity
        31098,  -- Shadow Wing Breastplate
    },
    ["MAGE-Frost"] = {
        34095,  -- Robe of the Void
        34094,  -- Void Sorcerer's Hauberk
        34096,  -- Void Sorcerer's Leggings
        32497,  -- Crown of the Eternal Sage
        30104,  -- Bracers of the Eternal Sage
        33843,  -- Mystic Shaper's Ring
    },
    ["MAGE-Arcane"] = {
        34095,  -- Robe of the Void
        34094,  -- Void Sorcerer's Hauberk
        34096,  -- Void Sorcerer's Leggings
        32497,  -- Crown of the Eternal Sage
        32110,  -- Mantle of the Eternal Sage
        33843,  -- Mystic Shaper's Ring
    },
    ["WARLOCK-Destruction"] = {
        34122,  -- Robe of the Void
        34121,  -- Void Sorcerer's Hauberk
        34123,  -- Void Sorcerer's Leggings
        30107,  -- Demon Stalker's Cloak
        32238,  -- Mantle of Dark Whispers
        31098,  -- Mantle of the Immortal
    },
    ["WARLOCK-Affliction"] = {
        34122,  -- Robe of the Void
        34121,  -- Void Sorcerer's Hauberk
        34123,  -- Void Sorcerer's Leggings
        30107,  -- Demon Stalker's Cloak
        32242,  -- Cloak of the Shrouded Mummy
        31098,  -- Mantle of the Immortal
    },
    ["HUNTER-DPS"] = {
        34101,  -- Rift Stalker Chestguard
        34103,  -- Rift Stalker Leggings
        34100,  -- Rift Stalker Helmet
        34102,  -- Rift Stalker Spaulders
        30896,  -- Veritas, Righteous Fury
        30897,  -- Crossbow of Imminent Doom
    },
    ["DRUID-Tank"] = {
        34045,  -- Dreamwalker's Chestguard
        34046,  -- Dreamwalker's Legguards
        34044,  -- Dreamwalker's Helm
        34047,  -- Dreamwalker's Mantle
        32240,  -- Pendant of the Void
        32239,  -- Ring of Eternal Forces
    },
    ["DRUID-Healer"] = {
        34059,  -- Regalia of the Dream Walkers
        34058,  -- Regalia of the Dream Walkers Vestment
        34057,  -- Regalia of the Dream Walkers Helm
        34060,  -- Regalia of the Dream Walkers Shoulderplates
        30891,  -- Living Ruby Slippers
        32241,  -- Ring of Eternal Forces
    },
    ["DRUID-Melee"] = {
        34045,  -- Dreamwalker's Chestguard
        34046,  -- Dreamwalker's Legguards
        34050,  -- Dreamwalker's Helm (DPS version)
        32244,  -- Claws of the Crimson Wyvern
        33684,  -- Thrash Blade
    },
    ["DRUID-Balance"] = {
        34059,  -- Regalia of the Dream Walkers
        34058,  -- Regalia of the Dream Walkers Vestment
        34057,  -- Regalia of the Dream Walkers Helm
        30891,  -- Living Ruby Slippers
        30895,  -- Beastmaw Pauldrons
    },
    ["PALADIN-Tank"] = {
        34030,  -- Chestguard of the Eternal Justicar
        34031,  -- Legguards of the Eternal Justicar
        34029,  -- Helm of the Eternal Justicar
        34032,  -- Pauldrons of the Eternal Justicar
        32230,  -- Pendant of the Void
        32231,  -- Ring of Eternal Forces
    },
    ["PALADIN-Healer"] = {
        34025,  -- Breastplate of the Eternal Justicar
        34026,  -- Leggings of the Eternal Justicar
        34024,  -- Helm of the Eternal Justicar
        34027,  -- Spaulders of the Eternal Justicar
        30893,  -- Holy Nova Cloak
        32232,  -- Circle of Eternal Forces
    },
    ["PALADIN-Retribution"] = {
        34025,  -- Breastplate of the Eternal Justicar
        34026,  -- Leggings of the Eternal Justicar
        34020,  -- Helm of the Retribution
        34027,  -- Spaulders
        31338,  -- Cloak of Eternity
        32233,  -- Pendant of the Void
    },
}

-- Reverse lookup: item ID -> list of class/specs
WLLF.BiSItemIndex = {}
for spec, items in pairs(WLLF.BiSPresets) do
    for _, itemID in ipairs(items) do
        if not WLLF.BiSItemIndex[itemID] then
            WLLF.BiSItemIndex[itemID] = {}
        end
        table.insert(WLLF.BiSItemIndex[itemID], spec)
    end
end
