local L = AceLibrary("AceLocale-2.2"):new("Quartz")
L:RegisterTranslations("enUS", function()
	return {
		["Quartz"] = true,
		["Latency"] = true,
		["Tradeskill Merge"] = true,
		["Global Cooldown"] = true,
		["Buff"] = true,
		["Target"] = true,
		["Pet"] = true,
		["Focus"] = true,
		["Player"] = true,
		["Mirror"] = true,
		["Timer"] = true,
		["Swing"] = true,
		["Interrupt"] = true,
		["Range"] = true,
		["Flight"] = true,
		
		["GCD"] = true,
		["Tradeskill"] = true,
		
		-- Basic shared stuff
		["Above"] = true,
		["Alpha"] = true,
		["Background"] = true,
		["Below"] = true,
		["Border"] = true,
		["Bottom"] = true,
		["Bottom Left"] = true,
		["Bottom Right"] = true,
		["Center"] = true,
		["Colors"] = true,
		["Default"] = true,
		["Down"] = true,
		["Enable"] = true,
		["Font"] = true,
		["Font Size"] = true,
		["Free"] = true,
		["Full Text"] = true,
		["Gap"] = true,
		["Height"] = true,
		["Horizontal"] = true,
		["Left"] = true,
		["Left (grow down)"] = true,
		["Left (grow up)"] = true,
		["None"] = true,
		["Number"] = true,
		["Outside"] = true,
		["Right"] = true,
		["Right (grow down)"] = true,
		["Right (grow up)"] = true,
		["Scale"] = true,
		["Spacing"] = true,
		["Texture"] = true,
		["Text Color"] = true,
		["Top"] = true,
		["Top Left"] = true,
		["Top Right"] = true,
		["Up"] = true,
		["Vertical"] = true,
		["X"] = true,
		["Y"] = true,
		["Width"] = true,
		
		-- Option Names
		
		["Lock"] = true,
		["Hide Icon"] = true,
		["Icon Alpha"] = true,
		["Icon Gap"] = true,
		["Name Text Position"] = true,
		["Name Text Font Size"] = true,
		["Spell Rank"] = true,
		["Spell Rank Style"] = true,
		["Hide Name Text"] = true,
		["Hide Time Text"] = true,
		["Hide Cast Time"] = true,
		["Cast Time Precision"] = true,
		["Time Font Size"] = true,
		["Time Text Position"] = true,
		["Spell Text"] = true,
		["Time Text"] = true,
		["Casting"] = true,
		["Channeling"] = true,
		["Complete"] = true,
		["Failed"] = true,
		["Spark Color"] = true,
		["Background Alpha"] = true,
		["Border Alpha"] = true,
		["Disable Blizzard Cast Bar"] = true,
		["Snap to Center"] = true,
		["Icon Position"] = true,
		["Text Alignment"] = true,
		["Text Position"] = true,
		["Copy Settings From"] = true,
		["Cast Start Side"] = true,
		["Cast End Side"] = true,
		["Name Text X Offset"] = true,
		["Name Text Y Offset"] = true,
		["Time Text X Offset"] = true,
		["Time Text Y Offset"] = true,
		["Hide Samwise Icon"] = true,
		["Show for Friends"] = true,
		["Show for Enemies"] = true,
		["Show if Target"] = true,
		["Target Name"] = true,
		["Display target name of spellcasts after spell name"] = true,
		
		["Roman"] = true,
		["Roman Full Text"] = true,
			--Latency
			["Embed"] = true,
			["Embed Safety Margin"] = true,
			["Bar Color"] = true,
			["Show Text"] = true,
			--GCD
			["Primary"] = true,
			["Backup"] = true,
			["%s Spell"] = true,
			["Bar Position"] = true,
			["Deplete"] = true,
			--Buffs
			["Focus"] = true,
			["Target"] = true,
			["Enable %s"] = true,
			["Enable Buffs"] = true,
			["Enable Debuffs"] = true,
			["Position"] = true,
			["Offset"] = true,
			["Show Icons"] = true,
			["Buff Bar Width"] = true,
			["Buff Bar Height"] = true,
			["Buff Name Text"] = true,
			["Buff Time Text"] = true,
			["Buff Color"] = true,
			["Debuff Color"] = true,
			["Debuffs by Type"] = true,
			["Undispellable Color"] = true,
			["Curse Color"] = true,
			["Disease Color"] = true,
			["Magic Color"] = true,
			["Poison Color"] = true,
			["Anchor Frame"] = true,
			["Grow Direction"] = true,
			["Sort by Remaining Time"] = true,
			--Mirror
			["Mirror Bar Width"] = true,
			["Mirror Bar Height"] = true,
			["Mirror Name Text"] = true,
			["Mirror Time Text"] = true,
			["Hide Blizz Mirror Bars"] = true,
			["%s Color"] = true,
			["Breath"] = true,
			["Exhaustion"] = true,
			["Feign Death"] = true,
			["Show Mirror"] = true,
			["Show Static"] = true,
			["Show PvP"] = true,
			--Timer
			["Stop Timer"] = true,
			["Make Timer"] = true,
			["New Timer Name"] = true,
			["New Timer Length"] = true,
			--Swing
			["Duration Text"] = true,
			["Remaining Text"] = true,
			--Interrupt
			["Interrupt Color"] = true,
			--Range
			["Out of Range Color"] = true,
			--Flight
			["Flight Map Color"] = true,
			
		-- Option descriptions
		
		["Toggle Cast Bar lock"] = true,
		["Hide Spell Cast Icon"] = true,
		["Set the Spell Cast icon alpha"] = true,
		["Set where the Spell Cast icon appears"] = true,
		["Space between the cast bar and the icon."] = true,
		["Set the Cast Bar Texture"] = true,
		["Set the font used in the Name and Time texts"] = true,
		["Set the alignment of the spell name text"] = true,
		["Set the size of the spell name text"] = true,
		["Disable the text that displays the time remaining on your cast"] = true,
		["Disable the text that displays the total cast time"] = true,
		["Set the precision (i.e. number of decimal places) for the cast time text"] = true,
		["Disable the text that displays the spell name/rank"] = true,
		["Display the rank of spellcasts alongside their name"] = true,
		["Set the display style of the spell rank"] = true,
		["Set the size of the time text"] = true,
		["Set the alignment of the time text"] = true,
		["Set the border style"] = true,
		["Set the color of the %s"] = true,
		["Set the color of the cast bar when %s"] = true,
		["Set the color of the casting bar spark"] = true,
		["Set the color of the casting bar background"] = true,
		["Set the alpha of the casting bar background"] = true,
		["Set the color of the casting bar border"] = true,
		["Set the alpha of the casting bar border"] = true,
		["Disable and hide the default UI's casting bar"] = true,
		["Move the CastBar to center of the screen along the specified axis"] = true,
		["Select a bar from which to copy settings"] = true,
		["Adjust the X position of the name text"] = true,
		["Adjust the Y position of the name text"] = true,
		["Adjust the X position of the time text"] = true,
		["Adjust the Y position of the time text"] = true,
		["Hide the icon for spells with no icon"] = true,
		["Show this castbar for friendly units"] = true,
		["Show this castbar for hostile units"] = true,
		["Show this castbar if focus is also target"] = true,
		["Set an exact X value for this bar's position."] = true,
		["Set an exact Y value for this bar's position."] = true,
		
			--Latency
			["Include Latency time in the displayed cast bar."] = true,
			["Embed mode will decrease it's lag estimates by this amount.  Ideally, set it to the difference between your highest and lowest ping amounts.  (ie, if your ping varies from 200ms to 400ms, set it to 0.2)"] = true,
			["Latency Bar"] = true,
			["Set the alpha of the latency bar"] = true,
			["Display the latency time as a number on the latency bar"] = true,
			["Set the font used for the latency text"] = true,
			["Set the size of the latency text"] = true,
			["Set the color of the latency text"] = true,
			["Set the position of the latency text"] = true,
			["Set the vertical position of the latency text"] = true,
			--GCD
			["%s spell to check for the Global Cooldown"] = true,
			["Set the color of the GCD bar spark"] = true,
			["Set the height of the GCD bar"] = true,
			["Set the alpha of the GCD bar"] = true,
			["Set the position of the GCD bar"] = true,
			["Tweak the distance of the GCD bar from the cast bar"] = true,
			["Reverses the direction of the GCD spark, causing it to move right-to-left"] = true,
			--Buffs
			["Show buffs/debuffs for your %s"] = true,
			["Show buffs for your %s"] = true,
			["Show debuffs for your %s"] = true,
			["Position the bars for your %s"] = true,
			["Tweak the vertical position of the bars for your %s"] = true,
			["Tweak the space between bars for your %s"] = true,
			["Tweak the horizontal position of the bars for your %s"] = true,
			["Show icons on buffs and debuffs for your %s"] = true,
			["Set the side of the buff bar that the icon appears on"] = true,
			["Set the buff bar Texture"] = true,
			["Set the width of the buff bars"] = true,
			["Set the height of the buff bars"] = true,
			["Display the names of buffs/debuffs on their bars"] = true,
			["Display the time remaining on buffs/debuffs on their bars"] = true,
			["Set the font used in the buff bars"] = true,
			["Set the font size for the buff bars"] = true,
			["Set the alpha of the buff bars"] = true,
			["Set the color of the bars for buffs"] = true,
			["Set the color of the bars for debuffs"] = true,
			["Set the color of the text for the buff bars"] = true,
			["Color debuff bars according to their dispel type"] = true,
			["Set the color of the bars for undispellable debuffs"] = true,
			["Set the color of the bars for curses"] = true,
			["Set the color of the bars for diseases"] = true,
			["Set the color of the bars for magic"] = true,
			["Set the color of the bars for poisons"] = true,
			["Select where to anchor the %s bars"] = true,
			["Toggle %s bar lock"] = true,
			["Set the grow direction of the %s bars"] = true,
			["Sort the buffs and debuffs by time remaining.  If unchecked, they will be sorted alphabetically."] = true,
			--Mirror
			["Position the mirror bars"] = true,
			["Tweak the vertical position of the mirror bars"] = true,
			["Tweak the space between mirror bars"] = true,
			["Tweak the horizontal position of the mirror bars"] = true,
			["Show icons on mirror bars"] = true,
			["Set the side of the mirror bar that the icon appears on"] = true,
			["Set the mirror bar Texture"] = true,
			["Set the width of the mirror bars"] = true,
			["Set the height of the mirror bars"] = true,
			["Display the names of Mirror Bar Types on their bars"] = true,
			["Display the time remaining on mirror bars"] = true,
			["Set the font used in the mirror bars"] = true,
			["Set the color of the text for the mirror bars"] = true,
			["Set the font size for the mirror bars"] = true,
			["Set the alpha of the mirror bars"] = true,
			["Hide Blizzard's mirror bars"] = true,
			["Set the color of the bars for %s"] = true,
			["Show mirror bars such as breath and feign death"] = true,
			["Show bars for static popup items such as rez and summon timers"] = true,
			["Show bar for start of arena and battleground games"] = true,
			["Select where to anchor the mirror bars"] = true,
			["Toggle mirror bar lock"] = true,
			["Set the grow direction of the mirror bars"] = true,
			--Timer
			["Make a new timer using the above settings.  NOTE: it may be easier for you to simply use the command line to make timers, /qt"] = true,
			["Select a timer to stop"] = true,
			["Set a name for the new timer"] = true,
			["Length of the new timer, in seconds"] = true,
			--Swing
			["Set the color of the swing timer bar"] = true,
			["Set the height of the swing timer bar"] = true,
			["Set the alpha of the swing timer bar"] = true,
			["Set the position of the swing timer bar"] = true,
			["Tweak the distance of the swing timer bar from the cast bar"] = true,
			["Toggle display of text showing your total swing time"] = true,
			["Toggle display of text showing the time remaining until you can swing again"] = true,
			--Interrupt
			["Set the color the cast bar is changed to when you have a spell interrupted"] = true,
			--Range
			["Set the color to turn the cast bar when the target is out of range"] = true,
			--Flight
			["Set the color to turn the cast bar when taking a flight path"] = true,
			
		-- Other crap
		["Rank (%d+)"] = true,
		["Rank %s"] = true,
			--Latency
			["%dms"] = true,
			--GCD
			["<Spell Name>"] = true,
			["Invalid Spell"] = true,
			["Spell_Warning"] = "|cffff3333Warning: You have no spell chosen for Quartz's Global Cooldown module.  Please enter a spell name in the menu (/quartz, then click Global Cooldown). Note, it is recommended to use a spell that cannot have a cooldown other than the global cooldown and cannot be interrupted, such as Find Herbs",
			--Buffs
			["%dm"] = true,
			--Mirror
			["Logout"] = true,
			["Release"] = true,
			["Logout"] = true,
			["Forfeit Duel"] = true,
			["Instance Boot"] = true,
			["Summon"] = true,
			["AOE Rez"] = true,
			["Quit"] = true,
			["Resurrect"] = true,
			["Party Invite"] = true,
			["Resurrect Timer"] = true,
			["Duel Request"] = true,
			["Game Start"] = true,
			["1 minute"] = true,
			["One minute until"] = true,
			["30 seconds"] = true,
			["Thirty seconds until"] = true,
			["15 seconds"] = true,
			["Fifteen seconds until"] = true,
			--Timer
			['Usage: /quartztimer timername 60 or /quartztimer 60 timername'] = true,
			["Timers module currently disabled, re-enable it in the menu"] = true,
			["<Time in seconds>"] = true,
			--Swing
			--Interrupt
			["INTERRUPTED (%s)"] = true,
			--Range
			--Flight
			--FeatureFrame
			["Modular casting bar"] = true,
	}
end)
