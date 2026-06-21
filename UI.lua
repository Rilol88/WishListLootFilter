-- UI.lua
-- Hauptfenster der Wishlist, Drop-Notification-Popup und Export/Import-Dialoge.

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

WLLF.UI = {}
local UI = WLLF.UI

local ROW_HEIGHT = 36
local VISIBLE_ROWS = 8

-- ===================== Hauptfenster =====================

local main
local rows = {}

local function CreateMainFrame()
    local f = CreateFrame("Frame", "WLLFMainFrame", UIParent, "BasicFrameTemplateWithInset")
    f:SetSize(360, 86 + VISIBLE_ROWS * ROW_HEIGHT)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetClampedToScreen(true)
    f:Hide()

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    f.title:SetPoint("TOP", f, "TOP", 0, -6)
    f.title:SetText(L["WISHLIST"])

    -- Phasen-Auswahl (TBC Classic Anniversary: Phase 1-5)
    local phaseLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    phaseLabel:SetPoint("TOPLEFT", f, "TOPLEFT", 14, -28)
    phaseLabel:SetText(L["PHASE_LABEL"] or "Phase:")
    f.phaseLabel = phaseLabel

    local phaseDropdown = CreateFrame("Frame", "WLLFPhaseDropdown", f, "UIDropDownMenuTemplate")
    phaseDropdown:SetPoint("LEFT", phaseLabel, "RIGHT", -8, -2)
    UIDropDownMenu_SetWidth(phaseDropdown, 170)

    local function OnPhaseSelected(self, phaseNum)
        WLLF.DB:SetSetting("selectedPhase", phaseNum)
        UIDropDownMenu_SetSelectedValue(phaseDropdown, phaseNum)
        UI:Refresh()
    end

    UIDropDownMenu_Initialize(phaseDropdown, function(self, level)
        for _, p in ipairs(WLLF.Phases) do
            local info = UIDropDownMenu_CreateInfo()
            local label = p.short .. " - " .. p.name
            if p.num == WLLF.CURRENT_PHASE then
                label = label .. " " .. (L["PHASE_CURRENT_TAG"] or "(aktuell)")
            end
            info.text = label
            info.value = p.num
            info.func = function(self) OnPhaseSelected(self, self.value) end
            info.checked = (WLLF.DB:GetSetting("selectedPhase") == p.num)
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    f.phaseDropdown = phaseDropdown

    -- Drop-Zone Hinweistext
    f.hint = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    f.hint:SetPoint("BOTTOM", f, "BOTTOM", 0, 38)
    f.hint:SetText(L["DRAG_ITEM_HINT"])
    f.hint:SetWidth(320)

    -- Drag&Drop-Empfang für Items (Cursor mit Item -> Klick auf Fenster)
    f:SetScript("OnMouseUp", function(self)
        local infoType, itemID, itemLink = GetCursorInfo()
        if infoType == "item" and itemLink then
            local id = WLLF:GetItemIDFromLink(itemLink)
            if id then
                if WLLF.DB:AddItem(id) then
                    local name = GetItemInfo(id) or ("Item:" .. id)
                    WLLF:Print(string.format(L["ITEM_ADDED"], name))
                    UI:Refresh()
                else
                    local name = GetItemInfo(id) or ("Item:" .. id)
                    WLLF:Print(string.format(L["ITEM_ALREADY_ON_LIST"], name))
                end
            end
            ClearCursor()
        end
    end)
    f:SetScript("OnReceiveDrag", function(self)
        self:GetScript("OnMouseUp")(self)
    end)

    -- Export/Import-Buttons
    f.exportBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.exportBtn:SetSize(90, 22)
    f.exportBtn:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 12, 8)
    f.exportBtn:SetText(L["EXPORT"])
    f.exportBtn:SetScript("OnClick", function() UI:ShowExport(WLLF.DB:Export()) end)

    f.importBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.importBtn:SetSize(90, 22)
    f.importBtn:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -12, 8)
    f.importBtn:SetText(L["IMPORT"])
    f.importBtn:SetScript("OnClick", function() UI:ShowImport() end)

    -- Scroll-Liste
    local scrollFrame = CreateFrame("ScrollFrame", "WLLFScrollFrame", f, "FauxScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -56)
    scrollFrame:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -30, 56)
    scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, ROW_HEIGHT, function() UI:Refresh() end)
    end)
    f.scrollFrame = scrollFrame

    for i = 1, VISIBLE_ROWS do
        local row = CreateFrame("Button", nil, f)
        row:SetSize(320, ROW_HEIGHT - 4)
        if i == 1 then
            row:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, 0)
        else
            row:SetPoint("TOPLEFT", rows[i - 1], "BOTTOMLEFT", 0, -4)
        end

        row.icon = row:CreateTexture(nil, "ARTWORK")
        row.icon:SetSize(28, 28)
        row.icon:SetPoint("LEFT", row, "LEFT", 0, 0)

        row.name = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        row.name:SetPoint("LEFT", row.icon, "RIGHT", 8, 0)
        row.name:SetWidth(220)
        row.name:SetJustifyH("LEFT")

        row.removeBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
        row.removeBtn:SetSize(70, 20)
        row.removeBtn:SetPoint("RIGHT", row, "RIGHT", 0, 0)
        row.removeBtn:SetText(L["REMOVE_ITEM"])

        row:SetScript("OnEnter", function(self)
            if self.itemLink then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetHyperlink(self.itemLink)
                GameTooltip:Show()
            end
        end)
        row:SetScript("OnLeave", function() GameTooltip:Hide() end)

        rows[i] = row
    end

    return f
end

function UI:Refresh()
    if not main then return end

    local items = WLLF.DB:GetItems()
    local ids = {}
    for itemID in pairs(items) do table.insert(ids, itemID) end
    table.sort(ids)

    FauxScrollFrame_Update(main.scrollFrame, #ids, VISIBLE_ROWS, ROW_HEIGHT)
    local offset = FauxScrollFrame_GetOffset(main.scrollFrame)

    for i = 1, VISIBLE_ROWS do
        local row = rows[i]
        local dataIndex = i + offset
        local itemID = ids[dataIndex]
        if itemID then
            local name, link, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
            row.itemLink = link
            row.icon:SetTexture(icon or "Interface\\Icons\\INV_Misc_QuestionMark")
            row.name:SetText(name or ("Item:" .. itemID))
            row.removeBtn:SetScript("OnClick", function()
                WLLF.DB:RemoveItem(itemID)
                UI:Refresh()
            end)
            row:Show()
        else
            row.itemLink = nil
            row:Hide()
        end
    end
end

function UI:Toggle()
    if not main then
        main = CreateMainFrame()
    end
    if main:IsShown() then
        main:Hide()
    else
        main:Show()
        if main.phaseDropdown then
            UIDropDownMenu_SetSelectedValue(main.phaseDropdown, WLLF.DB:GetSetting("selectedPhase"))
        end
        UI:Refresh()
    end
end

-- ===================== Drop-Notification =====================

local alertFrame
local alertQueue = {}
local ALERT_DURATION = 6

local function CreateAlertFrame()
    local f = CreateFrame("Frame", "WLLFAlertFrame", UIParent, "BackdropTemplate" )
    f:SetSize(280, 70)
    f:SetPoint("TOP", UIParent, "TOP", 0, -150)
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 11, top = 11, bottom = 11 },
    })
    f:Hide()

    f.icon = f:CreateTexture(nil, "ARTWORK")
    f.icon:SetSize(36, 36)
    f.icon:SetPoint("LEFT", f, "LEFT", 16, 0)

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    f.title:SetPoint("TOPLEFT", f.icon, "TOPRIGHT", 10, -2)
    f.title:SetText(L["ITEM_DROPPED"])

    f.itemName = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.itemName:SetPoint("TOPLEFT", f.title, "BOTTOMLEFT", 0, -4)
    f.itemName:SetWidth(170)
    f.itemName:SetJustifyH("LEFT")

    f.closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    f.closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", 2, 2)
    f.closeBtn:SetScript("OnClick", function() UI:HideAlert() end)

    f:SetScript("OnMouseUp", function() UI:Toggle() end)
    f:EnableMouse(true)

    return f
end

function UI:HideAlert()
    if alertFrame then
        alertFrame:Hide()
    end
    if alertFrame and alertFrame.fadeTimer then
        alertFrame.fadeTimer:Cancel()
    end
end

function UI:ShowDropAlert(itemID, itemLink, icon, name)
    if not alertFrame then
        alertFrame = CreateAlertFrame()
    end

    alertFrame.icon:SetTexture(icon or "Interface\\Icons\\INV_Misc_QuestionMark")
    alertFrame.itemName:SetText(itemLink or name or ("Item:" .. itemID))
    alertFrame:Show()

    if WLLF.DB:GetSetting("notifySound") then
        PlaySound(SOUNDKIT and SOUNDKIT.RAID_WARNING or 8959) -- Fallback: klassischer Raid-Warning-Sound
    end

    if alertFrame.fadeTimer then
        alertFrame.fadeTimer:Cancel()
    end
    alertFrame.fadeTimer = C_Timer.After(ALERT_DURATION, function()
        UIFrameFadeOut(alertFrame, 1, 1, 0)
        C_Timer.After(1, function() alertFrame:Hide(); alertFrame:SetAlpha(1) end)
    end)
end

-- ===================== Export/Import Dialoge =====================

local exportImportFrame

local function CreateExportImportFrame()
    local f = CreateFrame("Frame", "WLLFExportImportFrame", UIParent, "BasicFrameTemplateWithInset")
    f:SetSize(420, 160)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:Hide()

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    f.title:SetPoint("TOP", f, "TOP", 0, -6)

    f.hintText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.hintText:SetPoint("TOPLEFT", f, "TOPLEFT", 16, -32)
    f.hintText:SetWidth(380)
    f.hintText:SetJustifyH("LEFT")

    local editBox = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    editBox:SetSize(370, 24)
    editBox:SetPoint("TOP", f, "TOP", 0, -70)
    editBox:SetAutoFocus(false)
    editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    f.editBox = editBox

    f.actionBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.actionBtn:SetSize(100, 22)
    f.actionBtn:SetPoint("BOTTOM", f, "BOTTOM", 0, 16)
    f.actionBtn:SetText(L["IMPORT"])

    return f
end

function UI:ShowExport(str)
    if not exportImportFrame then
        exportImportFrame = CreateExportImportFrame()
    end
    local f = exportImportFrame
    f.title:SetText(L["EXPORT"])
    f.hintText:SetText(L["EXPORT_HINT"])
    f.editBox:SetText(str)
    f.editBox:HighlightText()
    f.editBox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    f.actionBtn:SetText(L["CLOSE"])
    f.actionBtn:SetScript("OnClick", function() f:Hide() end)
    f:Show()
    f.editBox:SetFocus()
end

function UI:ShowImport()
    if not exportImportFrame then
        exportImportFrame = CreateExportImportFrame()
    end
    local f = exportImportFrame
    f.title:SetText(L["IMPORT"])
    f.hintText:SetText(L["IMPORT_HINT"])
    f.editBox:SetText("")
    f.actionBtn:SetText(L["IMPORT"])
    f.actionBtn:SetScript("OnClick", function()
        local text = f.editBox:GetText()
        local count, ok = WLLF.DB:Import(text)
        if ok then
            WLLF:Print(string.format(L["IMPORT_SUCCESS"], count))
            UI:Refresh()
            f:Hide()
        else
            WLLF:Print(L["IMPORT_FAILED"])
        end
    end)
    f:Show()
    f.editBox:SetFocus()
end
