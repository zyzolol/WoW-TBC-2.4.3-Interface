-- AtlasLoot loot tables zhTW locale file
-- NOTE: THIS FILE IS AUTO-GENERATED BY A TOOL, ANY MANUALLY CHANGE MIGHT BE OVERWRITTEN.
-- $Id: crafting.tw.lua 78853 2008-07-21 14:51:54Z kurax $

if GetLocale() == "zhTW" then
local Process = function(category,check,data) if not AtlasLoot_Data["AtlasLootCrafting"][category] or #AtlasLoot_Data["AtlasLootCrafting"][category] ~= check then return end for i = 1,#data do if(data[i] and data[i]~="") then AtlasLoot_Data["AtlasLootCrafting"][category][i][3] = data[i] end end data = nil end

end