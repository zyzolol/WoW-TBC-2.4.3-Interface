-- AtlasLoot loot tables deDE locale file
-- NOTE: THIS FILE IS AUTO-GENERATED BY A TOOL, ANY MANUALLY CHANGE MIGHT BE OVERWRITTEN.
-- $Id: rep.de.lua 78855 2008-07-21 14:54:54Z kurax $

if GetLocale() == "deDE" then
local Process = function(category,check,data) if not AtlasLoot_Data["AtlasLootRepItems"][category] or #AtlasLoot_Data["AtlasLootRepItems"][category] ~= check then return end for i = 1,#data do if(data[i] and data[i]~="") then AtlasLoot_Data["AtlasLootRepItems"][category][i][3] = data[i] end end data = nil end

end