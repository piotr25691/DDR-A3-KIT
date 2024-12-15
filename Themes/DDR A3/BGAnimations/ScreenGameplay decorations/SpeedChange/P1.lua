local AllOptions = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptionsString("ModsLevel_Preferred")
local PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptions("ModsLevel_Preferred"):ScrollSpeed()

local SpeedModsPattern = "%d(%.%d%d?)?x"

AllOptions = AllOptions:gsub(SpeedModsPattern, "")

local function GetInput(event)
    if not PREFSMAN:GetPreference("OnlyDedicatedMenuButtons") then return end
    if event.type == "InputEventType_Release" then return end
    if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "LET'S CHECK YOUR LEVEL!" or
    GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Steps to the Star" then return end

    local OptionsP1P = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptionsString('ModsLevel_Preferred')
    local flareModifiers = {
        Flare1 = ",bar,flare-1,failimmediate",
        Flare2 = ",bar,flare-2,failimmediate",
        Flare3 = ",bar,flare-3,failimmediate",
        Flare4 = ",bar,flare-4,failimmediate",
        Flare5 = ",bar,flare-5,failimmediate",
        Flare6 = ",bar,flare-6,failimmediate",
        Flare7 = ",bar,flare-7,failimmediate",
        Flare8 = ",bar,flare-8,failimmediate",
        Flare9 = ",bar,flare-9,failimmediate",
        FlareEX = ",bar,flare-ex,failimmediate",
        FloatingFlare = ",bar,floating-flare,failimmediate",
    }

    local flareModifier = ""
    for key, value in pairs(flareModifiers) do
        if string.find(OptionsP1P, key) then
            flareModifier = value
            break
        end
    end

    if event.GameButton == "MenuLeft" then
        if PlayerSpeed > 0.25 then
            local NewSpeed = PlayerSpeed - 0.25
            GAMESTATE:GetPlayerState(PLAYER_1):SetPlayerOptions('ModsLevel_Song',AllOptions..","..NewSpeed.."x"..flareModifier)
            AllOptions = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptionsString("ModsLevel_Song")
            PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptions("ModsLevel_Song"):ScrollSpeed()
        end
    elseif event.GameButton == "MenuRight" then
        if PlayerSpeed < 8 then
            local NewSpeed = PlayerSpeed + 0.25
            GAMESTATE:GetPlayerState(PLAYER_1):SetPlayerOptions('ModsLevel_Song',AllOptions..","..NewSpeed.."x"..flareModifier)
            AllOptions = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptionsString("ModsLevel_Song")
            PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptions("ModsLevel_Song"):ScrollSpeed()
        end
    end
end

return Def.ActorFrame {
    OnCommand=function(s) SCREENMAN:GetTopScreen():AddInputCallback(GetInput) end;
}
