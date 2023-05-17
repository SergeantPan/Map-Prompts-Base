hook.Add( "PopulateToolMenu", "MapPromptsSettings", function()

	spawnmenu.AddToolMenuOption( "Options", "Map Prompts Settings", "MapPromptsMenu", "Map Prompts (Base)", "", "", function( panel )
	panel:ClearControls()

	panel:CheckBox( "Enable the 'Map Prompts' addon", "MapPromptsEnabled" )
	panel:CheckBox( "Enable the fallback system for unsupported maps", "MapPromptsFallbackEnabled" )

	panel:CheckBox( "Map prompt only appears on first spawn", "MapPromptsFirstSpawn" )
	panel:CheckBox( "Map prompt appears on all spawns", "MapPromptsAlwaysOnSpawn" )

	panel:CheckBox( "Enable Mission Titles on the prompt", "MapPromptsEnableMissionName" )
	panel:CheckBox( "Use Campaign chapters instead of random titles (Campaigns)", "MapPromptsCampaignTitles" )
	panel:CheckBox( "Enable map names on the prompt", "MapPromptsEnableMapName" )
	panel:CheckBox( "Use unique map names when supported", "MapPromptsUniqueMapNames" )
	panel:CheckBox( "Enable player name on the map prompt", "MapPromptsEnablePlayerName" )
	panel:CheckBox( "Enable timestamp on the map prompt", "MapPromptsEnableTimeStamp" )

	panel:CheckBox( "Use 12h AM/PM clock instead of 24h", "MapPromptsTimeStamp12h" )

	panel:TextEntry( "Mission Name", "MapPromptsCustomMissionName" )
	panel:Help( "Replace the 'Mission Title' on the prompt with a custom one." )

	panel:TextEntry( "Map Name", "MapPromptsCustomMapName" )
	panel:Help( "Replace the map name on the prompt with a custom one." )

	panel:TextEntry( "Player Name", "MapPromptsPlayerName" )
	panel:Help( "Replace your username on the prompt with a custom one." )

	panel:CheckBox( "Enable custom location prompts", "MapPromptsCustomLocationPrompts" )
	panel:CheckBox( "Map prompts will persist in unique locations", "MapPromptsLocationPersistence" )

	local TimeStampOption = panel:ComboBox("Time Stamp Style", "MapPromptsTimeStampStyle" )
	TimeStampOption:SetSortItems(false)
	TimeStampOption:AddChoice( "System Time", "1" )
	TimeStampOption:AddChoice( "Fake Clock", "2" )
	TimeStampOption:AddChoice( "SF2 Time", "3" )

	panel:CheckBox( "Enable text scrolling", "MapPromptsExperimentalScrolling" )
	panel:Help( "Make the text appear as if it's being typed, rather than just a fade effect." )
end)
end)