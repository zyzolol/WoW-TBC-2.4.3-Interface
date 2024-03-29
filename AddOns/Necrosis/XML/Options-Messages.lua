--[[
    Necrosis LdC
    Copyright (C) 2005-2006  Lom Enfroy

    This file is part of Necrosis LdC.

    Necrosis LdC is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Necrosis LdC is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Necrosis LdC; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
--]]


------------------------------------------------------------------------------------------------------
-- Necrosis LdC
-- Par Lomig, Liadora et Nyx (Kael'Thas et Elune)
--
-- Skins et voix Françaises : Eliah, Ner'zhul
--
-- Version Allemande par Geschan
-- Version Espagnole par DosS (Zul’jin)
--
-- $LastChangedDate: 2007-01-26 20:37:37 +0100 (ven., 26 janv. 2007) $
------------------------------------------------------------------------------------------------------

-- On définit G comme étant le tableau contenant toutes les frames existantes.
local _G = getfenv(0)


------------------------------------------------------------------------------------------------------
-- CREATION DE LA FRAME DES OPTIONS
------------------------------------------------------------------------------------------------------

function Necrosis:SetMessagesConfig()

	local frame = _G["NecrosisMessagesConfig"]
	if not frame then
		-- Création de la fenêtre
		frame = CreateFrame("Frame", "NecrosisMessagesConfig", NecrosisGeneralFrame)
		frame:SetFrameStrata("DIALOG")
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetWidth(350)
		frame:SetHeight(452)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("BOTTOMLEFT")

		-- Choix de la langue
		frame = CreateFrame("Frame", "NecrosisLanguageSelection", NecrosisMessagesConfig, "UIDropDownMenuTemplate")
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("RIGHT", NecrosisMessagesConfig, "BOTTOMRIGHT", 0, 420)

		local FontString = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 25, 423)
		FontString:SetTextColor(1, 1, 1)
		FontString:SetText("Langue / Language / Sprache")

		UIDropDownMenu_SetWidth(125, frame)

		-- Activer les bulles d'aide
		frame = CreateFrame("CheckButton", "NecrosisShowTooltip", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 25, 395)

		frame:SetScript("OnClick", function() NecrosisConfig.NecrosisToolTip = this:GetChecked() end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)

		-- Déplacer les messages dans la zone système
		frame = CreateFrame("CheckButton", "NecrosisChatType", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 25, 370)

		frame:SetScript("OnClick", function()
			NecrosisConfig.ChatType = not this:GetChecked()
			Necrosis:Msg(Necrosis.Config.Messages.Position)
		end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)

		-- Activer les messages de TP et de Rez
		frame = CreateFrame("CheckButton", "NecrosisSpeech", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 25, 330)

		frame:SetScript("OnClick", function()
			NecrosisConfig.ChatMsg = this:GetChecked()
			if not NecrosisConfig.ChatMsg then
				NecrosisShortMessages:Disable()
				NecrosisDemonMessages:Disable()
				NecrosisSteedMessages:Disable()
			else
				NecrosisShortMessages:Enable()
				NecrosisDemonMessages:Enable()
				NecrosisSteedMessages:Enable()
			end
		end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)

		-- Activer les messages courts
		frame = CreateFrame("CheckButton", "NecrosisShortMessages", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 50, 305)

		frame:SetScript("OnClick", function()
			NecrosisConfig.SM = this:GetChecked()
			if NecrosisConfig.SM then
				Necrosis.Speech.Rez = Necrosis.Speech.ShortMessage[1]
				Necrosis.Speech.TP = Necrosis.Speech.ShortMessage[2]
				NecrosisDemonMessages:Disable()
				NecrosisSteedMessages:Disable()
			else
				self:Localization()
				NecrosisDemonMessages:Enable()
				NecrosisSteedMessages:Enable()
			end
		end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)
		frame:SetDisabledTextColor(0.75, 0.75, 0.75)

		-- Activer les messages des démons
		frame = CreateFrame("CheckButton", "NecrosisDemonMessages", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 50, 280)

		frame:SetScript("OnClick", function() NecrosisConfig.DemonSummon = this:GetChecked() end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)
		frame:SetDisabledTextColor(0.75, 0.75, 0.75)

		-- Activer les messages des montures
		frame = CreateFrame("CheckButton", "NecrosisSteedMessages", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 50, 255)

		frame:SetScript("OnClick", function() NecrosisConfig.SteedSummon = this:GetChecked() end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)
		frame:SetDisabledTextColor(0.75, 0.75, 0.75)

		-- Alertes sonores
		frame = CreateFrame("CheckButton", "NecrosisSound", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 25, 215)

		frame:SetScript("OnClick", function()
			NecrosisConfig.Sound = this:GetChecked()
		end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)

		-- Aertes Antifear
		frame = CreateFrame("CheckButton", "NecrosisFear", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 25, 190)

		frame:SetScript("OnClick", function() NecrosisConfig.AntiFearAlert = this:GetChecked() end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)

		-- Alertes Elementaire / Démon
		frame = CreateFrame("CheckButton", "NecrosisBanish", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 25, 165)

		frame:SetScript("OnClick", function() NecrosisConfig.Banish = this:GetChecked() end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)

		-- Alertes transes
		frame = CreateFrame("CheckButton", "NecrosisTrance", NecrosisMessagesConfig, "UICheckButtonTemplate")
		frame:EnableMouse(true)
		frame:SetWidth(24)
		frame:SetHeight(24)
		frame:Show()
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", NecrosisMessagesConfig, "BOTTOMLEFT", 25, 140)

		frame:SetScript("OnClick", function() NecrosisConfig.ShadowTranceAlert = this:GetChecked() end)

		FontString = frame:CreateFontString(nil, nil, "GameFontNormalSmall")
		FontString:Show()
		FontString:ClearAllPoints()
		FontString:SetPoint("LEFT", frame, "RIGHT", 5, 1)
		frame:SetFontString(FontString)
		frame:SetTextColor(1, 1, 1)

	end

	UIDropDownMenu_Initialize(NecrosisLanguageSelection, Necrosis.Language_Init)

	local locales = {"frFR", "enUS", "deDE", "zhTW", "zhCN", "esES"}
	local langues = {"Français", "English", "Deutsch", "zhTW", "zhCN", "Español"}
	for i in ipairs(locales) do
		if locales[i] == NecrosisConfig.Language then
			UIDropDownMenu_SetSelectedID(NecrosisLanguageSelection, i)
			UIDropDownMenu_SetText(langues[i], NecrosisLanguageSelection)
			break
		end
	end

	NecrosisShowTooltip:SetChecked(NecrosisConfig.NecrosisToolTip)
	NecrosisChatType:SetChecked(not NecrosisConfig.ChatType)
	NecrosisSpeech:SetChecked(NecrosisConfig.ChatMsg)
	NecrosisShortMessages:SetChecked(NecrosisConfig.SM)
	NecrosisDemonMessages:SetChecked(NecrosisConfig.DemonSummon)
	NecrosisSteedMessages:SetChecked(NecrosisConfig.SteedSummon)
	NecrosisSound:SetChecked(NecrosisConfig.Sound)
	NecrosisFear:SetChecked(NecrosisConfig.AntiFearAlert)
	NecrosisBanish:SetChecked(NecrosisConfig.Banish)
	NecrosisTrance:SetChecked(NecrosisConfig.ShadowTranceAlert)


	NecrosisShowTooltip:SetText(self.Config.Messages["Afficher les bulles d'aide"])
	NecrosisChatType:SetText(self.Config.Messages["Afficher les messages dans la zone systeme"])
	NecrosisSpeech:SetText(self.Config.Messages["Activer les messages aleatoires de TP et de Rez"])
	NecrosisShortMessages:SetText(self.Config.Messages["Utiliser des messages courts"])
	NecrosisDemonMessages:SetText(self.Config.Messages["Activer egalement les messages pour les Demons"])
	NecrosisSteedMessages:SetText(self.Config.Messages["Activer egalement les messages pour les Montures"])
	NecrosisSound:SetText(self.Config.Messages["Activer les sons"])
	NecrosisFear:SetText(self.Config.Messages["Alerter quand la cible est insensible a la peur"])
	NecrosisBanish:SetText(self.Config.Messages["Alerter quand la cible peut etre banie ou asservie"])
	NecrosisTrance:SetText(self.Config.Messages["M'alerter quand j'entre en Transe"])


	if not NecrosisConfig.ChatMsg then
		NecrosisShortMessages:Disable()
		NecrosisDemonMessages:Disable()
		NecrosisSteedMessages:Disable()
	elseif NecrosisConfig.SM then
		NecrosisShortMessages:Enable()
		NecrosisDemonMessages:Disable()
		NecrosisSteedMessages:Disable()
	else
		NecrosisShortMessages:Enable()
		NecrosisDemonMessages:Enable()
		NecrosisSteedMessages:Enable()
	end

	frame:Show()

end


------------------------------------------------------------------------------------------------------
-- FONCTIONS NECESSAIRES AUX DROPDOWNS
------------------------------------------------------------------------------------------------------

-- Fonctions du Dropdown des timers
function Necrosis.Language_Init()
	local element = {}
	local langues = {"Français", "English", "Deutsch", "zhTW", "zhCN", "Español"}

	for i in ipairs(langues) do
		element.text = langues[i]
		element.checked = false
		element.func = Necrosis.Language_Click
		UIDropDownMenu_AddButton(element)
	end
end

function Necrosis.Language_Click()
	local ID = this:GetID()

	UIDropDownMenu_SetSelectedID(NecrosisLanguageSelection, ID)
	if ID == 1 then
		NecrosisConfig.Language = "frFR"
		Necrosis:Localization_Dialog_Fr()
	elseif ID == 2 then
		NecrosisConfig.Language = "enUS"
		Necrosis:Localization_Dialog_En()
	elseif ID == 3 then
		NecrosisConfig.Language = "deDE"
		Necrosis:Localization_Dialog_De()
	elseif ID == 4 then
		NecrosisConfig.Language = "zhTW"
		Necrosis:Localization_Dialog_Tw()
	elseif ID == 5 then
		NecrosisConfig.Language = "zhCN"
		Necrosis:Localization_Dialog_Cn()
	else
		NecrosisConfig.Language = "esES"
		Necrosis:Localization_Dialog_Es()
	end
	Necrosis:Localization()
	Necrosis:SetMessagesConfig()
end
