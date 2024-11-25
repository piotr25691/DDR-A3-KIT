-- TargetScore (A3)
-- Sourced from https://josevarela.net/SMArchive/Themes/ThemePreview.php?Category=StepMania%205&ID=DDR2013
-- Modified for DDR A3 theme with realistic behavior
-- Needs judgments in the background

local player = "PlayerNumber_P2";
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local pname = ToEnumShortString(player);
local ts = {0,0};

local playerFailed = false;

local TargetScore_JudgeCmdsPlayer = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "TargetScore_2013_JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentW4Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentW4Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentMissCommand" );
};

local t = Def.ActorFrame {};

function profile_or_player(pn)
	if PROFILEMAN:IsPersistentProfile(pn) then
		return PROFILEMAN:GetProfile(pn):GetGUID();
	else
		return ToEnumShortString(pn);
	end;
end;

function FirstReMIX_TargetScore(pn)
	local pname = ToEnumShortString(pn);
	local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
	if PROFILEMAN:IsPersistentProfile(pn) then
		WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'personal');
	else
		WritePrefToFile("FirstReMIX_TargetScore_" .. pname, 'personal')
	end;
end

FirstReMIX_TargetScore(player)

function TargetScore(pn)
	return "personal"
end;

function EXScore(pn)
	return "personal"
end

function GetNormalScore(maxsteps,score,player)
	local s;
	local w1 = score:GetTapNoteScore('TapNoteScore_W1');
	local w2 = score:GetTapNoteScore('TapNoteScore_W2');
	local w3 = score:GetTapNoteScore('TapNoteScore_W3');
	local hd = score:GetHoldNoteScore('HoldNoteScore_Held');
	if EXScore(player) == "On" then
		s = w1*3 + w2*2 + w3 + hd*3;
	else
		if PREFSMAN:GetPreference("AllowW1")~="AllowW1_Everywhere" then
			w1 = w1+w2;
			w2 = 0;
		end;
		s = (math.round( (w1 + w2 + w3/2+hd)*100000/maxsteps-(w2 + w3))*10);
	end;
	return s;
end;

local bTargetScore = TargetScore(player);

if not GAMESTATE:IsDemonstration() and not GAMESTATE:IsCourseMode() and GAMESTATE:GetPlayMode() == 'PlayMode_Regular' and bTargetScore ~= "off" then

	local bEXScore = EXScore(player);
	
	local function GetMachinePersonalHighScores()
		local profile;
		if bTargetScore == "personal" then
			if PROFILEMAN:IsPersistentProfile(player) then
				profile = PROFILEMAN:GetProfile(player);
			else
				profile = PROFILEMAN:GetMachineProfile();
			end;
		else
			profile = PROFILEMAN:GetMachineProfile();
		end;
		local song = GAMESTATE:GetCurrentSong()
		local diff = GAMESTATE:GetCurrentSteps(player):GetDifficulty()
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
		assert(scorelist);
		return scorelist:GetHighScores();
	end;

	local p=((player == PLAYER_1) and 1 or 2);

	local steps = GAMESTATE:GetCurrentSteps(player);
	local rv = steps:GetRadarValues(player);
	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(player);
	local maxsteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')
	+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);

	local scores = GetMachinePersonalHighScores(player);
	assert(scores);
	local topscore=0;
	if scores[1] then
		for i = 1, #scores do
			if scores[i] then
				local topscore2 = GetNormalScore(maxsteps,scores[i],player);
				if topscore2 > topscore then
					topscore = topscore2;
				end;
			else
				break;
			end;
		end;
	end;
	assert(topscore);

	if topscore == 0 then return end
			
	local moto = topscore/maxsteps;
	
	setenv("TopScoreSave"..pname,topscore);
	
	t[#t+1] = Def.ActorFrame {
		LifeChangedMessageCommand=function(self,params)
			if params.Player ~= player then return end;
			if params.LivesLeft == 0 then
				self:visible(false);
			else
				self:visible(true);
			end;
		end;
		LoadFont("TargetScore numbers") .. {
			InitCommand=function(self)
				self:x((player == PLAYER_1) and SCREEN_CENTER_X-190 or SCREEN_CENTER_X+290);
				self:y(SCREEN_CENTER_Y-60);
				self:zoom(0.5);
				(cmd(horizalign,right;strokecolor,color("#000000")))(self)
			end;
			OnCommand=function(self)
				if GAMESTATE:GetCurrentStyle():GetName() == "double" then
					self:x(SCREEN_CENTER_X+55)
				end
			end;
			LifeChangedMessageCommand=function(self,params)
				if params.Player ~= PLAYER_2 then return end
				if params.LifeMeter:GetLife() == 0 then
					self:visible(false)
					playerFailed = true
				end
			end;
			JudgmentMessageCommand=function(self,params)
				if params.Player ~= player then return end;
				if GAMESTATE:GetPlayerState(PLAYER_2):GetHealthState() == "HealthState_Dead" then return end
				self:finishtweening();
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
				   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then
					local ret=0;
					local w1=pss:GetTapNoteScores('TapNoteScore_W1');
					local w2=pss:GetTapNoteScores('TapNoteScore_W2');
					local w3=pss:GetTapNoteScores('TapNoteScore_W3');
					local hd=pss:GetHoldNoteScores('HoldNoteScore_Held');
					if params.HoldNoteScore=='HoldNoteScore_Held' then
						hd=hd+1;
					elseif params.TapNoteScore=='TapNoteScore_W1' then
						w1=w1+1;
					elseif params.TapNoteScore=='TapNoteScore_W2' then
						w2=w2+1;
					elseif params.TapNoteScore=='TapNoteScore_W3' then
						w3=w3+1;
					end;
					
					if bEXScore == "On" then
						ret = w1*3 + w2*2 + w3;
						ts[p] = ts[p] + moto
						local last = math.round((ret-ts[p]));
						if last > 0 then
							self:diffuse(color("#766fbd"));
							self:settext("+"..last);
						elseif last < 0 then
							self:diffuse(color("#bd727f"));
							self:settext(last);
						else
							self:diffuse(color("#ffffff"));
							self:settext("0");
						end;
					else
						ret=(math.round((w1 + w2 + w3/2 + hd) *100000/maxsteps-(w2 + w3))*10);
						ts[p] = ts[p] + moto
						local last = math.round((ret-ts[p])*0.1);
						if last > 0 then
							self:diffuse(color("#766fbd"));
							self:settext("+"..last*10);
						elseif last < 0 then
							self:diffuse(color("#bd727f"));
							self:settext(last*10);
						else
							self:diffuse(color("#ffffff"));
							self:settext("+0");
						end;
					end;
					
					TargetScore_JudgeCmdsPlayer[params.TapNoteScore](self)
				end;
			end;
		};
	};
else
	setenv("TopScoreSave"..pname,0);
end;

return t;
