	local AlphaVal = 0

	local Addline1 = 0
	local Addline2 = 0
	local Addline3 = 0
	local Addline4 = 0

	local PlayerRespawn = ""

	local Delay = GetConVar("MapPromptsIntroDelay"):GetInt()
	local Delay3 = GetConVar("MapPromptsIntroDelay"):GetInt()

local OperationMessage = {
'"Operation Falling Spear"',
'"Operation Shattered Skies"',
'"Operation Steel Tiger"',
'"Operation Desert Rats"',
'"Operation Morning Star"',
'"Operation Burning Steel"',
'"Operation Weeping Willow"',
'"Operation Hunting Barracuda"',
'[REDACTED]',
'"Operation Fatal Blackout"',
'"Operation Watchful Eye"',
'"Operation Damocles"',
'"Operation Blind Guardian"',
'"Operation Forest Walker"',
'"Operation Snow Dog"',
'"Operation Downpour"',
'"Operation Quicksand"',
'"Operation Heavy Rain"',
'"Operation Overlord"',
'"Operation Blind Gardener"',
'"Operation Collapsing Spire"'
}

	local FallbackSpawnMessage = table.Random(OperationMessage)

	FallbackFakeClockHr = 8
	FallbackFakeClockHrAlternate = 8
	FallbackFakeClockMin = 0
	FallbackFakeClockSec = 0

local function Fallback_FakeClock()

if FallbackFakeClockSec < 59 then
	FallbackFakeClockSec = FallbackFakeClockSec + 1
elseif FallbackFakeClockSec == 59 then
	FallbackFakeClockSec = 00
	FallbackFakeClockMin = FallbackFakeClockMin + 1
end
if FallbackFakeClockMin == 60 then
	FallbackFakeClockMin = 00
	FallbackFakeClockHr = FallbackFakeClockHr + 1
	FallbackFakeClockHrAlternate = FallbackFakeClockHrAlternate + 1
end
if FallbackFakeClockHr == 24 then
	FallbackFakeClockHr = 00
end
if FallbackFakeClockHrAlternate == 12 then
	FallbackFakeClockHrAlternate = 00
end
end
	timer.Create( "FallbackClock", 1, 0, Fallback_FakeClock )

hook.Add("HUDPaint", "DefaultMapPromptsFunction", function(ply)

	if GetConVar("MapPromptsEnabled"):GetBool() and GetConVar("MapPromptsFallbackEnabled"):GetBool() then
	if MapPromptsSupport != game.GetMap() then

if GetConVar("MapPromptsCustomMissionName"):GetString() != "" then
	FallbackMessage = GetConVar("MapPromptsCustomMissionName"):GetString()
else
	FallbackMessage = FallbackSpawnMessage
end

if GetConVar("MapPromptsCustomMapName"):GetString() != "" then
	FallbackMessage2 = GetConVar("MapPromptsCustomMapName"):GetString()
else
	FallbackMessage2 = string.upper(string.sub(game:GetMap(),1,1)) .. string.TrimLeft(game.GetMap(),string.sub(game:GetMap(),1,1))
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

	ply = LocalPlayer()

if GetConVar("MapPromptsPlayerName"):GetString() == "" then
	PlayerTitle = ply:Nick()
else
	PlayerTitle = GetConVar("MapPromptsPlayerName"):GetString()
end

if FallbackFakeClockSec < 10 then
	FakeClockDebug3 = ":0"
else
	FakeClockDebug3 = ":"
end
if FallbackFakeClockMin < 10 then
	FakeClockDebug2 = ":0"
else
	FakeClockDebug2 = ":"
end
if (FallbackFakeClockHr < 10 and !GetConVar("MapPromptsTimeStamp12h"):GetBool()) or (FallbackFakeClockHrAlternate < 10 and GetConVar("MapPromptsTimeStamp12h"):GetBool()) then
	FakeClockDebug1 = "0"
else
	FakeClockDebug1 = ""
end

if GetConVar("MapPromptsTimeStamp12h"):GetBool() then
	FallbackFakeClockHrVisual = FallbackFakeClockHrAlternate
	Hour = "%I"
else
	FallbackFakeClockHrVisual = FallbackFakeClockHr
	Hour = "%H"
end

if GetConVar("MapPromptsTimeStamp12h"):GetBool() and FallbackFakeClockHr < 12 and GetConVar("MapPromptsTimeStampStyle"):GetInt() == 2 then
	Suffix = " AM"
elseif GetConVar("MapPromptsTimeStamp12h"):GetBool() and FallbackFakeClockHr >= 12 then
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
	Timestamp = FakeClockDebug1 .. FallbackFakeClockHrVisual .. FakeClockDebug2 .. FallbackFakeClockMin .. FakeClockDebug3 .. FallbackFakeClockSec .. Suffix
elseif GetConVar("MapPromptsTimeStampStyle"):GetInt() == 3 and ConVarExists("sf_enable_mapsupport") then
	Timestamp = SF2TimeStamp
else
	Timestamp = os.date( Hour .. ":%M:%S" .. Suffix )
end

if ScrollingTitles then
	Alpha = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), BetaVal )
else
	Alpha = Color( GetConVar("FontColorR"):GetInt(), GetConVar("FontColorG"):GetInt(), GetConVar("FontColorB"):GetInt(), math.Clamp(AlphaVal, 0, 255) )
end

if ScrollingTitles == true then
	FinalMessage = string.Left(FallbackMessage, Addline1)
	FinalMessage2 = string.Left(FallbackMessage2, Addline2)
	FinalPlayerTitle = string.Left(PlayerTitle, Addline3)
	FinalTimestamp = string.Left(Timestamp, Addline4)
else
	FinalMessage = FallbackMessage
	FinalMessage2 = FallbackMessage2
	FinalPlayerTitle = PlayerTitle
	FinalTimestamp = Timestamp
end

if ScrollingTitles == true then
if SpawnScrollTitleStart == true then
	Addline1 = math.Clamp(Addline1 + 8 * FrameTime(), 0, #FallbackMessage)
	Addline2 = math.Clamp(Addline2 + 8 * FrameTime(), 0, #FallbackMessage2)
	Addline3 = math.Clamp(Addline3 + 8 * FrameTime(), 0, #PlayerTitle)
	Addline4 = math.Clamp(Addline4 + 8 * FrameTime(), 0, #Timestamp)
else
	Addline1 = math.Clamp(Addline1 - 8 * FrameTime(), 0, #FallbackMessage)
	Addline2 = math.Clamp(Addline2 - 8 * FrameTime(), 0, #FallbackMessage2)
	Addline3 = math.Clamp(Addline3 - 8 * FrameTime(), 0, #PlayerTitle)
	Addline4 = math.Clamp(Addline4 - 8 * FrameTime(), 0, #Timestamp)
end
end

	LineTotalsSpawn = math.Round(Addline1 + Addline2 + Addline3 + Addline4, 0)
	AllWordsSpawn = math.Round(#FallbackMessage2 + #PlayerTitle + #Timestamp + #FallbackMessage, 0)

if SpawnScrollTitleStart == true then
if LineTotalsSpawn > 0 then
	BetaVal = 255
else
	BetaVal = 0
end
end

if !ply:Alive() or PromptsEnabled == false then
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
	Delay = math.Clamp(Delay - FrameTime() * 2, 0, 10)
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
	AlphaVal = math.Clamp(AlphaVal + FadeSpeed * FrameTime(), 0, 255)
else
	AlphaVal = math.Clamp(AlphaVal - FadeSpeed * FrameTime(), 0, 255)
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

end
end
end)