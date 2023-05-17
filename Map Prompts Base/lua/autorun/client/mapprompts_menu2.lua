hook.Add( "PopulateToolMenu", "MapPromptsSettings2", function()

	spawnmenu.AddToolMenuOption( "Options", "Map Prompts Settings", "MapPromptsMenu2", "Map Prompts (Sliders)", "", "", function( panel )
	panel:ClearControls()

	panel:NumSlider( "Spawn title delay", "MapPromptsIntroDelay", 0, 30, 0 )
	panel:Help( "Delay until the spawn prompt begins to fades" )
	panel:NumSlider( "Location title delay", "MapPromptsLocationDelay", 0, 30, 0 )
	panel:Help( "Delay until location prompts begin to fades" )

	panel:NumSlider( "Text speed", "MapPromptsTextFadeSpeed", 1, 30, 0 )
	panel:Help( "Speed at which the text fades in and out. \n- 1 Default\n- 2 Double speed\n- 3 Triple speed\n Etc.")

	panel:NumSlider( "Text alingment", "MapPromptsTextAlignment", 0, 4, 0 )
	panel:Help( "Alignment of the text:\n- 0 Left\n- 1 Center\n- 2 Right\n- 3 Top\n- 4 Bottom" )

	panel:NumSlider( "Text horizontal position", "MapPromptsTextXPos", 0, 1, 2 )
	panel:NumSlider( "Text vertical position", "MapPromptsTextYPos", 0, 1, 2 )
	panel:Help( "Proposed positions based on text alignment:\n- Left = 0.1 Horizontal, 0.1-0.7 Vertical\n- Center = 0.5 Horizontal, 0.1-0.9 Vertical\n- Right = 0.9 Horizontal, 0.0-0.9 Vertical" )

	panel:NumSlider( "Mission Name Position", "MapPromptsMissionNameOffset", 0, 3, 0 )
	panel:Help( "The 'Mission Name' at the top" )
	panel:NumSlider( "Map Name Offset", "MapPromptsMapNameOffset", 0, 3, 0 )
	panel:Help( "The map name, second from top" )
	panel:NumSlider( "Player Name Position", "MapPromptsPlayerNameOffset", 0, 3, 0 )
	panel:Help( "The players name, second from bottom" )
	panel:NumSlider( "Timestamp Position", "MapPromptsTimeStampOffset", 0, 3, 0 )
	panel:Help( "The timestamp at the bottom" )
	panel:Help( " 0 = Top\n 1 = Second from top\n 2 = Third from top\n 3 = Bottom" )

	panel:NumSlider( "Mission Name Vertical Offset", "MapPromptsMissionNameOffsetCust", 0, 999, 2 )
	panel:NumSlider( "Map Name Vertical Offset", "MapPromptsMapNameOffsetCust", 0, 999, 2 )
	panel:NumSlider( "Player Name Vertical Offset", "MapPromptsPlayerNameOffsetCust", 0, 999, 2 )
	panel:NumSlider( "Timestamp Vertical Offset", "MapPromptsTimeStampOffsetCust", 0, 999, 2 )
	panel:Help( "Adjust the position of each line to avoid overlapping with bigger font size" )
end)
end)