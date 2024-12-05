local AllOptions = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Preferred")
local PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptions("ModsLevel_Preferred"):ScrollSpeed()

local SpeedModsPattern = "%d(%.%d%d?)?x"

AllOptions = AllOptions:gsub(SpeedModsPattern, "")

local function GetInput(event)
    if not PREFSMAN:GetPreference("OnlyDedicatedMenuButtons") then return end
    if event.type == "InputEventType_Release" then return end

    local OptionsP2P = GAMESTATE:GetPlayerState('PlayerNumber_P1'):GetPlayerOptionsString('ModsLevel_Preferred');
    local FlareModifier = "";
    if string.find(OptionsP2P,"Flare1") then
        FlareModifier = ",bar,flare-1,failimmediate";
    elseif string.find(OptionsP2P,"Flare2") then
        FlareModifier = ",bar,flare-2,failimmediate";
    elseif string.find(OptionsP2P,"Flare3") then
        FlareModifier = ",bar,flare-3,failimmediate";
    elseif string.find(OptionsP2P,"Flare4") then
        FlareModifier = ",bar,flare-4,failimmediate";
    elseif string.find(OptionsP2P,"Flare5") then
        FlareModifier = ",bar,flare-5,failimmediate";
    elseif string.find(OptionsP2P,"Flare6") then
        FlareModifier = ",bar,flare-6,failimmediate";
    elseif string.find(OptionsP2P,"Flare7") then
        FlareModifier = ",bar,flare-7,failimmediate";
    elseif string.find(OptionsP2P,"Flare8") then
        FlareModifier = ",bar,flare-8,failimmediate";
    elseif string.find(OptionsP2P,"Flare9") then
        FlareModifier = ",bar,flare-9,failimmediate";
    elseif string.find(OptionsP2P,"FlareEX") then
        FlareModifier = ",bar,flare-ex,failimmediate";
    elseif string.find(OptionsP2P,"FloatingFlare") then
        FlareModifier = ",bar,floating-flare,failimmediate";
    end

    if event.GameButton == "MenuLeft" then
        if PlayerSpeed > 0.25 then
            local NewSpeed = PlayerSpeed - 0.25
            GAMESTATE:GetPlayerState(PLAYER_2):SetPlayerOptions('ModsLevel_Song',AllOptions..","..NewSpeed.."x"..FlareModifier)
            AllOptions = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Song")
            PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptions("ModsLevel_Song"):ScrollSpeed()
        end
    elseif event.GameButton == "MenuRight" then
        if PlayerSpeed < 8 then
            local NewSpeed = PlayerSpeed + 0.25
            GAMESTATE:GetPlayerState(PLAYER_2):SetPlayerOptions('ModsLevel_Song',AllOptions..","..NewSpeed.."x"..FlareModifier)
            AllOptions = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Song")
            PlayerSpeed = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptions("ModsLevel_Song"):ScrollSpeed()
        end
    end
end


return Def.ActorFrame {
    OnCommand=function(s) SCREENMAN:GetTopScreen():AddInputCallback(GetInput) end;
}
