local locale = GetLocale()
if locale ~= "deDE" then return end

local L = WLLF_L

L["WISHLIST"] = "Wunschliste"
L["ADD_ITEM"] = "Item hinzufügen"
L["REMOVE_ITEM"] = "Entfernen"
L["EXPORT"] = "Exportieren"
L["IMPORT"] = "Importieren"
L["NOTE"] = "Notiz"
L["SOURCE"] = "Quelle"
L["ON_WISHLIST"] = "Auf deiner Wunschliste"
L["ITEM_DROPPED"] = "Ein Wunschlisten-Item ist gedroppt!"
L["ITEM_ADDED"] = "%s wurde zur Wunschliste hinzugefügt."
L["ITEM_REMOVED"] = "%s wurde von der Wunschliste entfernt."
L["ITEM_ALREADY_ON_LIST"] = "%s ist bereits auf deiner Wunschliste."
L["DRAG_ITEM_HINT"] = "Ziehe ein Item hierher oder shift-klicke einen Item-Link, um es hinzuzufügen."
L["EXPORT_HINT"] = "Kopiere diesen String, um deine Wunschliste zu teilen:"
L["IMPORT_HINT"] = "Füge hier einen exportierten Wunschlisten-String ein:"
L["IMPORT_SUCCESS"] = "%d Items importiert."
L["IMPORT_FAILED"] = "Import fehlgeschlagen: ungültiger String."
L["CLOSE"] = "Schließen"
L["SLASH_HELP"] = "WishListLootFilter Befehle:\n/wll - Fenster öffnen/schließen\n/wll add <itemlink> - Item hinzufügen\n/wll remove <itemlink> - Item entfernen\n/wll export - Export-String anzeigen\n/wll import <string> - Wunschliste importieren\n/wll clear - gesamte Wunschliste löschen"
L["PHASE_LABEL"] = "Phase:"
L["PHASE_CURRENT_TAG"] = "(aktuell)"
