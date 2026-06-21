-- Minimap.lua
-- Einfacher, eigenständiger Minimap-Button (keine externe Lib nötig, hält das Addon schlank).

WLLF = WLLF or {}
local WLLF = WLLF
local L = WLLF_L

WLLF.Minimap = {}
local Minimap_ = WLLF.Minimap

local button

local function UpdatePosition()
    local angle = math.rad(WLLF.DB:GetSetting("minimapAngle") or 215)
    local radius = 80
    button:SetPoint("CENTER", Minimap, "CENTER", math.cos(angle) * radius, math.sin(angle) * radius)
end

local function CreateButton()
    local btn = CreateFrame("Button", "WLLFMinimapButton", Minimap)
    btn:SetSize(31, 31)
    btn:SetFrameStrata("MEDIUM")
    btn:SetFrameLevel(8)
    btn:RegisterForClicks("LeftButtonUp")
    btn:RegisterForDrag("LeftButton")

    btn.icon = btn:CreateTexture(nil, "BACKGROUND")
    btn.icon:SetSize(20, 20)
    btn.icon:SetPoint("CENTER", 0, 0)
    btn.icon:SetTexture("Interface\\Icons\\INV_Misc_Note_01")

    btn.border = btn:CreateTexture(nil, "OVERLAY")
    btn.border:SetSize(54, 54)
    btn.border:SetPoint("TOPLEFT")
    btn.border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

    btn:SetScript("OnClick", function()
        WLLF.UI:Toggle()
    end)

    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText(L["ADDON_NAME"])
        GameTooltip:AddLine(L["WISHLIST"], 1, 1, 1)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    btn:SetScript("OnDragStart", function(self)
        self:SetScript("OnUpdate", function(self)
            local mx, my = Minimap:GetCenter()
            local px, py = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            px, py = px / scale, py / scale
            local angle = math.atan2(py - my, px - mx)
            WLLF.DB:SetSetting("minimapAngle", math.deg(angle))
            UpdatePosition()
        end)
    end)
    btn:SetScript("OnDragStop", function(self)
        self:SetScript("OnUpdate", nil)
    end)

    return btn
end

function Minimap_:Init()
    if WLLF.DB:GetSetting("minimapHide") then return end
    if not button then
        button = CreateButton()
    end
    UpdatePosition()
    button:Show()
end
