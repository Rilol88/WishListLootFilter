-- BiSPresets.lua
-- Best-in-Slot Presets für TBC Classic, Phase 5 (Sunwell Plateau / finale Phase).
--
-- Datenquelle: Wowhead offizielle Phase-5-BiS-Gear-Guides pro Klasse/Spec
-- (https://www.wowhead.com/tbc/guides/classes/best-in-slot-guides-burning-crusade-classic).
-- Es werden ausschließlich Item-IDs (Fakten, keine geschützten Inhalte) übernommen,
-- die Struktur/Texte sind eigenständig formuliert.
--
-- rank-Werte: "best", "alt" (Alternative/Optional je nach Guide-Einstufung)
--
-- WICHTIG: Wird Klasse für Klasse befüllt. Aktueller Stand: Hunter (Beast Mastery DPS).

WLLF = WLLF or {}
WLLF.BiSPresets = WLLF.BiSPresets or {}

local function item(id, name, rank, note)
    return { id = id, name = name, rank = rank, note = note }
end

-- ===================== HUNTER =====================

WLLF.BiSPresets["HUNTER-BeastMastery"] = {
    phase = 5,
    role = "DPS",
    source = "Wowhead Phase 5 BiS Guide - Beast Mastery Hunter DPS",
    slots = {
        head = {
            item(34333, "Coif of Alleria", "best"),
            item(34244, "Duplicitous Guise", "best", "Best 9% (ohne Boomkin im Raid)"),
            item(32235, "Cursed Vision of Sargeras", "alt", "Beste Option aus vorheriger Phase"),
            item(33666, "Vengeful Gladiator's Chain Helm", "alt"),
        },
        shoulder = {
            item(31006, "Gronnstalker's Spaulders", "best"),
            item(34194, "Mantle of the Golden Forest", "alt"),
            item(34195, "Shoulderpads of Vehemence", "alt"),
            item(30143, "Rift Stalker Mantle", "alt"),
        },
        back = {
            item(34241, "Cloak of Unforgivable Sin", "best"),
            item(32323, "Shadowmoon Destroyer's Drape", "alt", "Gut bis Unforgivable Sin verfügbar"),
            item(29994, "Thalassian Wildercloak", "alt"),
            item(33484, "Dory's Embrace", "alt"),
        },
        chest = {
            item(34397, "Bladed Chaos Tunic", "best"),
            item(34228, "Vicious Hawkstrider Hauberk", "alt"),
            item(34373, "Embrace of the Phoenix", "alt", "Lederverarbeitung"),
            item(34369, "Carapace of Sun and Shadow", "alt", "Lederverarbeitung, Hit-Variante"),
        },
        wrist = {
            item(34443, "Gronnstalker's Bracers", "best"),
            item(32324, "Insidious Bands", "alt"),
            item(33540, "Master Assassin Wristwraps", "alt"),
            item(29966, "Vambraces of Ending", "alt"),
        },
        hands = {
            item(34370, "Gloves of Immortal Dusk", "best", "Lederverarbeitung"),
            item(34343, "Thalassian Ranger Gauntlets", "best"),
            item(31001, "Gronnstalker's Gloves", "alt"),
            item(30140, "Rift Stalker Gauntlets", "alt"),
        },
        waist = {
            item(34549, "Gronnstalker's Belt", "best"),
            item(32346, "Boneweave Girdle", "alt"),
            item(30879, "Don Alejandro's Money Belt", "alt"),
            item(33211, "Bladeangel's Money Belt", "alt"),
        },
        legs = {
            item(34188, "Leggings of the Immortal Night", "best"),
            item(34168, "Starstalker Legguards", "alt"),
            item(34928, "Trousers of the Scryers' Retainer", "alt"),
            item(31005, "Gronnstalker's Leggings", "alt"),
        },
        feet = {
            item(34570, "Gronnstalker's Boots", "best"),
            item(32366, "Shadowmaster's Boots", "alt"),
            item(33222, "Nyn'jah's Tabi Boots", "alt"),
            item(28545, "Edgewalker Longboots", "alt"),
        },
        neck = {
            item(34358, "Hard Khorium Choker", "best", "Juwelenschleiferei"),
            item(34177, "Clutch of Demise", "best", "Mit Thori'dal"),
            item(32260, "Choker of Endless Nightmares", "alt"),
            item(32591, "Choker of Serrated Blades", "alt"),
        },
        ring1 = {
            item(34189, "Band of Ruinous Delight", "best"),
            item(34361, "Hard Khorium Band", "best", "Juwelenschleiferei"),
            item(34887, "Angelista's Revenge", "alt"),
            item(33496, "Signet of Primal Wrath", "alt"),
        },
        trinket = {
            item(34427, "Blackened Naaru Sliver", "best"),
            item(28830, "Dragonspine Trophy", "alt", "Beste Option ohne Thori'dal"),
            item(33831, "Berserker's Call", "alt", "Beste Option mit Thori'dal"),
            item(32505, "Madness of the Betrayer", "alt", "Gute Hit-Alternative"),
        },
        mainhand = {
            item(34331, "Hand of the Deceiver", "best"),
            item(34329, "Crux of the Apocalypse", "best", "Beste Off-Hand-Kombination"),
            item(34893, "Vanir's Fist of Brutality", "alt"),
            item(34197, "Shiv of Exsanguination", "alt"),
        },
        ranged = {
            item(34334, "Thori'dal, the Stars' Fury", "best"),
            item(34196, "Golden Bow of Quel'Thalas", "alt"),
            item(30906, "Bristleblitz Striker", "alt"),
            item(34530, "Vengeful Gladiator's Rifle", "alt"),
        },
        quiver = {
            item(34105, "Quiver of a Thousand Feathers", "best", "Lederverarbeitung"),
        },
    },
}

WLLF.BiSPresets["HUNTER-Marksmanship"] = {
    phase = 5,
    role = "DPS",
    source = "Wowhead Phase 5 BiS Guide - Marksmanship Hunter DPS",
    slots = {
        head = {
            item(34333, "Coif of Alleria", "best"),
            item(34244, "Duplicitous Guise", "best", "Best 9% (ohne Boomkin im Raid)"),
            item(32235, "Cursed Vision of Sargeras", "alt", "Beste Option aus vorheriger Phase"),
            item(33666, "Vengeful Gladiator's Chain Helm", "alt"),
        },
        shoulder = {
            item(31006, "Gronnstalker's Spaulders", "best"),
            item(34194, "Mantle of the Golden Forest", "alt"),
            item(34195, "Shoulderpads of Vehemence", "alt"),
            item(30143, "Rift Stalker Mantle", "alt"),
        },
        back = {
            item(34241, "Cloak of Unforgivable Sin", "best"),
            item(32323, "Shadowmoon Destroyer's Drape", "alt", "Gut bis Unforgivable Sin verfügbar"),
            item(29994, "Thalassian Wildercloak", "alt"),
            item(33590, "Cloak of Fiends", "alt"),
        },
        chest = {
            item(34397, "Bladed Chaos Tunic", "best"),
            item(34228, "Vicious Hawkstrider Hauberk", "alt"),
            item(34373, "Embrace of the Phoenix", "alt", "Lederverarbeitung"),
            item(34369, "Carapace of Sun and Shadow", "alt", "Lederverarbeitung, Hit-Variante"),
        },
        wrist = {
            item(34443, "Gronnstalker's Bracers", "best"),
            item(32324, "Insidious Bands", "alt"),
            item(33540, "Master Assassin Wristwraps", "alt"),
            item(29966, "Vambraces of Ending", "alt"),
        },
        hands = {
            item(34370, "Gloves of Immortal Dusk", "best", "Lederverarbeitung"),
            item(34343, "Thalassian Ranger Gauntlets", "best"),
            item(31001, "Gronnstalker's Gloves", "alt"),
            item(30140, "Rift Stalker Gauntlets", "alt"),
        },
        waist = {
            item(34549, "Gronnstalker's Belt", "best"),
            item(32346, "Boneweave Girdle", "alt"),
            item(30879, "Don Alejandro's Money Belt", "alt"),
            item(33211, "Bladeangel's Money Belt", "alt"),
        },
        legs = {
            item(34188, "Leggings of the Immortal Night", "best"),
            item(34168, "Starstalker Legguards", "alt"),
            item(34928, "Trousers of the Scryers' Retainer", "alt"),
            item(31005, "Gronnstalker's Leggings", "alt"),
        },
        feet = {
            item(34570, "Gronnstalker's Boots", "best"),
            item(32366, "Shadowmaster's Boots", "alt"),
            item(33222, "Nyn'jah's Tabi Boots", "alt"),
            item(28545, "Edgewalker Longboots", "alt"),
        },
        neck = {
            item(34358, "Hard Khorium Choker", "best", "Juwelenschleiferei"),
            item(34177, "Clutch of Demise", "best", "Mit Thori'dal"),
            item(32260, "Choker of Endless Nightmares", "alt"),
            item(32591, "Choker of Serrated Blades", "alt"),
        },
        ring1 = {
            item(34189, "Band of Ruinous Delight", "best"),
            item(34361, "Hard Khorium Band", "best", "Juwelenschleiferei"),
            item(34887, "Angelista's Revenge", "alt"),
            item(33496, "Signet of Primal Wrath", "alt"),
        },
        trinket = {
            item(34427, "Blackened Naaru Sliver", "best"),
            item(28830, "Dragonspine Trophy", "alt", "Beste Option ohne Thori'dal"),
            item(33831, "Berserker's Call", "alt", "Beste Option mit Thori'dal"),
            item(32505, "Madness of the Betrayer", "alt", "Gute Hit-Alternative"),
        },
        mainhand = {
            item(34331, "Hand of the Deceiver", "best"),
            item(34329, "Crux of the Apocalypse", "best", "Beste Off-Hand-Kombination"),
            item(34893, "Vanir's Fist of Brutality", "alt"),
            item(34197, "Shiv of Exsanguination", "alt"),
        },
        ranged = {
            item(34334, "Thori'dal, the Stars' Fury", "best"),
            item(34196, "Golden Bow of Quel'Thalas", "alt"),
            item(30906, "Bristleblitz Striker", "alt"),
            item(34530, "Vengeful Gladiator's Rifle", "alt"),
        },
        quiver = {
            item(34105, "Quiver of a Thousand Feathers", "best", "Lederverarbeitung"),
        },
    },
}

WLLF.BiSPresets["HUNTER-Survival"] = {
    phase = 5,
    role = "DPS",
    source = "Wowhead Phase 5 BiS Guide - Survival Hunter DPS",
    slots = {
        head = {
            item(34333, "Coif of Alleria", "best"),
            item(34244, "Duplicitous Guise", "best", "Best 9% (ohne Boomkin im Raid)"),
            item(32235, "Cursed Vision of Sargeras", "alt", "Beste Option aus vorheriger Phase"),
            item(31003, "Gronnstalker's Helmet", "alt"),
        },
        shoulder = {
            item(31006, "Gronnstalker's Spaulders", "best"),
            item(34194, "Mantle of the Golden Forest", "alt"),
            item(34195, "Shoulderpads of Vehemence", "alt"),
            item(30143, "Rift Stalker Mantle", "alt"),
        },
        back = {
            item(34241, "Cloak of Unforgivable Sin", "best"),
            item(29994, "Thalassian Wildercloak", "alt"),
            item(33484, "Dory's Embrace", "alt"),
            item(33590, "Cloak of Fiends", "alt"),
        },
        chest = {
            item(34397, "Bladed Chaos Tunic", "best"),
            item(34228, "Vicious Hawkstrider Hauberk", "alt", "Praktisch unkontestiert, sehr gute Alternative"),
            item(34373, "Embrace of the Phoenix", "alt", "Lederverarbeitung"),
            item(34369, "Carapace of Sun and Shadow", "alt", "Lederverarbeitung, Hit-Variante"),
        },
        wrist = {
            item(34443, "Gronnstalker's Bracers", "best"),
            item(32324, "Insidious Bands", "alt"),
            item(33540, "Master Assassin Wristwraps", "alt"),
            item(29966, "Vambraces of Ending", "alt"),
        },
        hands = {
            item(34343, "Thalassian Ranger Gauntlets", "best", "Für Survival vor Gloves of Immortal Dusk priorisieren"),
            item(34370, "Gloves of Immortal Dusk", "alt", "Lederverarbeitung"),
            item(31001, "Gronnstalker's Gloves", "alt"),
            item(30140, "Rift Stalker Gauntlets", "alt"),
        },
        waist = {
            item(34549, "Gronnstalker's Belt", "best"),
            item(30879, "Don Alejandro's Money Belt", "alt"),
            item(32346, "Boneweave Girdle", "alt"),
            item(33211, "Bladeangel's Money Belt", "alt"),
        },
        legs = {
            item(34188, "Leggings of the Immortal Night", "best"),
            item(34168, "Starstalker Legguards", "alt", "Freies Pickup, niemand sonst will diese Legs"),
            item(34928, "Trousers of the Scryers' Retainer", "alt"),
            item(30900, "Bow-Stitched Leggings", "alt"),
        },
        feet = {
            item(34570, "Gronnstalker's Boots", "best"),
            item(32366, "Shadowmaster's Boots", "alt"),
            item(33222, "Nyn'jah's Tabi Boots", "alt"),
            item(28545, "Edgewalker Longboots", "alt"),
        },
        neck = {
            item(34177, "Clutch of Demise", "best", "Beste Gesamtoption für Survival"),
            item(34358, "Hard Khorium Choker", "best", "Mehr persönlicher DPS, Juwelenschleiferei"),
            item(32260, "Choker of Endless Nightmares", "alt"),
            item(32591, "Choker of Serrated Blades", "alt"),
        },
        ring1 = {
            item(34361, "Hard Khorium Band", "best", "Juwelenschleiferei"),
            item(34887, "Angelista's Revenge", "best"),
            item(33496, "Signet of Primal Wrath", "alt"),
            item(29301, "Band of the Eternal Champion", "alt"),
        },
        trinket = {
            item(34427, "Blackened Naaru Sliver", "best"),
            item(28830, "Dragonspine Trophy", "best", "Bleibt für Survival immer BiS, unabhängig von Thori'dal"),
            item(33831, "Berserker's Call", "alt"),
            item(32505, "Madness of the Betrayer", "alt", "Gute Hit-Alternative"),
        },
        mainhand = {
            item(34331, "Hand of the Deceiver", "best"),
            item(34893, "Vanir's Fist of Brutality", "alt"),
            item(34329, "Crux of the Apocalypse", "alt"),
            item(34197, "Shiv of Exsanguination", "alt", "Empfehlung für Survival wegen ArP-Cap"),
        },
        ranged = {
            item(34334, "Thori'dal, the Stars' Fury", "best"),
            item(34196, "Golden Bow of Quel'Thalas", "alt"),
            item(30906, "Bristleblitz Striker", "alt"),
            item(34530, "Vengeful Gladiator's Rifle", "alt"),
        },
        quiver = {
            item(34105, "Quiver of a Thousand Feathers", "best", "Lederverarbeitung"),
        },
    },
}

-- ===================== WARRIOR =====================

WLLF.BiSPresets["WARRIOR-Protection"] = {
    phase = 5,
    role = "Tank",
    source = "Wowhead Phase 5 BiS Guide - Protection Warrior Tank",
    slots = {
        head = {
            item(34400, "Crown of Dath'Remar", "best", "Beste Mitigation-Option"),
            item(34357, "Hard Khorium Goggles", "best", "Ingenieurskunst, Mitigation + Hit"),
            item(35068, "Brutal Gladiator's Plate Helm", "alt", "Beste Threat-Option (Arena)"),
            item(34354, "Mayhem Projection Goggles", "alt", "Ingenieurskunst, Threat-Alternative"),
        },
        shoulder = {
            item(35070, "Brutal Gladiator's Plate Shoulders", "best", "Bei verfügbarer Arena-Wertung"),
            item(34388, "Pauldrons of Berserking", "best", "Beste Threat-Option"),
            item(34192, "Pauldrons of Perseverance", "best", "Beste Mitigation-Option"),
            item(30980, "Onslaught Shoulderguards", "alt", "Für 4-teiliges Tier-Set"),
        },
        back = {
            item(34190, "Crimson Paragon's Cover", "best", "Beste Threat- und Mitigation-Option zugleich"),
            item(34010, "Pepe's Shroud of Pacification", "alt", "Hit-Option"),
            item(33593, "Slikk's Cloak of Placation", "alt", "Mitigation-Alternative"),
        },
        chest = {
            item(35066, "Brutal Gladiator's Plate Chestpiece", "best", "Beste Gesamtoption (Arena)"),
            item(34377, "Hard Khorium Battleplate", "best", "Schmiedekunst, Threat-Option"),
            item(34394, "Breastplate of Agony's Aversion", "best", "Beste Mitigation-Option"),
            item(30976, "Onslaught Chestguard", "alt", "Für 4-teiliges Tier-Set"),
        },
        wrist = {
            item(34442, "Onslaught Wristguards", "best"),
            item(33516, "Bracers of the Ancient Phalanx", "alt", "Expertise-Option"),
            item(32232, "Eternium Shell Bracers", "alt", "Mitigation-Alternative"),
        },
        hands = {
            item(32280, "Gauntlets of Enforcement", "best", "Expertise-Option"),
            item(34378, "Hard Khorium Battlefists", "alt", "Schmiedekunst, Hit-Option"),
            item(34341, "Borderland Paingrips", "alt", "Crit-Option"),
            item(34352, "Borderland Fortress Grips", "best", "Beste Mitigation-Option"),
        },
        waist = {
            item(34547, "Onslaught Waistguard", "best"),
            item(34941, "Girdle of the Fearless", "alt", "Übergangslösung bis Tier-Token"),
        },
        legs = {
            item(34381, "Felstrength Legplates", "best"),
            item(34940, "Sunguard Legplates", "alt", "Übergangsoption"),
            item(35069, "Brutal Gladiator's Plate Legguards", "alt", "Threat-Alternative (Arena)"),
            item(34382, "Judicator's Legguards", "alt", "Mitigation-Alternative"),
        },
        feet = {
            item(34568, "Onslaught Boots", "best", "Einzige relevante SWP-Option"),
        },
        neck = {
            item(34178, "Collar of the Pit Lord", "best"),
            item(33296, "Brooch of Deftness", "alt", "Beste Threat-Option"),
            item(32362, "Pendant of Titans", "alt", "Mitigation-Alternative"),
            item(34680, "Shattered Sun Pendant of Resolve", "alt", "Mitigation-Alternative, Ruf-Belohnung"),
        },
        ring1 = {
            item(34213, "Ring of Hardened Resolve", "best", "Bester Ring, deckt Threat und Mitigation ab"),
            item(34888, "Ring of the Stalwart Protector", "alt", "Zweitbeste Mitigation-Option"),
            item(34361, "Hard Khorium Band", "best", "Beste Threat-Option, Juwelenschleiferei"),
            item(34887, "Angelista's Revenge", "alt", "Threat-Alternative"),
        },
        trinket = {
            item(34473, "Commendation of Kael'thas", "best", "Beste allgemeine Mitigation"),
            item(31858, "Darkmoon Card: Vengeance", "alt", "Mitigation, passiver Threat-Bonus"),
            item(34472, "Shard of Contempt", "best", "Beste Threat-Option (Expertise)"),
            item(34428, "Steely Naaru Sliver", "alt", "Threat-Alternative mit On-Use"),
        },
        mainhand = {
            item(34164, "Dragonscale-Encrusted Longblade", "best"),
            item(32254, "The Brutalizer", "alt"),
            item(30874, "The Unbreakable Will", "alt", "Beste Mitigations-Waffe"),
        },
        shield = {
            item(34185, "Sword Breaker's Bulwark", "best"),
            item(32375, "Bulwark of Azzinoth", "alt", "Knapper Zweitplatz"),
            item(35094, "Brutal Gladiator's Shield Wall", "alt"),
        },
        ranged = {
            item(32253, "Legionkiller", "best", "Beste Gesamtoption"),
            item(34349, "Blade of Life's Inevitability", "alt", "Threat-Option"),
            item(29949, "Arcanite Steam-Pistol", "alt", "Hit-Alternative"),
        },
    },
}

WLLF.BiSPresets["WARRIOR-Arms"] = {
    phase = 5,
    role = "DPS",
    source = "Wowhead Phase 5 BiS Guide - Arms Warrior DPS",
    slots = {
        head = {
            item(34333, "Coif of Alleria", "best"),
            item(34345, "Crown of Anasterian", "best", "Nur von anderen Warriors kontestiert"),
            item(34354, "Mayhem Projection Goggles", "alt", "Ingenieurskunst"),
            item(32235, "Cursed Vision of Sargeras", "alt"),
        },
        shoulder = {
            item(34388, "Pauldrons of Berserking", "best"),
            item(34392, "Demontooth Shoulderpads", "best"),
            item(34194, "Mantle of the Golden Forest", "best"),
            item(30979, "Onslaught Shoulderblades", "best", "Für 4-teiliges Tier-Set"),
        },
        back = {
            item(34241, "Cloak of Unforgivable Sin", "best"),
            item(32323, "Shadowmoon Destroyer's Drape", "alt"),
            item(33484, "Dory's Embrace", "alt"),
            item(33122, "Cloak of Darkness", "alt", "Beste gecraftete Option, Lederverarbeitung"),
        },
        chest = {
            item(34397, "Bladed Chaos Tunic", "best"),
            item(34377, "Hard Khorium Battleplate", "best", "Schmiedekunst"),
            item(34215, "Warharness of Reckless Fury", "alt", "Übergangsoption"),
            item(30975, "Onslaught Breastplate", "alt"),
        },
        wrist = {
            item(34441, "Onslaught Bracers", "best"),
            item(30863, "Deadly Cuffs", "alt"),
            item(32574, "Bindings of Lightning Reflexes", "alt", "Beste gecraftete Option, Lederverarbeitung"),
            item(30057, "Bracers of Eradication", "alt"),
        },
        hands = {
            item(34343, "Thalassian Ranger Gauntlets", "best"),
            item(34370, "Gloves of Immortal Dusk", "best", "Lederverarbeitung"),
            item(34341, "Borderland Paingrips", "alt", "Unkontestierte Alternative"),
            item(32278, "Grips of Silent Justice", "alt"),
        },
        waist = {
            item(34546, "Onslaught Belt", "best"),
            item(30106, "Belt of One-Hundred Deaths", "best"),
            item(33211, "Bladeangel's Money Belt", "alt"),
            item(30032, "Red Belt of Battle", "alt", "Schmiedekunst"),
        },
        legs = {
            item(34180, "Felfury Legplates", "best", "Fast unkontestiert, etwas weniger Hit"),
            item(34188, "Leggings of the Immortal Night", "best", "Mehr Armor Penetration, stärker kontestiert"),
            item(32341, "Leggings of Divine Retribution", "alt"),
            item(30898, "Shady Dealer's Pantaloons", "alt"),
        },
        feet = {
            item(34569, "Onslaught Treads", "best"),
            item(32345, "Dreadboots of the Legion", "alt"),
            item(30081, "Warboots of Obliteration", "alt"),
            item(28608, "Ironstriders of Urgency", "alt"),
        },
        neck = {
            item(34358, "Hard Khorium Choker", "best", "Juwelenschleiferei, beste Option"),
            item(34177, "Clutch of Demise", "best", "Ohne Berufs-Voraussetzung"),
            item(32260, "Choker of Endless Nightmares", "alt"),
            item(32591, "Choker of Serrated Blades", "alt"),
        },
        ring1 = {
            item(34189, "Band of Ruinous Delight", "best"),
            item(34361, "Hard Khorium Band", "best", "Juwelenschleiferei"),
            item(32497, "Stormrage Signet Ring", "best", "Starke Hit-Option"),
            item(34887, "Angelista's Revenge", "alt"),
        },
        trinket = {
            item(34427, "Blackened Naaru Sliver", "best"),
            item(34472, "Shard of Contempt", "best", "Viel Expertise, leicht zu farmen"),
            item(28830, "Dragonspine Trophy", "best"),
            item(33831, "Berserker's Call", "alt"),
        },
        twohand = {
            item(34247, "Apolyon, the Soul-Render", "best", "Hauptwaffe bis WotLK"),
            item(30902, "Cataclysm's Edge", "best"),
            item(32348, "Soul Cleaver", "best"),
            item(29993, "Twinblade of the Phoenix", "best"),
        },
        mainhand = {
            item(32837, "Warglaive of Azzinoth", "best", "Bestes Dual-Wield-Paar (mit zweitem Warglaive)"),
            item(35101, "Brutal Gladiator's Slicer", "alt"),
            item(34214, "Muramasa", "alt"),
            item(28439, "Dragonstrike", "alt", "Meisterschmied-Rezept"),
        },
        ranged = {
            item(34196, "Golden Bow of Quel'Thalas", "best"),
            item(34892, "Crossbow of Relentless Strikes", "best", "Abzeichen der Gerechtigkeit"),
            item(33474, "Ancient Amani Longbow", "alt"),
            item(32326, "Twisted Blades of Zarak", "alt"),
        },
    },
}

WLLF.BiSPresets["WARRIOR-Fury"] = {
    phase = 5,
    role = "DPS",
    source = "Wowhead Phase 5 BiS Guide - Fury Warrior DPS",
    slots = {
        head = {
            item(34333, "Coif of Alleria", "best"),
            item(34345, "Crown of Anasterian", "best", "Nur von anderen Warriors kontestiert"),
            item(34354, "Mayhem Projection Goggles", "alt", "Ingenieurskunst"),
            item(32235, "Cursed Vision of Sargeras", "alt"),
        },
        shoulder = {
            item(34388, "Pauldrons of Berserking", "best"),
            item(34392, "Demontooth Shoulderpads", "best"),
            item(34194, "Mantle of the Golden Forest", "best"),
            item(30979, "Onslaught Shoulderblades", "best", "Für 4-teiliges Tier-Set"),
        },
        back = {
            item(34241, "Cloak of Unforgivable Sin", "best"),
            item(32323, "Shadowmoon Destroyer's Drape", "alt"),
            item(33484, "Dory's Embrace", "alt"),
            item(33122, "Cloak of Darkness", "alt", "Beste gecraftete Option, Lederverarbeitung"),
        },
        chest = {
            item(34397, "Bladed Chaos Tunic", "best"),
            item(34377, "Hard Khorium Battleplate", "best", "Schmiedekunst"),
            item(34215, "Warharness of Reckless Fury", "alt", "Übergangsoption"),
            item(30975, "Onslaught Breastplate", "alt"),
        },
        wrist = {
            item(34441, "Onslaught Bracers", "best"),
            item(30863, "Deadly Cuffs", "alt"),
            item(32574, "Bindings of Lightning Reflexes", "alt", "Beste gecraftete Option, Lederverarbeitung"),
            item(30057, "Bracers of Eradication", "alt"),
        },
        hands = {
            item(34343, "Thalassian Ranger Gauntlets", "best"),
            item(34370, "Gloves of Immortal Dusk", "best", "Lederverarbeitung"),
            item(34341, "Borderland Paingrips", "alt", "Unkontestierte Alternative"),
            item(32278, "Grips of Silent Justice", "alt"),
        },
        waist = {
            item(34546, "Onslaught Belt", "best"),
            item(30106, "Belt of One-Hundred Deaths", "best"),
            item(33211, "Bladeangel's Money Belt", "alt"),
            item(30032, "Red Belt of Battle", "alt", "Schmiedekunst"),
        },
        legs = {
            item(34180, "Felfury Legplates", "best", "Fast unkontestiert, etwas weniger Hit"),
            item(34188, "Leggings of the Immortal Night", "best", "Mehr Armor Penetration, stärker kontestiert"),
            item(32341, "Leggings of Divine Retribution", "alt"),
            item(30898, "Shady Dealer's Pantaloons", "alt"),
        },
        feet = {
            item(34569, "Onslaught Treads", "best"),
            item(32345, "Dreadboots of the Legion", "alt"),
            item(30081, "Warboots of Obliteration", "alt"),
            item(28608, "Ironstriders of Urgency", "alt"),
        },
        neck = {
            item(34358, "Hard Khorium Choker", "best", "Juwelenschleiferei, beste Option"),
            item(34177, "Clutch of Demise", "best", "Ohne Berufs-Voraussetzung"),
            item(32260, "Choker of Endless Nightmares", "alt"),
            item(32591, "Choker of Serrated Blades", "alt"),
        },
        ring1 = {
            item(34189, "Band of Ruinous Delight", "best"),
            item(34361, "Hard Khorium Band", "best", "Juwelenschleiferei"),
            item(32497, "Stormrage Signet Ring", "best", "Starke Hit-Option"),
            item(34887, "Angelista's Revenge", "alt"),
        },
        trinket = {
            item(34427, "Blackened Naaru Sliver", "best"),
            item(34472, "Shard of Contempt", "best", "Viel Expertise, leicht zu farmen"),
            item(28830, "Dragonspine Trophy", "best"),
            item(33831, "Berserker's Call", "alt"),
        },
        mainhand = {
            item(32837, "Warglaive of Azzinoth", "best", "Bestes Dual-Wield-Paar (mit zweitem Warglaive)"),
            item(35101, "Brutal Gladiator's Slicer", "alt"),
            item(34214, "Muramasa", "alt", "Auch als Offhand nutzbar"),
            item(28439, "Dragonstrike", "alt", "Meisterschmied-Rezept"),
        },
        offhand = {
            item(32838, "Warglaive of Azzinoth", "best", "Zweites Warglaive für das Paar"),
            item(34346, "Mounting Vengeance", "alt", "Trash-Drop in Sunwell Plateau"),
            item(34331, "Hand of the Deceiver", "alt"),
        },
        ranged = {
            item(34196, "Golden Bow of Quel'Thalas", "best"),
            item(34892, "Crossbow of Relentless Strikes", "best", "Abzeichen der Gerechtigkeit"),
            item(33474, "Ancient Amani Longbow", "alt"),
            item(32326, "Twisted Blades of Zarak", "alt"),
        },
    },
}

-- ===================== PALADIN =====================

WLLF.BiSPresets["PALADIN-Protection"] = {
    phase = 5,
    role = "Tank",
    source = "Wowhead Phase 5 BiS Guide - Protection Paladin Tank",
    slots = {
        head = {
            item(34401, "Helm of Uther's Resolve", "best", "Bester Allround-Helm"),
            item(34400, "Crown of Dath'Remar", "best", "Beste Mitigation, z.B. gegen Brutallus"),
            item(32521, "Faceplate of the Impenetrable", "alt"),
            item(30987, "Lightbringer Faceguard", "alt"),
        },
        shoulder = {
            item(34389, "Spaulders of the Thalassian Defender", "best", "Ausgewogen, für 4er-Set-Bonus"),
            item(34192, "Pauldrons of Perseverance", "best", "Starke Mitigation-Alternative"),
            item(30998, "Lightbringer Shoulderguards", "alt"),
            item(29070, "Justicar Shoulderguards", "alt", "Threat-2-Set"),
        },
        back = {
            item(34190, "Crimson Paragon's Cover", "best", "Beste Mitigation"),
            item(33593, "Slikk's Cloak of Placation", "alt"),
            item(28766, "Ruby Drape of the Mysticant", "alt", "Single-Target-Threat"),
            item(34242, "Tattered Cape of Antonidas", "alt"),
        },
        chest = {
            item(34216, "Heroic Judicator's Chestguard", "best", "Bester ausgewogener Brustpanzer"),
            item(30991, "Lightbringer Chestguard", "alt"),
            item(34945, "Shattrath Protectorate's Breastplate", "best", "Beste Single-Target-Threat-Option"),
            item(34939, "Chestplate of Stoicism", "alt"),
        },
        wrist = {
            item(34433, "Lightbringer Wristguards", "best"),
            item(32232, "Eternium Shell Bracers", "alt"),
            item(32279, "The Seeker's Wristguards", "alt"),
        },
        hands = {
            item(34352, "Borderland Fortress Grips", "best", "Mitigation-fokussiert"),
            item(30985, "Lightbringer Handguards", "best", "Ausgewogen, 4-Set-fähig"),
            item(29998, "Royal Gauntlets of Silvermoon", "alt"),
        },
        waist = {
            item(34488, "Lightbringer Waistguard", "best"),
            item(32342, "Girdle of Mighty Resolve", "alt"),
            item(33524, "Girdle of the Protector", "alt", "Threat-Option"),
        },
        legs = {
            item(34382, "Judicator's Legguards", "best"),
            item(30995, "Lightbringer Legguards", "alt"),
            item(32263, "Praetorian's Legguards", "alt", "Mitigation-Alternative"),
        },
        feet = {
            item(34560, "Lightbringer Stompers", "best"),
            item(32245, "Tide-Stomper's Greaves", "best", "Gleichwertige Alternative"),
            item(34947, "Blue's Greaves of the Righteous Guardian", "alt", "Threat-Option"),
        },
        neck = {
            item(34178, "Collar of the Pit Lord", "best"),
            item(30007, "The Darkener's Grasp", "alt", "Beste Avoidance-Option"),
            item(32362, "Pendant of Titans", "alt"),
            item(34680, "Shattered Sun Pendant of Resolve", "alt"),
        },
        ring1 = {
            item(34213, "Ring of Hardened Resolve", "best", "Mitigation"),
            item(34888, "Ring of the Stalwart Protector", "best", "Avoidance"),
            item(34889, "Fused Nethergon Band", "best", "Beste Threat-Option"),
            item(34362, "Loop of Forged Power", "alt", "Threat, Juwelenschleiferei"),
        },
        trinket = {
            item(34473, "Commendation of Kael'thas", "best", "Beste Stamina-Option"),
            item(31858, "Darkmoon Card: Vengeance", "alt"),
            item(32501, "Shadowmoon Insignia", "best", "Beste allgemeine Mitigation"),
            item(28528, "Moroes' Lucky Pocket Watch", "alt"),
        },
        mainhand = {
            item(30910, "Tempest of Chaos", "best", "Beste PvE-Option"),
            item(35014, "Brutal Gladiator's Gavel", "alt", "Stärker, aber Arena-Wertung nötig"),
            item(34176, "Reign of Misery", "alt"),
        },
        shield = {
            item(34185, "Sword Breaker's Bulwark", "best"),
            item(35094, "Brutal Gladiator's Shield Wall", "alt"),
            item(32375, "Bulwark of Azzinoth", "alt"),
        },
        relic = {
            item(29388, "Libram of Repentance", "best", "Beste Avoidance"),
            item(32368, "Tome of the Lightbringer", "best", "Beste Mitigation"),
            item(33504, "Libram of Divine Purpose", "best", "Beste Single-Target-Threat"),
        },
    },
}

WLLF.BiSPresets["PALADIN-Holy"] = {
    phase = 5,
    role = "Healer",
    source = "Wowhead Phase 5 BiS Guide - Holy Paladin Healing",
    slots = {
        head = {
            item(34243, "Helm of Burning Righteousness", "best"),
            item(34402, "Shroud of Chieftain Ner'zhul", "alt", "Haste-Variante"),
            item(35185, "Justicebringer 3000 Specs", "alt", "Ingenieurskunst, Übergangsoption"),
            item(30988, "Lightbringer Greathelm", "alt"),
        },
        shoulder = {
            item(34193, "Spaulders of the Thalassian Savior", "best"),
            item(34208, "Equilibrium Epaulets", "alt", "Haste-Variante"),
            item(30996, "Lightbringer Pauldrons", "alt", "Für 4-Set"),
        },
        back = {
            item(34205, "Shroud of Redeemed Souls", "best"),
            item(32524, "Shroud of the Highborne", "alt", "Haste-Variante"),
            item(34012, "Shroud of the Final Stand", "alt"),
            item(33592, "Cloak of Ancient Rituals", "alt", "Haste-Variante"),
        },
        chest = {
            item(34229, "Garments of Serene Shores", "best"),
            item(34379, "Sunblessed Breastplate", "alt", "Schmiedekunst"),
            item(34395, "Noble Judicator's Chestguard", "alt", "Haste-Variante"),
            item(30992, "Lightbringer Chestpiece", "alt"),
        },
        wrist = {
            item(34432, "Lightbringer Bracers", "best"),
            item(30862, "Blessed Adamantite Bracers", "alt"),
            item(30869, "Howling Wind Bracers", "alt"),
            item(32571, "Dawnsteel Bracers", "alt", "Schmiedekunst"),
        },
        hands = {
            item(34380, "Sunblessed Gauntlets", "best", "Schmiedekunst, keine Konkurrenz"),
            item(34240, "Gauntlets of the Soothed Soul", "best", "Haste-Variante"),
            item(30112, "Glorious Gauntlets of Crestfall", "alt"),
        },
        waist = {
            item(34487, "Lightbringer Belt", "best"),
            item(33446, "Girdle of Stromgarde's Hope", "alt"),
            item(30030, "Girdle of Fallen Stars", "alt"),
        },
        legs = {
            item(34167, "Legplates of the Holy Juggernaut", "best"),
            item(34383, "Kilt of Spiritual Reconstruction", "alt", "Haste-Variante"),
            item(30994, "Lightbringer Leggings", "alt"),
            item(30912, "Leggings of Eternity", "alt"),
        },
        feet = {
            item(34559, "Lightbringer Treads", "best"),
            item(32243, "Pearl Inlaid Boots", "alt"),
            item(30027, "Boots of Courage Unending", "alt"),
            item(32609, "Boots of the Divine Light", "alt"),
        },
        neck = {
            item(32370, "Nadina's Pendant of Purity", "best", "Ohne Juwelenschleiferei"),
            item(34360, "Amulet of Flowing Life", "best", "Juwelenschleiferei"),
            item(34184, "Brooch of the Highborne", "alt", "Haste-Variante"),
            item(30018, "Lord Sanguinar's Claim", "alt"),
        },
        ring1 = {
            item(34363, "Ring of Flowing Life", "best", "Juwelenschleiferei"),
            item(32528, "Blessed Band of Karabor", "best", "Haste-Variante, Trash-Drop"),
            item(34166, "Band of Lucent Beams", "alt", "Haste-Variante"),
            item(32238, "Ring of Calming Waves", "alt"),
        },
        trinket = {
            item(34430, "Glimmering Naaru Sliver", "best"),
            item(35750, "Redeemer's Alchemist Stone", "alt", "Alchemie"),
            item(32496, "Memento of Tyrande", "best"),
            item(29376, "Essence of the Martyr", "alt"),
        },
        mainhand = {
            item(34335, "Hammer of Sanctification", "best", "Stark kontestiert"),
            item(34199, "Archon's Gavel", "alt"),
            item(32500, "Crystal Spire of Karabor", "alt", "Stark kontestiert"),
            item(30918, "Hammer of Atonement", "alt", "Leichter zu bekommen"),
        },
        offhand = {
            item(34231, "Aegis of Angelic Fortune", "best", "Schild"),
            item(34206, "Book of Highborne Hymns", "best", "Off-Hand, Haste-Variante"),
            item(32255, "Felstone Bulwark", "alt", "Schild"),
            item(30882, "Bastion of Light", "alt", "Schild"),
        },
        relic = {
            item(28592, "Libram of Souls Redeemed", "best", "Für Blessing of Light"),
            item(23006, "Libram of Light", "best", "Für Flash of Light"),
            item(30063, "Libram of Absolute Truth", "best", "Für Holy Light"),
            item(33502, "Libram of Mending", "alt", "Für Holy Light"),
        },
    },
}

WLLF.BiSPresets["PALADIN-Retribution"] = {
    phase = 5,
    role = "DPS",
    source = "Icy Veins Phase 5 BiS Guide - Retribution Paladin DPS",
    slots = {
        head = {
            item(34244, "Duplicitous Guise", "best"),
        },
        neck = {
            item(34177, "Clutch of Demise", "best"),
        },
        shoulder = {
            item(34388, "Pauldrons of Berserking", "best"),
        },
        back = {
            item(34241, "Cloak of Unforgivable Sin", "best"),
        },
        chest = {
            item(34397, "Bladed Chaos Tunic", "best"),
        },
        wrist = {
            item(34431, "Lightbringer Bands", "best"),
        },
        hands = {
            item(34370, "Gloves of Immortal Dusk", "best", "Lederverarbeitung"),
        },
        waist = {
            item(34485, "Lightbringer Girdle", "best"),
        },
        legs = {
            item(34180, "Felfury Legplates", "best"),
        },
        feet = {
            item(34561, "Lightbringer Boots", "best"),
        },
        ring1 = {
            item(34189, "Band of Ruinous Delight", "best"),
            item(34361, "Hard Khorium Band", "best", "Juwelenschleiferei"),
        },
        trinket = {
            item(34472, "Shard of Contempt", "best"),
            item(34427, "Blackened Naaru Sliver", "best"),
        },
        mainhand = {
            item(34247, "Apolyon, the Soul-Render", "best"),
        },
        relic = {
            item(27484, "Libram of Avengement", "best"),
        },
    },
}

-- ===================== PRIEST =====================

WLLF.BiSPresets["PRIEST-Holy"] = {
    phase = 5,
    role = "Healer",
    source = "Wowhead Phase 5 BiS Guide - Priest Healing",
    slots = {
        head = {
            item(34339, "Cowl of Light's Purity", "best"),
            item(35181, "Powerheal 9000 Lens", "alt", "Ingenieurskunst, Übergangsoption"),
            item(31063, "Cowl of Absolution", "alt"),
            item(30152, "Cowl of the Avatar", "alt"),
        },
        shoulder = {
            item(34202, "Shawl of Wonderment", "best"),
            item(31069, "Mantle of Absolution", "alt"),
            item(30154, "Mantle of the Avatar", "alt"),
            item(32585, "Swiftheal Mantle", "alt", "Schneiderei"),
        },
        back = {
            item(32524, "Shroud of the Highborne", "best", "2% Haste"),
            item(33592, "Cloak of Ancient Rituals", "alt", "Haste-Option"),
            item(29989, "Sunshower Light Cloak", "alt"),
            item(32337, "Shroud of Forgiveness", "alt"),
        },
        chest = {
            item(34233, "Robes of Faltered Light", "best"),
            item(34365, "Robe of Eternal Light", "best", "Schneiderei"),
            item(31066, "Vestments of Absolution", "alt"),
            item(30150, "Vestments of the Avatar", "alt"),
        },
        wrist = {
            item(34435, "Cuffs of Absolution", "best"),
            item(32584, "Swiftheal Wraps", "alt", "Schneiderei"),
            item(30871, "Bracers of Martyrdom", "alt"),
            item(33589, "Wristguards of Tranquil Thought", "alt"),
        },
        hands = {
            item(34342, "Handguards of the Dawn", "best", "Stark kontestiert von Castern"),
            item(34367, "Hands of Eternal Light", "alt", "Schneiderei"),
            item(31060, "Gloves of Absolution", "alt"),
            item(30151, "Gloves of the Avatar", "alt"),
        },
        waist = {
            item(34527, "Belt of Absolution", "best"),
            item(30895, "Angelista's Sash", "alt"),
            item(32519, "Belt of Divine Guidance", "alt"),
            item(30036, "Belt of the Long Road", "alt", "Schneiderei"),
        },
        legs = {
            item(34170, "Pantaloons of Calming Strife", "best"),
            item(30912, "Leggings of Eternity", "alt"),
            item(33585, "Achromic Trousers of the Naaru", "alt"),
            item(34925, "Adorned Supernal Legwraps", "alt"),
        },
        feet = {
            item(34562, "Boots of Absolution", "best"),
            item(32609, "Boots of the Divine Light", "alt"),
            item(34926, "Slippers of Dutiful Mending", "alt"),
            item(30100, "Soul-Strider Boots", "alt"),
        },
        neck = {
            item(33281, "Brooch of Nature's Mercy", "best"),
            item(34360, "Amulet of Flowing Life", "alt", "Juwelenschleiferei"),
            item(34184, "Brooch of the Highborne", "alt"),
        },
        ring1 = {
            item(32528, "Blessed Band of Karabor", "best", "Trash-Drop, ca. 2% Haste"),
            item(34363, "Ring of Flowing Life", "best", "Juwelenschleiferei"),
            item(34166, "Band of Lucent Beams", "alt"),
            item(33498, "Signet of the Quiet Forest", "alt"),
        },
        trinket = {
            item(29376, "Essence of the Martyr", "best", "Throughput"),
            item(38288, "Direbrew Hops", "best", "Throughput, Brewfest"),
            item(32496, "Memento of Tyrande", "alt", "Throughput"),
            item(28823, "Eye of Gruul", "best", "Regen, ideal für Circle of Healing"),
        },
        mainhand = {
            item(34335, "Hammer of Sanctification", "best", "Stark kontestiert"),
            item(34337, "Golden Staff of the Sin'dorei", "best", "Staff-Alternative"),
            item(32500, "Crystal Spire of Karabor", "alt"),
        },
        offhand = {
            item(34206, "Book of Highborne Hymns", "best"),
            item(30911, "Scepter of Purification", "alt"),
            item(32350, "Touch of Inspiration", "alt"),
        },
        ranged = {
            item(34348, "Wand of Cleansing Light", "best"),
            item(32363, "Naaru-Blessed Life Rod", "alt"),
            item(30080, "Luminescent Rod of the Naaru", "alt"),
        },
    },
}

WLLF.BiSPresets["PRIEST-Shadow"] = {
    phase = 5,
    role = "DPS",
    source = "Icy Veins Phase 5 BiS Guide - Shadow Priest DPS",
    slots = {
        head = { item(34340, "Dark Conjuror's Collar", "best") },
        neck = { item(34204, "Amulet of Unfettered Magics", "best") },
        shoulder = { item(31070, "Shoulderpads of Absolution", "best") },
        back = { item(34242, "Tattered Cape of Antonidas", "best") },
        chest = { item(34364, "Sunfire Robe", "best", "Schneiderei") },
        wrist = { item(34434, "Bracers of Absolution", "best") },
        hands = { item(34344, "Handguards of Defiled Worlds", "best") },
        waist = { item(34528, "Cord of Absolution", "best") },
        legs = { item(34386, "Pantaloons of Growing Strife", "best") },
        feet = { item(34563, "Treads of Absolution", "best") },
        ring1 = {
            item(34230, "Ring of Omnipotence", "best"),
            item(32527, "Ring of Ancient Knowledge", "best"),
        },
        trinket = {
            item(33829, "Hex Shrunken Head", "best"),
            item(34429, "Shifting Naaru Sliver", "best"),
        },
        mainhand = { item(34336, "Sunflare", "best") },
        offhand = { item(34179, "Heart of the Pit", "best") },
        ranged = { item(34347, "Wand of the Demonsoul", "best") },
    },
}

-- ===================== SHAMAN =====================

WLLF.BiSPresets["SHAMAN-Restoration"] = {
    phase = 5,
    role = "Healer",
    source = "Icy Veins Phase 5 BiS Guide - Restoration Shaman Healing",
    slots = {
        head = { item(34402, "Shroud of Chieftain Ner'zhul", "best", "Sunmote-Tausch") },
        neck = {
            item(34360, "Amulet of Flowing Life", "best", "Juwelenschleiferei"),
            item(33281, "Brooch of Nature's Mercy", "best"),
        },
        shoulder = {
            item(31022, "Skyshatter Shoulderpads", "best", "Sunmote-Tausch"),
            item(34208, "Equilibrium Epaulets", "alt"),
            item(34202, "Shawl of Wonderment", "alt"),
        },
        back = { item(32524, "Shroud of the Highborne", "best") },
        chest = {
            item(34375, "Sun-Drenched Scale Chestguard", "best", "Lederverarbeitung"),
            item(34212, "Sunglow Vest", "alt"),
        },
        wrist = { item(34438, "Skyshatter Bracers", "best", "Sunmote-Tausch") },
        hands = {
            item(34376, "Sun-Drenched Scale Gloves", "best", "Lederverarbeitung"),
            item(34409, "Gauntlets of the Ancient Frostwolf", "alt", "Sunmote-Tausch"),
        },
        waist = { item(34543, "Skyshatter Belt", "best", "Sunmote-Tausch") },
        legs = { item(34383, "Kilt of Spiritual Reconstruction", "best", "Sunmote-Tausch") },
        feet = { item(34565, "Skyshatter Boots", "best", "Sunmote-Tausch") },
        ring1 = { item(32528, "Blessed Band of Karabor", "best", "2x tragbar, Trash-Drop") },
        trinket = {
            item(35750, "Redeemer's Alchemist Stone", "best", "Alchemie"),
            item(32496, "Memento of Tyrande", "best"),
            item(34430, "Glimmering Naaru Sliver", "alt"),
            item(29376, "Essence of the Martyr", "alt"),
            item(38288, "Direbrew Hops", "alt", "Brewfest"),
        },
        mainhand = { item(34335, "Hammer of Sanctification", "best") },
        offhand = {
            item(34206, "Book of Highborne Hymns", "best"),
            item(34231, "Aegis of Angelic Fortune", "alt", "Schild"),
        },
        relic = { item(28523, "Totem of Healing Rains", "best") },
    },
}

WLLF.BiSPresets["SHAMAN-Elemental"] = {
    phase = 5,
    role = "DPS",
    source = "Icy Veins Phase 5 BiS Guide - Elemental Shaman DPS",
    slots = {
        head = { item(34332, "Cowl of Gul'dan", "best") },
        neck = {
            item(34359, "Pendant of Sunfire", "best", "Juwelenschleiferei"),
            item(34204, "Amulet of Unfettered Magics", "alt"),
        },
        shoulder = { item(31023, "Skyshatter Mantle", "best", "Sunmote-Tausch") },
        back = { item(34242, "Tattered Cape of Antonidas", "best") },
        chest = {
            item(34364, "Sunfire Robe", "best", "Schneiderei"),
            item(34396, "Garments of Crashing Shores", "alt", "Sunmote-Tausch"),
        },
        wrist = { item(34437, "Skyshatter Bands", "best", "Sunmote-Tausch") },
        hands = { item(34350, "Gauntlets of the Ancient Shadowmoon", "best", "Trash-Drop") },
        waist = { item(34542, "Skyshatter Cord", "best", "Sunmote-Tausch") },
        legs = { item(34186, "Chain Links of the Tumultuous Storm", "best") },
        feet = { item(34566, "Skyshatter Treads", "best", "Sunmote-Tausch") },
        ring1 = {
            item(34230, "Ring of Omnipotence", "best"),
            item(34362, "Loop of Forged Power", "best", "Juwelenschleiferei"),
            item(32527, "Ring of Ancient Knowledge", "alt", "2x tragbar, Trash-Drop"),
            item(29305, "Band of the Eternal Sage", "alt"),
        },
        trinket = {
            item(34429, "Shifting Naaru Sliver", "best"),
            item(32483, "The Skull of Gul'dan", "alt", "Stark kontestiert von anderen Castern"),
            item(33829, "Hex Shrunken Head", "alt"),
            item(28785, "The Lightning Capacitor", "best", "Spezialeffekt sehr stark für Elemental"),
        },
        mainhand = { item(34336, "Sunflare", "best") },
        offhand = {
            item(34179, "Heart of the Pit", "best"),
            item(30909, "Antonidas's Aegis of Rapt Concentration", "alt"),
        },
        relic = { item(32330, "Totem of Ancestral Guidance", "best") },
    },
}

WLLF.BiSPresets["SHAMAN-Enhancement"] = {
    phase = 5,
    role = "DPS",
    source = "Icy Veins Phase 5 BiS Guide - Enhancement Shaman DPS",
    slots = {
        head = { item(34244, "Duplicitous Guise", "best") },
        neck = {
            item(34358, "Hard Khorium Choker", "best", "Juwelenschleiferei"),
            item(34177, "Clutch of Demise", "alt"),
        },
        shoulder = { item(34392, "Demontooth Shoulderpads", "best", "Sunmote-Tausch") },
        back = { item(34241, "Cloak of Unforgivable Sin", "best") },
        chest = { item(34397, "Bladed Chaos Tunic", "best", "Sunmote-Tausch") },
        wrist = { item(34439, "Skyshatter Wristguards", "best", "Sunmote-Tausch") },
        hands = { item(34343, "Thalassian Ranger Gauntlets", "best") },
        waist = { item(34545, "Skyshatter Girdle", "best", "Sunmote-Tausch") },
        legs = { item(34188, "Leggings of the Immortal Night", "best") },
        feet = { item(34567, "Skyshatter Greaves", "best", "Sunmote-Tausch") },
        ring1 = {
            item(34189, "Band of Ruinous Delight", "best"),
            item(32497, "Stormrage Signet Ring", "best"),
            item(33496, "Signet of Primal Wrath", "alt"),
            item(34887, "Angelista's Revenge", "alt"),
        },
        trinket = {
            item(34427, "Blackened Naaru Sliver", "best"),
            item(34472, "Shard of Contempt", "best"),
            item(28830, "Dragonspine Trophy", "alt"),
            item(33831, "Berserker's Call", "alt"),
            item(32505, "Madness of the Betrayer", "alt"),
        },
        mainhand = { item(34331, "Hand of the Deceiver", "best") },
        offhand = { item(34346, "Mounting Vengeance", "best", "Trash-Drop in Sunwell Plateau") },
        relic = { item(33507, "Stonebreaker's Totem", "best") },
    },
}

-- ===================== DRUID =====================

WLLF.BiSPresets["DRUID-Restoration"] = {
    phase = 5,
    role = "Healer",
    source = "Icy Veins Phase 5 BiS Guide - Restoration Druid Healing",
    slots = {
        head = {
            item(34245, "Cover of Ursol the Wise", "best"),
            item(34339, "Cowl of Light's Purity", "best"),
        },
        neck = {
            item(34360, "Amulet of Flowing Life", "best", "Juwelenschleiferei"),
            item(33281, "Brooch of Nature's Mercy", "alt"),
        },
        shoulder = {
            item(34209, "Spaulders of Reclamation", "best"),
            item(34202, "Shawl of Wonderment", "alt"),
        },
        back = {
            item(32524, "Shroud of the Highborne", "best"),
            item(32337, "Shroud of Forgiveness", "alt"),
        },
        chest = {
            item(34212, "Sunglow Vest", "best"),
            item(34371, "Leather Chestguard of the Sun", "alt", "Lederverarbeitung"),
        },
        wrist = { item(34445, "Thunderheart Bracers", "best", "Sunmote-Tausch") },
        hands = {
            item(34351, "Tranquil Majesty Wraps", "best", "Trash-Drop"),
            item(34372, "Leather Gauntlets of the Sun", "alt", "Lederverarbeitung"),
        },
        waist = { item(34554, "Thunderheart Belt", "best", "Sunmote-Tausch") },
        legs = { item(34384, "Breeches of Natural Splendor", "best") },
        feet = { item(34571, "Thunderheart Boots", "best", "Sunmote-Tausch") },
        ring1 = {
            item(32528, "Blessed Band of Karabor", "best", "Trash-Drop"),
            item(34363, "Ring of Flowing Life", "alt", "Juwelenschleiferei"),
            item(34166, "Band of Lucent Beams", "alt"),
        },
        trinket = {
            item(29376, "Essence of the Martyr", "best"),
            item(38288, "Direbrew Hops", "alt", "Brewfest"),
            item(32496, "Memento of Tyrande", "alt"),
        },
        mainhand = {
            item(34335, "Hammer of Sanctification", "best"),
            item(34337, "Golden Staff of the Sin'dorei", "alt"),
        },
        offhand = { item(34206, "Book of Highborne Hymns", "best") },
        relic = { item(27886, "Idol of the Emerald Queen", "best") },
    },
}

WLLF.BiSPresets["DRUID-Balance"] = {
    phase = 5,
    role = "DPS",
    source = "Icy Veins Phase 5 BiS Guide - Balance Druid DPS",
    slots = {
        head = {
            item(34340, "Dark Conjuror's Collar", "best"),
            item(34403, "Cover of Ursoc the Mighty", "alt", "Sunmote-Tausch"),
        },
        neck = {
            item(34359, "Pendant of Sunfire", "best", "Juwelenschleiferei"),
            item(34204, "Amulet of Unfettered Magics", "alt"),
        },
        shoulder = { item(31049, "Thunderheart Shoulderpads", "best") },
        back = { item(34242, "Tattered Cape of Antonidas", "best") },
        chest = {
            item(34364, "Sunfire Robe", "best", "Schneiderei"),
            item(34232, "Fel Conquerer Raiments", "alt"),
            item(31043, "Thunderheart Vest", "alt"),
        },
        wrist = { item(34446, "Thunderheart Bands", "best", "Sunmote-Tausch") },
        hands = { item(34344, "Handguards of Defiled Worlds", "best") },
        waist = { item(34555, "Thunderheart Cord", "best", "Sunmote-Tausch") },
        legs = {
            item(34181, "Leggings of Calamity", "best"),
            item(34169, "Breeches of Natural Aggression", "alt"),
        },
        feet = { item(34572, "Thunderheart Footwraps", "best", "Sunmote-Tausch") },
        ring1 = {
            item(34230, "Ring of Omnipotence", "best"),
            item(34362, "Loop of Forged Power", "alt", "Juwelenschleiferei"),
        },
        trinket = {
            item(34429, "Shifting Naaru Sliver", "best"),
            item(32483, "The Skull of Gul'dan", "alt"),
            item(33829, "Hex Shrunken Head", "alt"),
            item(32486, "Ashtongue Talisman of Equilibrium", "alt"),
        },
        mainhand = { item(34336, "Sunflare", "best") },
        offhand = { item(34179, "Heart of the Pit", "best") },
        relic = { item(32387, "Idol of the Raven Goddess", "best") },
    },
}

WLLF.BiSPresets["DRUID-Feral"] = {
    phase = 5,
    role = "DPS",
    source = "Icy Veins Phase 5 BiS Guide - Feral Druid DPS",
    slots = {
        head = { item(8345, "Wolfshead Helm", "best", "Lederverarbeitung, beste DPS-Option fürs Powershifting") },
        neck = {
            item(32260, "Choker of Endless Nightmares", "best"),
            item(34358, "Hard Khorium Choker", "alt", "Juwelenschleiferei"),
            item(34177, "Clutch of Demise", "alt"),
            item(24114, "Braided Eternium Chain", "alt", "Juwelenschleiferei"),
        },
        shoulder = {
            item(31048, "Thunderheart Pauldrons", "best"),
            item(34392, "Demontooth Shoulderpads", "alt", "Sunmote-Tausch"),
        },
        back = { item(34241, "Cloak of Unforgivable Sin", "best") },
        chest = { item(34397, "Bladed Chaos Tunic", "best", "Sunmote-Tausch") },
        wrist = { item(34444, "Thunderheart Wristguards", "best", "Sunmote-Tausch") },
        hands = { item(34370, "Gloves of Immortal Dusk", "best", "Lederverarbeitung") },
        waist = { item(34556, "Thunderheart Waistguard", "best", "Sunmote-Tausch") },
        legs = { item(34188, "Leggings of the Immortal Night", "best") },
        feet = { item(34573, "Thunderheart Treads", "best", "Sunmote-Tausch") },
        ring1 = {
            item(34189, "Band of Ruinous Delight", "best"),
            item(34887, "Angelista's Revenge", "alt"),
            item(29301, "Band of the Eternal Champion", "alt"),
            item(33496, "Signet of Primal Wrath", "alt"),
        },
        trinket = {
            item(34427, "Blackened Naaru Sliver", "best"),
            item(34472, "Shard of Contempt", "best"),
            item(30627, "Tsunami Talisman", "alt"),
            item(33831, "Berserker's Call", "alt"),
        },
        twohand = { item(34198, "Stanchion of Primal Instinct", "best") },
        relic = {
            item(32387, "Idol of the Raven Goddess", "best", "Gruppen-DPS"),
            item(29390, "Everbloom Idol", "best", "Persönlicher DPS"),
        },
    },
}

-- TODO: weitere Klassen werden Klasse für Klasse nach demselben Schema ergänzt.
