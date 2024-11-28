local positions = {-101, -76, -51, -26, 0, 25, 50, 75, 100}
local currentScreen = Var "LoadingScreen"


if currentScreen == "ScreenEvaluationNormal" then
	AddExtraStageStars(STATSMAN:GetCurStageStats():GetPlayerStageStats(GAMESTATE:GetMasterPlayerNumber()):GetGrade(), GAMESTATE:GetMasterPlayerNumber())
end

t = Def.ActorFrame{
	Condition=not GAMESTATE:IsEventMode();
}

t[#t+1] = Def.ActorFrame {
	LoadActor(Model().."nine");
}

for i=1,GetExtraStageStars() do
	t[#t+1] = Def.ActorFrame {
		LoadActor("star")..{
			InitCommand=function(s)
				s:xy(positions[i], 1)
				s:zoom(1.2)
			end,
		};
		LoadActor("star")..{
			InitCommand=function(s) 
				s:blend(Blend.Add):diffusealpha(0):linear(0.01):smooth(0.3):diffusealpha(1)
				s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.70)
				s:xy(positions[i], 1)
				s:zoom(1.2)
			end,
		};
	}
end

return t