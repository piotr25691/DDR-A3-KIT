-- TargetScore (A3)
-- Sourced from https://josevarela.net/SMArchive/Themes/ThemePreview.php?Category=StepMania%205&ID=DDR2013
-- Modified for DDR A3 theme with realistic behavior

local player = PLAYER_2;
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local pname = ToEnumShortString(player);
local ts = 0;
local minesJudged = 0;

local playerFailed = false;
local isMine = false;

local t = Def.ActorFrame {};

local rn_type = "RollingNumbers"
local data_source = "AScoring"

if IsEXScore() then
	rn_type = "RollingNumbersEXScore"
    data_source = "EXScore"
end

if not GAMESTATE:IsDemonstration() and not GAMESTATE:IsCourseMode() and GAMESTATE:GetPlayMode() == 'PlayMode_Regular' then
	local p=((player == PLAYER_2) and 1 or 2);

	local steps = GAMESTATE:GetCurrentSteps(player);
	local rv = steps:GetRadarValues(player);
	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(player);
	local song = GAMESTATE:GetCurrentSong()
	local maxsteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')
	+rv:GetValue('RadarCategory_Holds')
	+rv:GetValue('RadarCategory_Rolls')
	+math.floor(rv:GetValue('RadarCategory_Mines')/4),1);

	if PROFILEMAN:IsPersistentProfile(player) then
		profile = PROFILEMAN:GetProfile(player)
	else
		profile = PROFILEMAN:GetMachineProfile()
	end

	scorelist = profile:GetHighScoreList(song,steps)
	local scores = scorelist:GetHighScores()
	local topscore = 0

	if scores[1] then
		topscore = scores[1]:GetScore()
	end;

	assert(topscore);
			
	local moto=topscore/maxsteps;
	
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
				self:x((player == PLAYER_2) and SCREEN_CENTER_X-190 or SCREEN_CENTER_X+290);
				self:y(SCREEN_CENTER_Y-60);
				self:zoom(0.5);
				(cmd(horizalign,right;strokecolor,color("#000000")))(self)

				if topscore == 0 or topscore == 1000000 then
					self:visible(false)
				end
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
				if params.TapNoteScore == "TapNoteScore_AvoidMine" then
					isMine = true
					minesJudged = minesJudged + 1;
				else
					isMine = false
					minesJudged = 0
				end
			end;
			AfterStatsEngineMessageCommand=function(self,params)
				if GAMESTATE:GetPlayerState(PLAYER_2):GetHealthState() == "HealthState_Dead" then return end
				if params.Player ~= player then return end;
				if (GAMESTATE:GetSongBeat() >= GAMESTATE:GetCurrentSong():GetLastBeat()) then return end
				self:finishtweening();

				ret=params.Data[data_source].Score

				if isMine and minesJudged == 4 then
					ts = ts + moto
					minesJudged = 0
				elseif not isMine then
					ts = ts + moto
				end

				local last = math.round((ret-ts)*0.1);

				if last > 0 then
					self:diffuse(color("#766fbd"));
					self:settext("+"..last*10);
				elseif last < 0 then
					self:diffuse(color("#bd727f"));
					self:settext(last*10);
				else
					self:diffuse(color("#ffffff"));
					self:settext("±0");
				end;
			end;
		};
	};
end;

return t;
