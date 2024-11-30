local positions = {-101, -76, -51, -26, 0, 25, 50, 75, 100}
local currentScreen = Var "LoadingScreen"

t = Def.ActorFrame{
	Condition=not GAMESTATE:IsEventMode();
}

t[#t+1] = Def.ActorFrame {
	LoadActor(Model().."nine");
}

if currentScreen == "ScreenEvaluationNormal" then
	for i=1,GetExtraStageStars()-GetRecentExtraStageStars() do
		t[#t+1] = Def.ActorFrame {
			LoadActor("star")..{
				InitCommand=function(s)
					s:xy(positions[i], 1)
				end,
			};
			LoadActor("star")..{
				InitCommand=function(s) 
					s:blend(Blend.Add):diffusealpha(0):linear(0.01):smooth(0.3):diffusealpha(1)
					s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.70)
					s:xy(positions[i], 1)
				end,
			};
		}
	end
else
	for i=1,GetExtraStageStars() do
		t[#t+1] = Def.ActorFrame {
			LoadActor("star")..{
				InitCommand=function(s)
					s:xy(positions[i], 1)
				end,
			};
			LoadActor("star")..{
				InitCommand=function(s) 
					s:blend(Blend.Add):diffusealpha(0):linear(0.01):smooth(0.3):diffusealpha(1)
					s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.70)
					s:xy(positions[i], 1)
				end,
			};
		}
	end
end

-- Animate incoming stars
if currentScreen == "ScreenEvaluationNormal" then
	for i=(GetExtraStageStars()-GetRecentExtraStageStars())+1,GetExtraStageStars() do
		t[#t+1] = Def.ActorFrame {
			InitCommand=function(s)
				s:diffusealpha(0)
				s:addy(-50)
				s:sleep(1)
				if GetExtraStageStars()-GetRecentExtraStageStars() == 0 then
					s:sleep(0.3*i)
				else
					s:sleep(0.3*(i-GetRecentExtraStageStars()))
				end
				s:queuecommand("PlaySound")
				s:accelerate(0.3)
				s:diffusealpha(1)
				s:addy(50)
			end;
			PlaySoundCommand=function(s)
				SOUND:PlayOnce(THEME:GetPathS("", "ExtraStageStar gained.ogg"))
			end;
			LoadActor("star")..{
				InitCommand=function(s)
					s:xy(positions[i], 1)
					
				end,
			};
			LoadActor("star")..{
				InitCommand=function(s) 
					s:blend(Blend.Add):diffusealpha(0):linear(0.01):smooth(0.3):diffusealpha(1)
					s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.70)
					s:xy(positions[i], 1)
				end,
			};
		}
	end
end

return t
