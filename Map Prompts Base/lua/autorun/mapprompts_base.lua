if SERVER then
	AddCSLuaFile("mapprompts_shared.lua")
end
if CLIENT then
	include("mapprompts_shared.lua")
end