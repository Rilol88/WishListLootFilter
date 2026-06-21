# WishListLootFilter

Ein schlankes WoW: Burning Crusade Classic Addon, mit dem du dir eine **Wunschliste** aus Items zusammenstellen kannst. Sobald eines dieser Items droppt, bekommst du eine **Notification** und im **Item-Tooltip** wird vermerkt, dass das Item auf deiner Liste steht.

Inspiriert vom Loot-Wishlist-Konzept von [KeystoneLoot](https://github.com/Wolkenschutz/KeystoneLoot) (Retail), aber von Grund auf für TBC Classic neu gebaut.

## Features

- **Wunschliste verwalten**: Items per Drag&Drop ins Fenster ziehen oder per `/wll add <itemlink>` hinzufügen.
- **Drop-Notification**: Beim Öffnen eines Loot-Fensters wird geprüft, ob ein Wunschlisten-Item dabei ist – inkl. Popup und Sound.
- **Tooltip-Integration**: Items auf der Liste werden im Tooltip mit „★ Auf deiner Wunschliste" markiert.
- **Export/Import**: Wunschlisten als kompakten String teilen (`WLLF:v1:...`).
- **Minimap-Button**: Schneller Zugriff, frei positionierbar.
- **Slash-Commands**: `/wll`, `/wll add`, `/wll remove`, `/wll export`, `/wll import`, `/wll clear`.

## Scope (v0.1)

- Es wird ausschließlich **eigenes Loot** erkannt (kein Parsing von Gruppen-/Raid-Loot anderer Spieler) – das hält die Erkennung einfach und zuverlässig.
- Pro-Charakter-Speicherung (`WishListLootFilterCharDB`), da Wunschlisten i.d.R. klassen-/charakterspezifisch sind.

## Installation

1. Ordner `WishListLootFilter` nach `World of Warcraft/_classic_/Interface/AddOns/` kopieren.
2. WoW (neu) starten, Addon im Char-Auswahlbildschirm aktivieren.

## Geplante Erweiterungen

- Quelle/Boss pro Item hinterlegen (UI-Eingabefeld statt nur Slash-Command)
- Filter nach Slot/Klasse
- Optionales Parsing von Gruppen-Loot
- LibDataBroker/LibDBIcon-Unterstützung für bessere Minimap-Button-Kompatibilität mit anderen Addons (z.B. Titan Panel)

## Lizenz

MIT
