local AllOptions = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Preferred")
local PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptions("ModsLevel_Preferred"):ScrollSpeed()

local SpeedModsPattern = "%d(%.%d%d?)?x"

AllOptions = AllOptions:gsub(SpeedModsPattern, "")

local function GetInput(event)
    if not PREFSMAN:GetPreference("OnlyDedicatedMenuButtons") then return end
    if event.type == "InputEventType_Release" then return end

    if event.GameButton == "MenuLeft" then
        if PlayerSpeed > 0.25 then
            local NewSpeed = PlayerSpeed - 0.25
            GAMESTATE:GetPlayerState(PLAYER_2):SetPlayerOptions('ModsLevel_Song',AllOptions..","..NewSpeed.."x")
            AllOptions = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Song")
            PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptions("ModsLevel_Song"):ScrollSpeed()
        end
    elseif event.GameButton == "MenuRight" then
        if PlayerSpeed < 8 then
            local NewSpeed = PlayerSpeed + 0.25
            GAMESTATE:GetPlayerState(PLAYER_2):SetPlayerOptions('ModsLevel_Song',AllOptions..","..NewSpeed.."x")
            AllOptions = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Song")
            PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptions("ModsLevel_Song"):ScrollSpeed()
        end
    end
end


return Def.ActorFrame {
    OnCommand=function(s) SCREENMAN:GetTopScreen():AddInputCallback(GetInput) end;
}
