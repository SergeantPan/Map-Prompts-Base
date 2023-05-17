	local AlphaVal = 0
	local AlphaVal2 = 0

	local Addline1 = 0
	local Addline2 = 0
	local Addline3 = 0
	local Addline4 = 0
	local Addline5 = 0

	local FixedSpotMessage = ""

	local PlayerRespawn = ""

	local Delay = GetConVar("MapPromptsIntroDelay"):GetInt()
	local Delay2 = GetConVar("MapPromptsLocationDelay"):GetInt()
	local Delay3 = GetConVar("MapPromptsIntroDelay"):GetInt()
	local Delay4 = GetConVar("MapPromptsLocationDelay"):GetInt()

// Necessary variables for functionality

local ConstructMessage = {
'"A brand new world"',
'"This is only the beginning"',
'"Where it all starts"',
'"Hello, Mr Anderson"'
}

	local CSTSpawnMessage = table.Random(ConstructMessage)

// Create the messages, then pick one at random
// This method means that they remain the same throughout the session

local ConstructDarkRoomMessage = {
'"Enter Darkness"',
'"As above, so below"',
'"Into the unknown"',
'"The darkness inside"'
}

	local CSTExtraSpotMessage = table.Random(ConstructDarkRoomMessage)

	ConstructFakeClockHr = 8
	ConstructFakeClockHrAlternate = 8
	ConstructFakeClockMin = 0
	ConstructFakeClockSec = 0
	Suffix = ""

// Variables for the clock

local function Construct_FakeClock()

if ConstructFakeClockSec < 59 then
	ConstructFakeClockSec = ConstructFakeClockSec + 1
elseif ConstructFakeClockSec == 59 then
	ConstructFakeClockSec = 00
	ConstructFakeClockMin = ConstructFakeClockMin + 1
end
if ConstructFakeClockMin == 60 then
	ConstructFakeClockMin = 00
	ConstructFakeClockHr = ConstructFakeClockHr + 1
	ConstructFakeClockHrAlternate = ConstructFakeClockHrAlternate + 1
end
if ConstructFakeClockHr == 24 then
	ConstructFakeClockHr = 00
end
if ConstructFakeClockHrAlternate == 12 then
	ConstructFakeClockHrAlternate = 00
end
end

// Make sure the clock always displays double digits

	timer.Create( "ConstructClock", 1, 0, Construct_FakeClock )
// Timer that adds + 1 to the clock every second

hook.Add("HUDPaint", "gm_construct", function(ply)

// HUDPaint functionality allows for us to draw on the players HUD

if GetConVar("MapPromptsEnabled"):GetBool() and game.GetMap() == "gm_construct" then
MapPromptsSupport = "gm_construct"

// Add support for the map
// This prevents the code from retreating to the Fallback file

// Variables updated depending on what the player has chosen as settings

if GetConVar("MapPromptsCustomMissionName"):GetString() != "" then
	CSTMessage = GetConVar("MapPromptsCustomMissionName"):GetString()
	CSTSpotMessage = GetConVar("MapPromptsCustomMissionName"):GetString()
else
	CSTMessage = CSTSpawnMessage
	CSTSpotMessage = FixedSpotMessage
end

if GetConVar("MapPromptsCustomMapName"):GetString() != "" then
	CSTMessage2 = GetConVar("MapPromptsCustomMapName"):GetString()
	CSTSpotMessage2 = GetConVar("MapPromptsCustomMapName"):GetString()
elseif GetConVar("MapPromptsCustomMapName"):GetString() == "" and !GetConVar("MapPromptsUniqueMapNames"):GetBool() then
	CSTMessage2 = "Gm_Construct"
	CSTSpotMessage2 = "Gm_Construct"
else
	CSTMessage2 = "Construct"
	CSTSpotMessage2 = "Construct"
end

if GetConVar("MapPromptsUseCustomFont"):GetInt() == 1 then
	PlayerFont = "PlayerCustomFont"
else
	PlayerFont = "MapPromptsCustom"
end

// Below is an egregious amount of variables for the sake of not having to write every single function every time
// It's messy, but it also saves a bit on file size by reducing the character count

	ScrollingTitles = GetConVar("MapPromptsExperimentalScrolling"):GetBool()

	FadeSpeed = 80 * GetConVar("MapPromptsTextFadeSpeed"):GetInt()

	Alignment = GetConVar("MapPromptsTextAlignment"):GetInt()

	Width = GetConVar("MapPromptsTextXPos"):GetFloat()
	Height = GetConVar("MapPromptsTextYPos"):GetFloat()

	CustomAdd1 = GetConVar("MapPromptsMissionNameOffset"):GetInt()
	CustomAdd2 = GetConVar("MapPromptsMapNameOffset"):GetInt()
	CustomAdd3 = GetConVar("MapPromptsPlayerNameOffset"):GetInt()
	CustomAdd4 = GetConVar("MapPromptsTimeStampOffset"):GetInt()

	CustomOffset1 = GetConVar("MapPromptsMissionNameOffsetCust"):GetFloat()
	CustomOffset2 = GetConVar("MapPromptsMapNameOffsetCust"):GetFloat()
	CustomOffset3 = GetConVar("MapPromptsPlayerNameOffsetCust"):GetFloat()
	CustomOffset4 = GetConVar("MapPromptsTimeStampOffsetCust"):GetFloat()

	FirstRespawn = GetConVar("MapPromptsFirstSpawn"):GetBool()
	AlwaysSpawnMessage = GetConVar("MapPromptsAlwaysOnSpawn"):GetBool()

	PromptsEnabled = GetConVar("MapPromptsCustomLocationPrompts"):GetBool()

if ConVarExists("sf_enable_mapsupport") then
	SF2TimeStamp = StormFox2.Time.TimeToString(nil, StormFox2.Setting.GetCache("12h_display"))
end

// If the 'StormFox 2' addon is enabled, make the variable

	ConstantAreaTrigger = GetConVar("MapPromptsLocationPersistence"):GetBool()

	ply = LocalPlayer()

if GetConVar("MapPromptsPlayerName"):GetString() == "" then
	PlayerTitle = ply:Nick()
else
	PlayerTitle = GetConVar("MapPromptsPlayerName"):GetString()
end

// Display the players name, or a custom one if they have chosen one

if ConstructFakeClockSec < 10 then
	FakeClockDebug3 = ":0"
else
	FakeClockDebug3 = ":"
end
if ConstructFakeClockMin < 10 then
	FakeClockDebug2 = ":0"
else
	FakeClockDebug2 = ":"
end
if (ConstructFakeClockHr < 10 and !GetConVar("MapPromptsTimeStamp12h"):GetBool()) or (ConstructFakeClockHrAlternate < 10 and GetConVar("MapPromptsTimeStamp12h"):GetBool()) then
	FakeClockDebug1 = "0"
else
	FakeClockDebug1 = ""
end

// Format the clock so it looks like 00:00:00 all the time
// It just looks better than 0:0:0

if GetConVar("MapPromptsTimeStamp12h"):GetBool() then
	ConstructFakeClockHrVisual = ConstructFakeClockHrAlternate
	Hour = "%I"
else
	ConstructFakeClockHrVisual = ConstructFakeClockHr
	Hour = "%H"
end

// If the player uses a 12-hour clock, then switch to the appropriate form

if GetConVar("MapPromptsTimeStamp12h"):GetBool() and ConstructFakeClockHr < 12 and GetConVar("MapPromptsTimeStampStyle"):GetInt() == 2 then
	Suffix = " AM"
elseif GetConVar("MapPromptsTimeStamp12h"):GetBool() and ConstructFakeClockHr >= 12 then
	Suffix = " PM"
end
if GetConVar("MapPromptsTimeStamp12h"):GetBool() and GetConVar("MapPromptsTimeStampStyle"):GetInt() == 1  then
	Suffix = " %p"
end
if !GetConVar("MapPromptsTimeStamp12h"):GetBool() or GetConVar("MapPromptsTimeStampStyle"):GetInt() == 3 then
	Suffix = ""
end

// Change which clock we use, based on the players settings

if GetConVar("MapPromptsTimeStampStyle"):GetInt() == 1 then // Use System/OS time
	Timestamp = os.date( Hour .. ":%M:%S" .. Suffix )
elseif GetConVar("MapPromptsTimeStampStyle"):GetInt() == 2 then // Use the 'Fake Clock' made inside the code
	Timestamp = FakeClockDebug1 .. ConstructFakeClockHrVisual .. FakeClockDebug2 .. ConstructFakeClockMin .. FakeClockDebug3 .. ConstructFakeClockSec .. Suffix
elseif GetConVar("MapPromptsTimeStampStyle"):GetInt() == 3 and ConVarExists("sf_enable_mapsupport") then // Use StormFox 2's internal clock
	Timestamp = SF2TimeStamp
else // If all else fails, revert back to System/OS time
	Timestamp = os.date( Hour .. ":%M:%S" .. Suffix )
end

if ScrollingTitles then
	Alpha = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), BetaVal )
	Alpha2 = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), BetaVal2 )
else
	Alpha = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), math.Clamp(AlphaVal, 0, 255) )
	Alpha2 = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), math.Clamp(AlphaVal2, 0, 255) )
end

// Scrolling titles is a setting where the text appears if its being written
// Rather than fading in/out of opacity

	XPos = math.Round(tostring(ply:GetPos().x), 0)
	YPos = math.Round(tostring(ply:GetPos().y), 0)
	ZPos = math.Round(tostring(ply:GetPos().z), 0) + 3

// Player position, for the purposes of map-based locations

// Change the variables, based on whether the player has enabled or disabled scrolling text

if ScrollingTitles == true then 
	FinalMessage = string.Left(CSTMessage, Addline1) // string.Left allows us to edit the line
	FinalMessage2 = string.Left(CSTMessage2, Addline2) // It will only display the amount we want
	FinalPlayerTitle = string.Left(PlayerTitle, Addline3) // This replicates the "writing" effect
	FinalTimestamp = string.Left(Timestamp, Addline4)
	FinalSpotMessage = string.Left(CSTSpotMessage, Addline5)
else
	FinalMessage = CSTMessage // Revert to fade-style text
	FinalMessage2 = CSTMessage2
	FinalPlayerTitle = PlayerTitle
	FinalTimestamp = Timestamp
	FinalSpotMessage = CSTSpotMessage
end

if ScrollingTitles == true then
if SpawnScrollTitleStart == true or SpotScrollTitleStart == true then // Create the writing effect
	Addline2 = math.Clamp(Addline2 + 8 * FrameTime(), 0, #CSTMessage2) // Addline refers to how many letters
	Addline3 = math.Clamp(Addline3 + 8 * FrameTime(), 0, #PlayerTitle) // are being dispalyed to the player
	Addline4 = math.Clamp(Addline4 + 8 * FrameTime(), 0, #Timestamp) // This part adds the letters
else
	Addline2 = math.Clamp(Addline2 - 8 * FrameTime(), 0, #CSTMessage2) // And this part removes them
	Addline3 = math.Clamp(Addline3 - 8 * FrameTime(), 0, #PlayerTitle)
	Addline4 = math.Clamp(Addline4 - 8 * FrameTime(), 0, #Timestamp)
end
end

if SpawnScrollTitleStart == true then // Player has spawned, therefore we start the spawn text
	Addline1 = math.Clamp(Addline1 + 8 * FrameTime(), 0, #CSTMessage)
else // Start removing text
	Addline1 = math.Clamp(Addline1 - 8 * FrameTime(), 0, #CSTMessage)
end
if SpotScrollTitleStart == true then // Player has reached a specific spot, start the text
	Addline5 = math.Clamp(Addline5 + 8 * FrameTime(), 0, #CSTSpotMessage)
else
	Addline5 = math.Clamp(Addline5 - 8 * FrameTime(), 0, #CSTSpotMessage)
end

	LineTotalsSpawn = math.Round(Addline1 + Addline2 + Addline3 + Addline4, 0)
// Add together all of the addlines
// These variables ensure we can start and stop certain functions when we want

	AllWordsSpawn = math.Round(#CSTMessage2 + #PlayerTitle + #Timestamp + #CSTMessage, 0)
	LineTotalsSpot = math.Round(Addline2 + Addline3 + Addline4 + Addline5, 0)
	AllWordsSpot = math.Round(#CSTMessage2 + #PlayerTitle + #Timestamp + #CSTSpotMessage, 0)

if SpawnScrollTitleStart == true then
if LineTotalsSpawn > 0 then // If the above variable has more than one letter then
	BetaVal = 255 // Make the text fully visible
else
	BetaVal = 0 // Hide it entirely
end
end

if SpotScrollTitleStart == true then // Same as above, but for a spot
if LineTotalsSpot > 0 then // Spot variable, instead of Spawn
	BetaVal2 = 255
else
	BetaVal2 = 0
end
end

// Below we start the spawn in text prompt
// When the player spawns in, the prompt will automatically trigger

if !ply:Alive() then // If the player is dead, then stop everything
	SpawnTitleStart = false
	SpawnScrollTitleStart = false
	PlayerRespawn = false
	AlphaVal = 0
	Delay = GetConVar("MapPromptsIntroDelay"):GetInt()
	Delay3 = GetConVar("MapPromptsIntroDelay"):GetInt()
end

if ply:Alive() and AlwaysSpawnMessage then // The player will always see the spawn message
	PlayerRespawn = true
end

if ply:Alive() and PlayerRespawn == "" and FirstRespawn then // Check variables then trigger a one-time message
	PlayerRespawn = true
end

if ply:Alive() and PlayerRespawn == true then // Check above variable, then trigger other variables
	SpawnTitleStart = true
	SpawnScrollTitleStart = true
	PlayerRespawn = false
end

if SpawnTitleStart == true and AlphaVal == 255 then // Text is here, and we've reached full opacity
	Delay = math.Clamp(Delay - FrameTime() * 2, 0, GetConVar("MapPromptsIntroDelay"):GetInt())
end // Start a delay to fade out said text

// All the text has been written
if SpawnScrollTitleStart == true and LineTotalsSpawn == AllWordsSpawn then
	Delay3 = math.Clamp(Delay3 - FrameTime() * 2, 0, GetConVar("MapPromptsIntroDelay"):GetInt())
end // Start a delay to start removing said text, letter-by-letter

if SpawnTitleStart == true and Delay == 0 then // Delay has reached 0
	SpawnTitleStart = false // Stop the text
end
if SpawnScrollTitleStart == true and Delay3 == 0 then // Rince and repeat
	SpawnScrollTitleStart = false
end

if SpawnTitleStart == true then // If variable is true, then start adding opacity to fade in the text
	AlphaVal = math.Clamp(AlphaVal + FadeSpeed * FrameTime(), 0, 255)
else // Start removing opacity to fade out the text
	AlphaVal = math.Clamp(AlphaVal - FadeSpeed * FrameTime(), 0, 255)
end

if GetConVar("MapPromptsEnableMissionName"):GetBool() then // If the setting is enabled then write the text
	draw.DrawText( FinalMessage, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd1)) - CustomOffset1, Alpha, Alignment )
end
if GetConVar("MapPromptsEnableMapName"):GetBool() then // Rince and repeat for each line
	draw.DrawText( FinalMessage2, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd2)) - CustomOffset2, Alpha, Alignment )
end
if GetConVar("MapPromptsEnablePlayerName"):GetBool() then
	draw.DrawText( FinalPlayerTitle, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd3)) - CustomOffset3, Alpha, Alignment )
end
if GetConVar("MapPromptsEnableTimeStamp"):GetBool() then
	draw.DrawText( FinalTimestamp, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd4)) - CustomOffset4, Alpha, Alignment )
end

// Below we start location-based prompts
// They require the player to reach a certain cubical area
// Designated by XYZ coordinates

ConstructSpot = (XPos == math.Clamp(XPos, -3000, -2800) and YPos == math.Clamp(YPos, -1535, -1415) and ZPos == math.Clamp(ZPos, -144, -12)) or (XPos == math.Clamp(XPos, -5325, -5210) and YPos == math.Clamp(YPos, -2545, -2300) and ZPos == math.Clamp(ZPos, -144, -12))

SecretSpot = (XPos == math.Clamp(XPos, -3090, -2900) and YPos == math.Clamp(YPos, -1400, -1070) and ZPos == math.Clamp(ZPos, -100, 20))

// Create XYZ Coordinate positions for unique locations

if !ply:Alive() or PromptsEnabled == false then
	SpotTitleStart = false
	SpotScrollTitleStart = false
	AlphaVal2 = 0
end

// Make sure the player is alive, and the addon is actually enabled

if SecretSpot then // It's a secret
	FixedSpotMessage = "???"
end

// Update the message according to which location we're in

if ConstructSpot then
	FixedSpotMessage = CSTExtraSpotMessage
end

if (ConstructSpot or SecretSpot) and AlphaVal2 == 0 then // If we are in a spot, and the text has zero opacity
	SpotTitleStart = true // Start fading in the text
end

if (ConstructSpot or SecretSpot) and LineTotalsSpot == 0 then // If we are in a spot, and there is no text
	SpotScrollTitleStart = true // Start writing the text
end

if (!ConstructSpot and !SecretSpot) and AlphaVal2 == 255 then // If we are in a spot and text is full opacity
	Delay2 = math.Clamp(Delay2 - FrameTime() * 2, 0, GetConVar("MapPromptsLocationDelay"):GetInt())
	// Start a delay to fade out the text
elseif (!ConstructSpot and !SecretSpot) and AlphaVal2 == 0 then // If we are not in a spot, and text has no opacity
	Delay2 = GetConVar("MapPromptsLocationDelay"):GetInt()
	// Keep the delay at a constant value for future use
end

if (!ConstructSpot and !SecretSpot) and LineTotalsSpot == AllWordsSpot and !SpawnScrollTitleStart then
	Delay4 = math.Clamp(Delay4 - RealFrameTime() * 2, 0, GetConVar("MapPromptsLocationDelay"):GetInt())
	// Same as above, but for scrolling text
	// Lots of complicated variables
elseif (!ConstructSpot and !SecretSpot) and LineTotalsSpot == 0 then
	Delay4 = GetConVar("MapPromptsLocationDelay"):GetInt()
end

if (ConstructSpot or SecretSpot) and ConstantAreaTrigger then // If the setting is enabled
	Delay2 = GetConVar("MapPromptsLocationDelay"):GetInt() // Then the text never fades inside the spot
	Delay4 = GetConVar("MapPromptsLocationDelay"):GetInt() // Only when we leave
end

if (ConstructSpot or SecretSpot) and !ConstantAreaTrigger and AlphaVal2 == 255 then // If we are in spot
// Text is fully visible, and above variable is not enabled, then start fade out
	Delay2 = math.Clamp(Delay2 - RealFrameTime() * 2, 0, GetConVar("MapPromptsLocationDelay"):GetInt())
end
if (ConstructSpot or SecretSpot) and !ConstantAreaTrigger and LineTotalsSpot == AllWordsSpot then
// Same as above, but for scrolling text
	Delay4 = math.Clamp(Delay4 - RealFrameTime() * 2, 0, GetConVar("MapPromptsLocationDelay"):GetInt())
end

if SpotTitleStart == true and Delay2 == 0 then // Further adjust the variables
	SpotTitleStart = false // Delay has reached zero, start the fadeout
end
if SpotScrollTitleStart == true and Delay4 == 0 then
	SpotScrollTitleStart = false
end

if SpotTitleStart == true then // We want to start a text fading in
	AlphaVal2 = math.Clamp(AlphaVal2 + FadeSpeed * FrameTime(), 0, 255)
else // Start fade out
	AlphaVal2 = math.Clamp(AlphaVal2 - FadeSpeed * FrameTime(), 0, 255)
end

// All the text for the location-based prompts

if GetConVar("MapPromptsEnableMissionName"):GetBool() then
	draw.DrawText( FinalSpotMessage, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd1)) - CustomOffset1, Alpha2, Alignment )
end
if GetConVar("MapPromptsEnableMapName"):GetBool() then
	draw.DrawText( FinalMessage2, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd2)) - CustomOffset2, Alpha2, Alignment )
end
if GetConVar("MapPromptsEnablePlayerName"):GetBool() then
	draw.DrawText( FinalPlayerTitle, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd3)) - CustomOffset3, Alpha2, Alignment )
end
if GetConVar("MapPromptsEnableTimeStamp"):GetBool() then
	draw.DrawText( FinalTimestamp, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd4)) - CustomOffset4, Alpha2, Alignment )
end

end
end)