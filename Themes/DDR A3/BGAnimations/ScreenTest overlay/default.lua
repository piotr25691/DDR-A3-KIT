local function GetInput(event)
    if event.type == "InputEventType_Release" then return end

    if event.GameButton == "Start" then
        SCREENMAN:GetTopScreen():SetNextScreenName("ScreenOptionsService"):StartTransitioningScreen("SM_GoToNextScreen")
    end
end

t = Def.ActorFrame {
	OnCommand=function(s) SCREENMAN:GetTopScreen():AddInputCallback(GetInput) end;
}

t[#t+1] = LoadActor("screen_check")..{
    InitCommand=cmd(FullScreen),
}

return t;
