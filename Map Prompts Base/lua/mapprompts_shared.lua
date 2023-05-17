// This file exists for the sole purpose of adding in the default font, "ZektonRG"
// I like it, so I'm forcing all of you to use it aswell
// ;)

if SERVER then
	resource.AddFile( "resource/fonts/zektonrg.ttf" )
	return
end

surface.CreateFont( "MapPromptsCustom", {
	font = "Zekton Rg",
	size = GetConVar("MapPromptsFontSize"):GetInt(),
	weight = 500,
	shadow = true,
})

surface.CreateFont( "PlayerCustomFont", {
	font = GetConVar("MapPromptsCustomFont"):GetString(),
	size = GetConVar("MapPromptsFontSize"):GetInt(),
	weight = 500,
	shadow = true,
})

concommand.Add( "MapPromptsRefresh", function()

surface.CreateFont( "MapPromptsCustom", {
	font = "Zekton Rg",
	size = GetConVar("MapPromptsFontSize"):GetInt(),
	weight = 500,
	shadow = true,
})

surface.CreateFont( "PlayerCustomFont", {
	font = GetConVar("MapPromptsCustomFont"):GetString(),
	size = GetConVar("MapPromptsFontSize"):GetInt(),
	weight = 500,
	shadow = true,
})

end)