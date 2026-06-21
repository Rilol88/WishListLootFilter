-- UI.lua
-- Main browser window with dungeon/raid list and item grid

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

WLLF.UI = {}
local UI = WLLF.UI

local ITEM_ICON_SIZE = 36
local GRID_COLUMNS = 6
local CONTENT_ITEM_HEIGHT = 20

local mainFrame
local contentList = {}
local wishlistFrame

-- ===================== Main Browser Frame =====================

local function CreateMainFrame()
    local f = CreateFrame("Frame", "WLLFMainFrame", UIParent, "BasicFrameTemplateWithInset")
    f:SetSize(700, 600)
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
    f.title:SetText(L["ADDON_NAME"])

    -- ===== CLASS/SPEC FILTERS (TOP RIGHT) =====
    local classLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    classLabel:SetPoint("TOPRIGHT", f, "TOPRIGHT", -160, -28)
    classLabel:SetText(L["CLASS"] .. ":")

    f.classDropdown = CreateFrame("Frame", nil, f, "UIDropDownMenuTemplate")
    f.classDropdown:SetPoint("TOPRIGHT", f, "TOPRIGHT", -40, -28)
    UIDropDownMenu_SetWidth(f.classDropdown, 100)
    UIDropDownMenu_Initialize(f.classDropdown, function(self, level)
        local classes = { "WARRIOR", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "HUNTER", "DRUID", "PALADIN" }
        for _, class in ipairs(classes) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = class
            info.func = function()
                WLLF.DB:SetSetting("selectedClass", class)
                UIDropDownMenu_SetSelectedValue(self, class)
                UI:RefreshItemGrid()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    -- ===== LEFT PANEL: CONTENT TABS =====
    f.dungeonTab = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.dungeonTab:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -35)
    f.dungeonTab:SetSize(80, 22)
    f.dungeonTab:SetText(L["DUNGEONS_TAB"])
    f.dungeonTab:SetScript("OnClick", function()
        UI:ShowContentList("dungeon")
    end)

    f.raidTab = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.raidTab:SetPoint("LEFT", f.dungeonTab, "RIGHT", 5, 0)
    f.raidTab:SetSize(80, 22)
    f.raidTab:SetText(L["RAIDS_TAB"])
    f.raidTab:SetScript("OnClick", function()
        UI:ShowContentList("raid")
    end)

    -- ===== LEFT PANEL: CONTENT LIST =====
    local contentScroll = CreateFrame("ScrollFrame", "WLLFContentScroll", f, "FauxScrollFrameTemplate")
    contentScroll:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -65)
    contentScroll:SetSize(200, 500)
    contentScroll:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, CONTENT_ITEM_HEIGHT, function() UI:RefreshContentList() end)
    end)
    f.contentScroll = contentScroll

    local contentFrame = CreateFrame("Frame", nil, contentScroll)
    contentFrame:SetSize(180, 5000)
    contentScroll:SetScrollChild(contentFrame)
    f.contentFrame = contentFrame

    for i = 1, 50 do
        local btn = CreateFrame("Button", nil, contentFrame)
        btn:SetSize(180, CONTENT_ITEM_HEIGHT)
        btn:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 0, -(i-1) * CONTENT_ITEM_HEIGHT)
        btn:SetNormalFontObject("GameFontNormal")
        btn:SetHighlightFontObject("GameFontHighlight")
        btn:SetScript("OnClick", function(self)
            UI:SelectContent(self:GetText())
        end)
        contentList[i] = btn
    end

    -- ===== RIGHT PANEL: ITEM GRID =====
    local gridScroll = CreateFrame("ScrollFrame", "WLLFGridScroll", f, "FauxScrollFrameTemplate")
    gridScroll:SetPoint("TOPLEFT", f, "TOPLEFT", 225, -65)
    gridScroll:SetSize(460, 500)
    gridScroll:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, ITEM_ICON_SIZE + 8, function() UI:RefreshItemGrid() end)
    end)
    f.gridScroll = gridScroll

    local gridFrame = CreateFrame("Frame", nil, gridScroll)
    gridFrame:SetSize(430, 10000)
    gridScroll:SetScrollChild(gridFrame)
    f.gridFrame = gridFrame

    f.gridItems = {}
    for i = 1, 200 do
        local btn = CreateFrame("Button", nil, gridFrame)
        btn:SetSize(ITEM_ICON_SIZE, ITEM_ICON_SIZE)

        local col = (i - 1) % GRID_COLUMNS
        local row = math.floor((i - 1) / GRID_COLUMNS)
        btn:SetPoint("TOPLEFT", gridFrame, "TOPLEFT", 2 + col * (ITEM_ICON_SIZE + 4), -2 - row * (ITEM_ICON_SIZE + 4))

        btn:RegisterForDrag("LeftButton")
        btn:SetScript("OnDragStart", function(self)
            if self.itemID then
                self:GetParent():GetParent():GetParent():SetScript("OnUpdate", function()
                    local cursor = GetCursorInfo()
                end)
            end
        end)

        btn:SetScript("OnClick", function(self)
            if self.itemID then
                if WLLF.DB:AddItem(self.itemID) then
                    WLLF:Print(GetItemInfo(self.itemID) .. " added to wishlist.")
                else
                    WLLF:Print(GetItemInfo(self.itemID) .. " already on wishlist.")
                end
            end
        end)

        btn:SetScript("OnEnter", function(self)
            if self.itemID then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetItemByID(self.itemID)
                GameTooltip:Show()
            end
        end)
        btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

        f.gridItems[i] = btn
    end

    -- ===== BOTTOM BUTTONS =====
    f.wishlistBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.wishlistBtn:SetSize(120, 22)
    f.wishlistBtn:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 12, 12)
    f.wishlistBtn:SetText(L["SHOW_WISHLIST"])
    f.wishlistBtn:SetScript("OnClick", function() UI:ShowWishlist() end)

    f.exportBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.exportBtn:SetSize(100, 22)
    f.exportBtn:SetPoint("BOTTOM", f, "BOTTOM", -55, 12)
    f.exportBtn:SetText(L["EXPORT"])
    f.exportBtn:SetScript("OnClick", function() UI:ShowExport(WLLF.DB:Export()) end)

    f.importBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.importBtn:SetSize(100, 22)
    f.importBtn:SetPoint("BOTTOM", f, "BOTTOM", 55, 12)
    f.importBtn:SetText(L["IMPORT"])
    f.importBtn:SetScript("OnClick", function() UI:ShowImport() end)

    return f
end

function UI:Toggle()
    if not mainFrame then
        mainFrame = CreateMainFrame()
    end
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        mainFrame:Show()
        currentContentType = "dungeon"
        self:RefreshContentList()
        self:RefreshItemGrid()
    end
end

-- ===== CONTENT LIST =====

local currentContentType = "dungeon"

function UI:ShowContentList(contentType)
    currentContentType = contentType
    self:RefreshContentList()
end

function UI:RefreshContentList()
    if not mainFrame then return end

    local contents = WLLF.DungeonLoot:GetContentsByType(currentContentType)
    local scroll = mainFrame.contentScroll
    FauxScrollFrame_Update(scroll, #contents, 50, CONTENT_ITEM_HEIGHT)
    local offset = FauxScrollFrame_GetOffset(scroll)

    for i = 1, 50 do
        local btn = contentList[i]
        local idx = i + offset
        if contents[idx] then
            btn:SetText(contents[idx])
            btn.contentName = contents[idx]
            btn:SetScript("OnClick", function(self)
                UI:SelectContent(self.contentName)
            end)
            btn:Show()
        else
            btn:Hide()
        end
    end
end

function UI:SelectContent(contentName)
    WLLF.DB:SetSetting("selectedContent", contentName)
    self:RefreshItemGrid()
end

-- ===== ITEM GRID =====

function UI:RefreshItemGrid()
    local selectedContent = WLLF.DB:GetSetting("selectedContent")
    local items = {}

    if selectedContent then
        items = WLLF.DungeonLoot:GetContentItems(selectedContent)
    end

    local grid = mainFrame.gridScroll
    FauxScrollFrame_Update(grid, #items / GRID_COLUMNS + 1, 50, ITEM_ICON_SIZE + 8)
    local offset = FauxScrollFrame_GetOffset(grid)

    for i, itemID in ipairs(items) do
        local btnIdx = (offset * GRID_COLUMNS) + i
        if btnIdx <= 200 then
            local btn = mainFrame.gridItems[btnIdx]
            if btn then
                local name, link, rarity, level, minLevel, type, subType, stackCount, equipSlot, icon = GetItemInfo(itemID)
                btn.itemID = itemID
                btn.itemLink = link
                btn:SetNormalTexture(icon or "Interface\\Icons\\INV_Misc_QuestionMark")
                btn:Show()
            end
        end
    end

    for i = #items + 1, 200 do
        local btn = mainFrame.gridItems[i]
        if btn then
            btn.itemID = nil
            btn:Hide()
        end
    end
end

-- ===== WISHLIST VIEW =====

function UI:ShowWishlist()
    if not wishlistFrame then
        wishlistFrame = self:CreateWishlistFrame()
    end
    wishlistFrame:Show()
    self:RefreshWishlist()
end

function UI:CreateWishlistFrame()
    local f = CreateFrame("Frame", "WLLFWishlistFrame", UIParent, "BasicFrameTemplateWithInset")
    f:SetSize(400, 500)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:Hide()

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    f.title:SetPoint("TOP", f, "TOP", 0, -6)
    f.title:SetText(L["WISHLIST"])

    local scroll = CreateFrame("ScrollFrame", "WLLFWishlistScroll", f, "FauxScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -30)
    scroll:SetSize(360, 430)
    f.scroll = scroll

    local itemFrame = CreateFrame("Frame", nil, scroll)
    itemFrame:SetSize(360, 5000)
    scroll:SetScrollChild(itemFrame)
    f.itemFrame = itemFrame

    f.items = {}
    for i = 1, 100 do
        local row = CreateFrame("Button", nil, itemFrame)
        row:SetSize(340, 30)
        row:SetPoint("TOPLEFT", itemFrame, "TOPLEFT", 0, -(i-1) * 32)
        row:SetText("")
        row.removeBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
        row.removeBtn:SetSize(60, 20)
        row.removeBtn:SetPoint("RIGHT", row, "RIGHT", -2, 0)
        row.removeBtn:SetText(L["REMOVE_ITEM"])
        f.items[i] = row
    end

    local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", 2, 2)

    return f
end

function UI:RefreshWishlist()
    local items = WLLF.DB:GetItems()
    local itemList = {}
    for itemID in pairs(items) do
        table.insert(itemList, itemID)
    end
    table.sort(itemList)

    local scroll = wishlistFrame.scroll
    FauxScrollFrame_Update(scroll, #itemList, 100, 32)
    local offset = FauxScrollFrame_GetOffset(scroll)

    for i = 1, 100 do
        local row = wishlistFrame.items[i]
        local idx = i + offset
        if itemList[idx] then
            local itemID = itemList[idx]
            local name, link = GetItemInfo(itemID)
            row:SetText(name or ("Item:" .. itemID))
            row:SetNormalFontObject("GameFontSmall")
            row.removeBtn:SetScript("OnClick", function()
                WLLF.DB:RemoveItem(itemID)
                UI:RefreshWishlist()
            end)
            row:Show()
        else
            row:Hide()
        end
    end
end

-- ===== EXPORT/IMPORT =====

local exportImportFrame

function UI:ShowExport(str)
    if not exportImportFrame then
        exportImportFrame = self:CreateExportImportFrame()
    end
    local f = exportImportFrame
    f.title:SetText(L["EXPORT"])
    f.hintText:SetText(L["EXPORT_HINT"])
    f.editBox:SetText(str)
    f.editBox:HighlightText()
    f:Show()
end

function UI:ShowImport()
    if not exportImportFrame then
        exportImportFrame = self:CreateExportImportFrame()
    end
    local f = exportImportFrame
    f.title:SetText(L["IMPORT"])
    f.hintText:SetText(L["IMPORT_HINT"])
    f.editBox:SetText("")
    f.actionBtn:SetText(L["IMPORT"])
    f.actionBtn:SetScript("OnClick", function()
        local count, ok = WLLF.DB:Import(f.editBox:GetText())
        if ok then
            WLLF:Print(string.format(L["IMPORT_SUCCESS"], count))
            UI:RefreshWishlist()
            f:Hide()
        else
            WLLF:Print(L["IMPORT_FAILED"])
        end
    end)
    f:Show()
end

function UI:CreateExportImportFrame()
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

    local editBox = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    editBox:SetSize(370, 24)
    editBox:SetPoint("TOP", f, "TOP", 0, -70)
    editBox:SetAutoFocus(false)
    f.editBox = editBox

    f.actionBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.actionBtn:SetSize(100, 22)
    f.actionBtn:SetPoint("BOTTOM", f, "BOTTOM", 0, 16)

    return f
end

-- ===== DROP ALERT =====

local alertFrame
local ALERT_DURATION = 5

local function CreateAlertFrame()
    local f = CreateFrame("Frame", "WLLFAlertFrame", UIParent, "BackdropTemplate")
    f:SetSize(250, 60)
    f:SetPoint("TOP", UIParent, "TOP", 0, -100)
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 11, top = 11, bottom = 11 },
    })
    f:Hide()

    f.icon = f:CreateTexture(nil, "ARTWORK")
    f.icon:SetSize(32, 32)
    f.icon:SetPoint("LEFT", f, "LEFT", 12, 0)

    f.itemName = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.itemName:SetPoint("LEFT", f.icon, "RIGHT", 10, 0)
    f.itemName:SetWidth(160)

    return f
end

function UI:ShowDropAlert(itemID, itemLink, icon, name)
    if not alertFrame then
        alertFrame = CreateAlertFrame()
    end

    alertFrame.icon:SetTexture(icon or "Interface\\Icons\\INV_Misc_QuestionMark")
    alertFrame.itemName:SetText(name or ("Item:" .. itemID))
    alertFrame:Show()

    if WLLF.DB:GetSetting("notifySound") then
        PlaySound(SOUNDKIT and SOUNDKIT.RAID_WARNING or 8959)
    end

    if alertFrame.fadeTimer then
        alertFrame.fadeTimer:Cancel()
    end
    alertFrame.fadeTimer = C_Timer.After(ALERT_DURATION, function()
        UIFrameFadeOut(alertFrame, 1, 1, 0)
        C_Timer.After(1, function() alertFrame:Hide(); alertFrame:SetAlpha(1) end)
    end)
end

