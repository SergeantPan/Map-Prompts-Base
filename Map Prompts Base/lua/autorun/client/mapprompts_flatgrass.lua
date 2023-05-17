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

local FlatgrassMessage = {
'"The great outdoors"',
'"The wind in your hair"',
'"What a day to be alive"'
}

	local FlatgrassSpawnMessage = table.Random(FlatgrassMessage)

local FlatGrassSecretRoomMessage = {
'"Secrets below"',
'"Treasure hunter"',
'"Hide and seek"'
}

	local FlatgrassExtraSpotMessage = table.Random(FlatGrassSecretRoomMessage)

	FlatFakeClockHr = 8
	FlatFakeClockHrAlternate = 8
	FlatFakeClockMin = 0
	FlatFakeClockSec = 0
	Suffix = ""

local function FlatGrass_FakeClock()

if FlatFakeClockSec < 60 then
	FlatFakeClockSec = FlatFakeClockSec + 1
elseif FlatFakeClockSec == 59 then
	FlatFakeClockSec = 00
	FlatFakeClockMin = FlatFakeClockMin + 1
end
if FlatFakeClockMin == 60 then
	FlatFakeClockMin = 00
	FlatFakeClockHr = FlatFakeClockHr + 1
	FlatFakeClockHrAlternate = FlatFakeClockHrAlternate + 1
end
if FlatFakeClockHr == 24 then
	FlatFakeClockHr = 00
end
if FlatFakeClockHrAlternate == 12 then
	FlatFakeClockHrAlternate = 00
end
end

	timer.Create( "FlatgrassClock", 1, 0, FlatGrass_FakeClock )

hook.Add("HUDPaint", "gm_flatgrass", function(ply)

	if GetConVar("MapPromptsEnabled"):GetBool() and game.GetMap() == "gm_flatgrass" then

	MapPromptsSupport = "gm_flatgrass"

if GetConVar("MapPromptsCustomMissionName"):GetString() != "" then
	FlatMessage = GetConVar("MapPromptsCustomMissionName"):GetString()
	FlatSpotMessage = GetConVar("MapPromptsCustomMissionName"):GetString()
else
	FlatMessage = FlatgrassSpawnMessage
	FlatSpotMessage = FixedSpotMessage
end

if GetConVar("MapPromptsCustomMapName"):GetString() != "" then
	FlatMessage2 = GetConVar("MapPromptsCustomMapName"):GetString()
	FlatSpotMessage2 = GetConVar("MapPromptsCustomMapName"):GetString()
elseif GetConVar("MapPromptsCustomMapName"):GetString() == "" and !GetConVar("MapPromptsUniqueMapNames"):GetBool() then
	FlatMessage2 = "Gm_Flatgrass"
	FlatSpotMessage2 = "Gm_Flatgrass"
else
	FlatMessage2 = "Flatgrass"
	FlatSpotMessage2 = "Flatgrass"
end

if GetConVar("MapPromptsUseCustomFont"):GetInt() == 1 then
	PlayerFont = "PlayerCustomFont"
else
	PlayerFont = "MapPromptsCustom"
end

	ScrollingTitles = GetConVar("MapPromptsExperimentalScrolling"):GetBool()

	FadeSpeed = 80 * GetConVar("MapPromptsTextFadeSpeed"):GetInt()

	Alignment = GetConVar("MapPromptsTextAlignment"):GetInt()

	Width = GetConVar("MapPromptsTextXPos"):GetFloat()
	Height = GetConVar("MapPromptsTextYPos"):GetFloat()

	CustomAdd1 = GetConVar("MapPromptsMissionNameOffset"):GetInt()
	CustomAdd2 = GetConVar("MapPromptsMapNameOffset"):GetInt()
	CustomAdd3 = GetConVar("MapPromptsPlayerNameOffset"):GetInt()
	CustomAdd4 = GetConVar("MapPromptsTimeStampOffset"):GetInt()

	FirstRespawn = GetConVar("MapPromptsFirstSpawn"):GetBool()
	AlwaysSpawnMessage = GetConVar("MapPromptsAlwaysOnSpawn"):GetBool()

	PromptsEnabled = GetConVar("MapPromptsCustomLocationPrompts"):GetBool()

if ConVarExists("sf_enable_mapsupport") then
	SF2TimeStamp = StormFox2.Time.TimeToString(nil, StormFox2.Setting.GetCache("12h_display"))
end

	ConstantAreaTrigger = GetConVar("MapPromptsLocationPersistence"):GetBool()

	ply = LocalPlayer()

if GetConVar("MapPromptsPlayerName"):GetString() == "" then
	PlayerTitle = ply:Nick()
else
	PlayerTitle = GetConVar("MapPromptsPlayerName"):GetString()
end

if FlatFakeClockSec < 10 then
	FakeClockDebug3 = ":0"
else
	FakeClockDebug3 = ":"
end
if FlatFakeClockMin < 10 then
	FakeClockDebug2 = ":0"
else
	FakeClockDebug2 = ":"
end
if (FlatFakeClockHr < 10 and !GetConVar("MapPromptsTimeStamp12h"):GetBool()) or (FlatFakeClockHrAlternate < 10 and GetConVar("MapPromptsTimeStamp12h"):GetBool()) then
	FakeClockDebug1 = "0"
else
	FakeClockDebug1 = ""
end
if GetConVar("MapPromptsTimeStamp12h"):GetBool() then
	FlatFakeClockHrVisual = FlatFakeClockHrAlternate
	Hour = "%I"
else
	FlatFakeClockHrVisual = FlatFakeClockHr
	Hour = "%H"
end

if GetConVar("MapPromptsTimeStamp12h"):GetBool() and FlatFakeClockHr < 12 then
	Suffix = " AM"
elseif GetConVar("MapPromptsTimeStamp12h"):GetBool() and FlatFakeClockHr >= 12 then
	Suffix = " PM"
end
if GetConVar("MapPromptsTimeStamp12h"):GetBool() and GetConVar("MapPromptsTimeStampStyle"):GetInt() == 1  then
	Suffix = " %p"
end
if !GetConVar("MapPromptsTimeStamp12h"):GetBool() or GetConVar("MapPromptsTimeStampStyle"):GetInt() == 3 then
	Suffix = ""
end

if GetConVar("MapPromptsTimeStampStyle"):GetInt() == 1 then
	Timestamp = os.date( Hour .. ":%M:%S" .. Suffix )
elseif GetConVar("MapPromptsTimeStampStyle"):GetInt() == 2 then
	Timestamp = FakeClockDebug1 .. FlatFakeClockHrVisual .. FakeClockDebug2 .. FlatFakeClockMin .. FakeClockDebug3 .. FlatFakeClockSec .. Suffix
elseif GetConVar("MapPromptsTimeStampStyle"):GetInt() == 3 and ConVarExists("sf_enable_mapsupport") then
	Timestamp = SF2TimeStamp
else
	Timestamp = os.date( Hour .. ":%M:%S" .. Suffix )
end

if ScrollingTitles then
	Alpha = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), BetaVal )
	Alpha2 = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), BetaVal2 )
else
	Alpha = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), math.Clamp(AlphaVal, 0, 255) )
	Alpha2 = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), math.Clamp(AlphaVal2, 0, 255) )
end

	XPos = math.Round(tostring(ply:GetPos().x), 0)
	YPos = math.Round(tostring(ply:GetPos().y), 0)
	ZPos = math.Round(tostring(ply:GetPos().z), 0) + 3

if ScrollingTitles == true then
	FinalMessage = string.Left(FlatMessage, Addline1)
	FinalMessage2 = string.Left(FlatMessage2, Addline2)
	FinalPlayerTitle = string.Left(PlayerTitle, Addline3)
	FinalTimestamp = string.Left(Timestamp, Addline4)
	FinalSpotMessage = string.Left(FlatSpotMessage, Addline5)
else
	FinalMessage = FlatMessage
	FinalMessage2 = FlatMessage2
	FinalPlayerTitle = PlayerTitle
	FinalTimestamp = Timestamp
	FinalSpotMessage = FlatSpotMessage
end

	if ScrollingTitles == true then
	if SpawnScrollTitleStart == true or SpotScrollTitleStart == true then
	Addline2 = math.Clamp(Addline2 + 8 * FrameTime(), 0, #FlatMessage2)
	Addline3 = math.Clamp(Addline3 + 8 * FrameTime(), 0, #PlayerTitle)
	Addline4 = math.Clamp(Addline4 + 8 * FrameTime(), 0, #Timestamp)
	else
	Addline2 = math.Clamp(Addline2 - 8 * FrameTime(), 0, #FlatMessage2)
	Addline3 = math.Clamp(Addline3 - 8 * FrameTime(), 0, #PlayerTitle)
	Addline4 = math.Clamp(Addline4 - 8 * FrameTime(), 0, #Timestamp)
	end
	end

	if SpawnScrollTitleStart == true then
	Addline1 = math.Clamp(Addline1 + 8 * FrameTime(), 0, #FlatMessage)
	else
	Addline1 = math.Clamp(Addline1 - 8 * FrameTime(), 0, #FlatMessage)
	end
	if SpotScrollTitleStart == true then
	Addline5 = math.Clamp(Addline5 + 8 * FrameTime(), 0, #FlatSpotMessage)
	else
	Addline5 = math.Clamp(Addline5 - 8 * FrameTime(), 0, #FlatSpotMessage)
	end

	LineTotalsSpawn = math.Round(Addline1 + Addline2 + Addline3 + Addline4, 0)
	AllWordsSpawn = math.Round(#FlatMessage2 + #PlayerTitle + #Timestamp + #FlatMessage, 0)
	LineTotalsSpot = math.Round(Addline2 + Addline3 + Addline4 + Addline5, 0)
	AllWordsSpot = math.Round(#FlatSpotMessage2 + #PlayerTitle + #Timestamp + #FlatSpotMessage, 0)

if SpawnScrollTitleStart == true then
if LineTotalsSpawn > 0 then
	BetaVal = 255
else
	BetaVal = 0
end
end

if SpotScrollTitleStart == true then
if LineTotalsSpot > 0 then
	BetaVal2 = 255
else
	BetaVal2 = 0
end
end

if !ply:Alive() then
	SpawnTitleStart = false
	SpawnScrollTitleStart = false
	PlayerRespawn = false
	AlphaVal = 0
	Delay = GetConVar("MapPromptsIntroDelay"):GetInt()
	Delay3 = GetConVar("MapPromptsIntroDelay"):GetInt()
end

if ply:Alive() and AlwaysSpawnMessage then
	PlayerRespawn = true
end

if ply:Alive() and PlayerRespawn == "" and FirstRespawn then
	PlayerRespawn = true
end

if ply:Alive() and PlayerRespawn == true then
	SpawnTitleStart = true
	SpawnScrollTitleStart = true
	PlayerRespawn = false
end

if SpawnTitleStart == true and AlphaVal == 255 then
	Delay = math.Clamp(Delay - RealFrameTime() * 2, 0, GetConVar("MapPromptsIntroDelay"):GetInt())
end
if SpawnScrollTitleStart == true and LineTotalsSpawn == AllWordsSpawn then
	Delay3 = math.Clamp(Delay3 - FrameTime() * 2, 0, GetConVar("MapPromptsIntroDelay"):GetInt())
end

if SpawnTitleStart == true and Delay == 0 then
	SpawnTitleStart = false
end
if SpawnScrollTitleStart == true and Delay3 == 0 then
	SpawnScrollTitleStart = false
end

if SpawnTitleStart == true then
	AlphaVal = math.Clamp(AlphaVal + 80 * FrameTime(), 0, 255)
else
	AlphaVal = math.Clamp(AlphaVal - 80 * FrameTime(), 0, 255)
end

if GetConVar("MapPromptsEnableMissionName"):GetBool() then
	draw.DrawText( FinalMessage, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd1)) - CustomOffset1, Alpha, Alignment )
end
if GetConVar("MapPromptsEnableMapName"):GetBool() then
	draw.DrawText( FinalMessage2, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd2)) - CustomOffset2, Alpha, Alignment )
end
if GetConVar("MapPromptsEnablePlayerName"):GetBool() then
	draw.DrawText( FinalPlayerTitle, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd3)) - CustomOffset3, Alpha, Alignment )
end
if GetConVar("MapPromptsEnableTimeStamp"):GetBool() then
	draw.DrawText( FinalTimestamp, PlayerFont, ScrW() * Width, ScrH() * (Height + (0.03 * CustomAdd4)) - CustomOffset4, Alpha, Alignment )
end

FlatgrassSpot = (XPos == math.Clamp(XPos, -992, -416) and YPos == math.Clamp(YPos, -448, 448) and math.Clamp(ZPos, -12767, -12561))

if !ply:Alive() or PromptsEnabled == false then
	SpotTitleStart = false
	SpotScrollTitleStart = false
	AlphaVal2 = 0
end

if FlatgrassSpot then
	FixedSpotMessage = FlatgrassExtraSpotMessage
end

if FlatgrassSpot and AlphaVal2 == 0 then
	SpotTitleStart = true
end

if FlatgrassSpot and LineTotalsSpot == 0 then
	SpotScrollTitleStart = true
end

if !FlatgrassSpot and AlphaVal2 == 255 then
	Delay2 = math.Clamp(Delay2 - RealFrameTime() * 2, 0, GetConVar("MapPromptsLocationDelay"):GetInt())
elseif !FlatgrassSpot and AlphaVal2 == 0 then
	Delay2 = GetConVar("MapPromptsLocationDelay"):GetInt()
end

if !FlatgrassSpot and LineTotalsSpot == AllWordsSpot and !SpawnScrollTitleStart then
	Delay4 = math.Clamp(Delay4 - RealFrameTime() * 2, 0, GetConVar("MapPromptsLocationDelay"):GetInt())
elseif !FlatgrassSpot and LineTotalsSpot == 0 then
	Delay4 = GetConVar("MapPromptsLocationDelay"):GetInt()
end

if FlatgrassSpot and ConstantAreaTrigger then
	Delay2 = GetConVar("MapPromptsLocationDelay"):GetInt()
	Delay4 = GetConVar("MapPromptsLocationDelay"):GetInt()
end
if FlatgrassSpot and !ConstantAreaTrigger and AlphaVal2 == 255 then
	Delay2 = math.Clamp(Delay2 - RealFrameTime() * 2, 0, GetConVar("MapPromptsLocationDelay"):GetInt())
end
if FlatgrassSpot and !ConstantAreaTrigger and LineTotalsSpot == AllWordsSpot then
	Delay4 = math.Clamp(Delay4 - RealFrameTime() * 2, 0, GetConVar("MapPromptsLocationDelay"):GetInt())
end

if SpotTitleStart == true and Delay2 == 0 then
	SpotTitleStart = false
end
if SpotScrollTitleStart == true and Delay4 == 0 then
	SpotScrollTitleStart = false
end

if SpotTitleStart == true then
	AlphaVal2 = math.Clamp(AlphaVal2 + 80 * FrameTime(), 0, 255)
else
	AlphaVal2 = math.Clamp(AlphaVal2 - 80 * FrameTime(), 0, 255)
end

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