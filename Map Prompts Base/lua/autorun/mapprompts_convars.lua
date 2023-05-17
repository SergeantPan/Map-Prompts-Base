// Menu 1 Toggles

CreateConVar( "MapPromptsEnabled", "1", 128, "Enable/Disable the addon in its entirety." )
CreateConVar( "MapPromptsFallbackEnabled", "1", 128, "Enable/Disable the fallback system for unsupported maps." )

CreateConVar( "MapPromptsFirstSpawn", "1", 128, "Should the map title appear for the first spawn." )
CreateConVar( "MapPromptsAlwaysOnSpawn", "1", 128, "Should the map title appear for every spawn." )

CreateConVar( "MapPromptsEnableMissionName", "1", 128, "Enable the 'Mission name' text." )
if !ConVarExists("MapPromptsCustomMissionName") then
   CreateConVar("MapPromptsCustomMissionName", "", 128, "Replace the 'Mission name' text with custom text." )
end
CreateConVar( "MapPromptsCampaignTitles", "0", 128, "Use the chapter titles instead of random ones. For campaigns with chapter names." )

CreateConVar( "MapPromptsEnableMapName", "1", 128, "Enable the map name in the text." )
CreateConVar( "MapPromptsUniqueMapNames", "1", 128, "Use unique map names, rather than the map-file name. Defaults to the latter if the map is not supported." )
if !ConVarExists("MapPromptsCustomMapName") then
   CreateConVar("MapPromptsCustomMapName", "", 128, "Replace the map name text with custom text." )
end

CreateConVar( "MapPromptsEnablePlayerName", "1", 128, "Enable the players name in the text." )
if !ConVarExists("MapPromptsPlayerName") then
   CreateConVar("MapPromptsPlayerName", "", 128, "Name used by the player title text. Defaults to your username." )
end

CreateConVar( "MapPromptsEnableTimeStamp", "1", 128, "Enable timestamp text." )

CreateConVar( "MapPromptsLocationPersistence", "0", 128, "Should the location prompt persist if you stay in the area." )
CreateConVar( "MapPromptsCustomLocationPrompts", "1", 128, "Enable custom location prompts." )

CreateConVar( "MapPromptsTimeStamp12h", "0", 128, "Change from the military-style 24h clock to 12h clock." )

CreateConVar( "MapPromptsTimeStampStyle", "1", 128, "Timestamp type:\n- 1 = Your system time\n- 2 = 'Fake Clock' Replicates a 24h/12h clock using a fake timer\n- 3 = StormFox2 time (So long as the addon is installed)" )

CreateConVar( "MapPromptsExperimentalScrolling", "1", 128, "Make the text scroll in/out, rather than fade." )

// Menu 2 Sliders

CreateConVar( "MapPromptsTextAlignment", "0", 128, "Alignment of the text:\n- 0 Left\n- 1 Center\n- 2 Right." )

CreateConVar( "MapPromptsTextXPos", "0.1", 128, "The horizontal position of the text. Default is 0.1, optimized for 'MapPromptsTitleAlingment 1'." )
CreateConVar( "MapPromptsTextYPos", "0.7", 128, "The vertical position of the text. Default is 0.7, optimized for 'MapPromptsTitleAlingment 1'." )

CreateConVar( "MapPromptsIntroDelay", "10", 128, "Delay until the spawn text begins to fade out (Rough amount, not precise)" )
CreateConVar( "MapPromptsLocationDelay", "10", 128, "Delay until the unique location text begins to fade out (Rough amount, not precise)" )
CreateConVar( "MapPromptsTextFadeSpeed", "1", 128, "Speed at which text fades in and out, requires map restart to take effect:\n- 1 Default speed\n- 2 Double speed\n- 3 Triple speed\n Etc." )

CreateConVar( "MapPromptsMissionNameOffset", "0", 128, "Position of the 'Mission name' text." )
CreateConVar( "MapPromptsMapNameOffset", "1", 128, "Position of the 'map name' text." )
CreateConVar( "MapPromptsPlayerNameOffset", "2", 128, "Position of the 'player name' text." )
CreateConVar( "MapPromptsTimeStampOffset", "3", 128, "Position of the timestamp text." )

CreateConVar( "MapPromptsMissionNameOffsetCust", "0.0", 128, "Vertical offset of the 'Mission name' text." )
CreateConVar( "MapPromptsMapNameOffsetCust", "0.0", 128, "Vertical offset of the 'map name' text." )
CreateConVar( "MapPromptsPlayerNameOffsetCust", "0.0", 128, "Vertical offset of the 'player name' text." )
CreateConVar( "MapPromptsTimeStampOffsetCust", "0.0", 128, "Vertical offset of the timestamp text." )

// Menu 3 Font Setting

CreateConVar( "MapPromptsUseCustomFont", "0", 128, "Use a custom font instead of the default one." )
CreateConVar( "MapPromptsCustomFont", "", 128, "The custom font to replace the default one." )

CreateConVar( "MapPromptsFontSize", "30", 128, "Size of the font." )

// MarkPosition Ease of Use

CreateConVar( "MarkPositionPrefix", "CustomSpot", 128, "The prefix to be used by the MarkPosition command." )