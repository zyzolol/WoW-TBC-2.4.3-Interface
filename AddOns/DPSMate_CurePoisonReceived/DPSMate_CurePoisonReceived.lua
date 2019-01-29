-- Global Variables
DPSMate.Modules.CurePoisonReceived = {}
DPSMate.Modules.CurePoisonReceived.Hist = "Dispels"
DPSMate.Options.Options[1]["args"]["poisoncurereceived"] = {
	order = 215,
	type = 'toggle',
	name = DPSMate.L["curepoisonreceived"],
	desc = DPSMate.L["show"].." "..DPSMate.L["curepoisonreceived"]..".",
	get = function() return DPSMateSettings["windows"][DPSMate.Options.Dewdrop:GetOpenedParent().Key]["options"][1]["poisoncurereceived"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "poisoncurereceived", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("poisoncurereceived", DPSMate.Modules.CurePoisonReceived, DPSMate.L["curepoisonreceived"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.CurePoisonReceived:IsValid(ab, cast)
	if DPSMateAbility[ab][2]==DPSMate.L["poison"] or DPSMate.Parser.DePoison[cast] then
		return true
	end
	return false
end

function DPSMate.Modules.CurePoisonReceived:GetSortedTable(arr,k)
	local b, a, temp, total = {}, {}, {}, 0
	for cat, val in pairs(arr) do -- 3 Owner
		for ca, va in pairs(val) do -- 42 Ability
			if ca~="i" then
				for c, v in pairs(va) do -- 3 Target
					if DPSMate:ApplyFilter(k, DPSMate:GetUserById(c)) then
						for ce, ve in pairs(v) do -- 10 Cured Ability
							if self:IsValid(DPSMate:GetAbilityById(ce), DPSMate:GetAbilityById(ca)) then
								if temp[c] then temp[c]=temp[c]+ve else temp[c]=ve end
							end
						end
					end
				end
			end
		end
	end
	for cat, val in pairs(temp) do
		local i = 1
		while true do
			if (not b[i]) then
				tinsert(b, i, val)
				tinsert(a, i, cat)
				break
			else
				if b[i] < val then
					tinsert(b, i, val)
					tinsert(a, i, cat)
					break
				end
			end
			i=i+1
		end
		total = total + val
	end
	return b, total, a
end

function DPSMate.Modules.CurePoisonReceived:EvalTable(user, k)
	local a, b, temp, total = {}, {}, {}, 0
	local arr = DPSMate:GetMode(k)
	for cat, val in pairs(arr) do -- 3 Owner
		temp[cat] = {
			[1] = 0,
			[2] = {},
			[3] = {},
		}
		for ca, va in pairs(val) do -- 42 Ability
			if ca~="i" then
				for c, v in pairs(va) do -- 3 Target
					if c==user[1] then
						for ce, ve in pairs(v) do -- 10 Cured Ability
							if self:IsValid(DPSMate:GetAbilityById(ce), DPSMate:GetAbilityById(ca)) then
								temp[cat][1]=temp[cat][1]+ve
								local i = 1
								while true do
									if (not temp[cat][3][i]) then
										tinsert(temp[cat][3], i, ve)
										tinsert(temp[cat][2], i, ce)
										break
									else
										if temp[cat][3][i] < ve then
											tinsert(temp[cat][3], i, ve)
											tinsert(temp[cat][2], i, ce)
											break
										end
									end
									i=i+1
								end
							end
						end
						break
					end
				end
			end
		end
	end
	for cat, val in pairs(temp) do
		if val[1]>0 then
			local i = 1
			while true do
				if (not b[i]) then
					tinsert(b, i, val)
					tinsert(a, i, cat)
					break
				else
					if b[i][1] < val[1] then
						tinsert(b, i, val)
						tinsert(a, i, cat)
						break
					end
				end
				i=i+1
			end
			total = total + val[1]
		end
	end
	return a, total, b
end

function DPSMate.Modules.CurePoisonReceived:GetSettingValues(arr, cbt, k)
	local pt = ""

	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}

	if DPSMateSettings["windows"][k]["numberformat"] == 2 or DPSMateSettings["windows"][k]["numberformat"] == 4 then p = "K"; pt="K" end
	sortedTable, total, a = DPSMate.Modules.CurePoisonReceived:GetSortedTable(arr,k)
	for cat, val in pairs(sortedTable) do
		local dmg, tot, sort = val, total, sortedTable[1]
		if dmg==0 then break end; if tot<=10000 then pt="" end
		local str = {[1]="",[2]="",[3]=""}
		if DPSMateSettings["columnspoisonreceived"][1] then str[1] = " "..DPSMate:Commas(dmg, k)..p; strt[2] = " "..DPSMate:Commas(tot, k)..pt end
		if DPSMateSettings["columnspoisonreceived"][2] then str[3] = " ("..strformat("%.1f", 100*dmg/tot).."%)" end
		tinsert(name, DPSMate:GetUserById(a[cat]))
		tinsert(value, str[1]..str[3])
		tinsert(perc, 100*(dmg/sort))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.CurePoisonReceived:ShowTooltip(user,k)
	if DPSMateSettings["informativetooltips"] then
		local a,b,c = DPSMate.Modules.CurePoisonReceived:EvalTable(DPSMateUser[user], k)
		local ab, abn, p, i = {}, {}, 1, 1
		
		while a[i] do
			p = 1
			while c[i][2][p] do
				if ab[c[i][2][p]] then
					ab[c[i][2][p]] = ab[c[i][2][p]] + c[i][3][p]
				else
					ab[c[i][2][p]] = c[i][3][p]
				end
				p = p + 1
			end
			i = i + 1
		end
		for cat, val in pairs(ab) do
			if val>0 then
				i = 1
				while true do
					if (not abn[i]) then
						tinsert(abn, i, {cat, val})
						break
					else
						if (abn[i][2] < val) then
							tinsert(abn, i, {cat, val})
							break
						end
					end
					i = i + 1
				end
			end
		end
		ab = nil
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["ttdispelled"]..DPSMate.L["ttabilities"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not abn[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetAbilityById(abn[i][1]), abn[i][2].." ("..strformat("%.2f", 100*abn[i][2]/b).."%)", 1,1,1,1,1,1)
		end
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["ttdispelled"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not a[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetUserById(a[i]),c[i][1].." ("..strformat("%.2f", 100*c[i][1]/b).."%)",1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.CurePoisonReceived:OpenDetails(obj, key, bool)
	if bool then
		DPSMate.Modules.DetailsCurePoisonReceived:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsCurePoisonReceived:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.CurePoisonReceived:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsCurePoisonTotal:UpdateDetails(obj, key)
end

