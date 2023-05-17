CreateClientConVar("FontColorR", "227", true, false, "Red color value of the font", 0, 255)
CreateClientConVar("FontColorG", "166", true, false, "Green color value of the font", 0, 255)
CreateClientConVar("FontColorB", "0", true, false, "Blue color value of the font", 0, 255)

hook.Add( "PopulateToolMenu", "MapPromptsSettings3", function()

	spawnmenu.AddToolMenuOption( "Options", "Map Prompts Settings", "MapPromptsMenu3", "Map Prompts (Font)", "", "", function( panel )
	panel:ClearControls()

	panel:CheckBox( "Use a custom font instead of the default", "MapPromptsUseCustomFont" )
	panel:TextEntry( "Custom Font", "MapPromptsCustomFont" )
	panel:Help( "Font name is case sensitive.")

	panel:ColorPicker( "Font Color", "FontColorR", "FontColorG", "FontColorB" )
	panel:NumSlider( "Font Size", "MapPromptsFontSize", 0, 999, 0 )
	panel:Button( "Refresh Font", "MapPromptsRefresh" )
end)
end)