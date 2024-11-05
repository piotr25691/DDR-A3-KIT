local pn = ...

local function RivalScore(pn,rival)
    local t=Def.ActorFrame {
        CurrentSongChangedMessageCommand=function(s) s:finishtweening():queuecommand("Set") end,
        ["CurrentSteps" .. ToEnumShortString(pn) .. "ChangedMessageCommand"]=function(s) s:finishtweening():queuecommand("Set") end,
        Def.BitmapText{
            Font="_geo 9 20px",
            InitCommand=function(self)
                self:xy(pn==PLAYER_1 and -35 or -55,9);
                self:halign(0)
                self:diffuse(Color("Black"));
                if (rival ~= 1) then
                    self:diffuse(Color("White"));
                end;
            end;
            SetCommand=function(self)
                local SongOrCourse, StepsOrTrail;
                if GAMESTATE:IsCourseMode() then
                    SongOrCourse = GAMESTATE:GetCurrentCourse();
                    StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
                else
                    SongOrCourse = GAMESTATE:GetCurrentSong();
                    StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
                end;
    
                local profile, scorelist;
                if SongOrCourse and StepsOrTrail then
                    local st = StepsOrTrail:GetStepsType();
                    local diff = StepsOrTrail:GetDifficulty();
                    local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
                    local profile = PROFILEMAN:GetProfile(pn)
                    scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
                    assert(scorelist)
                    local scores = scorelist:GetHighScores();
                    
                    if scores[rival] then
						self:settext(string.upper(PROFILEMAN:GetPlayerName(pn)))
						self:maxwidth(120)
                    else
                        self:settext("")
                    end;
                end;
            end;
        };
        Def.RollingNumbers {
            File = THEME:GetPathF("_geo 95","20px");
            InitCommand=function(self)
                self:x(pn==PLAYER_1 and 140 or 117);
                self:halign(0.85)
                self:diffuse(Color("Black"));
                if (rival ~= 1) then
                    self:diffuse(Color("White"));
                end;
            end;
            BeginCommand=cmd(playcommand,"Set");
            SetCommand=function(self)
                local SongOrCourse, StepsOrTrail;
                if GAMESTATE:IsCourseMode() then
                    SongOrCourse = GAMESTATE:GetCurrentCourse();
                    StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
                else
                    SongOrCourse = GAMESTATE:GetCurrentSong();
                    StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
                end;
    
                local profile, scorelist;
                local topscore=0;
                if SongOrCourse and StepsOrTrail then
                    local st = StepsOrTrail:GetStepsType();
                    local diff = StepsOrTrail:GetDifficulty();
                    local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
                    local profile = PROFILEMAN:GetProfile(pn)
                    scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
                    assert(scorelist)
                    local scores = scorelist:GetHighScores();
                    
                    if scores[rival] then
                        if scores[rival]:GetScore() > 1 then
                            topscore = scores[rival]:GetScore();
                            self:visible(true)
                        else
                            topscore = 0
                            self:visible(false)
                        end
                    else
                        topscore = 0
                        self:visible(false)
                    end;
                    assert(topscore);
                    
                end;
                self:Load("RollingNumbersSongData");
                self:targetnumber(topscore);
            end;
        };
    };
    return t;
end

return Def.ActorFrame{
	Def.Sprite{
        Texture=Model().."frame",
        InitCommand=function(s) s:valign(0):xy(pn==PLAYER_1 and -11 or 10, 22):zoom(0.846) end,
    };
	Def.Sprite{
        Texture=Model().."scorebg",
        InitCommand=function(s) s:valign(0):xy(pn==PLAYER_1 and -12 or 12, 55):zoom(0.85) end,
    };
    Def.Sprite{
        Texture=Language().."machine",
        InitCommand=function(s) s:valign(0):xy(pn==PLAYER_1 and -104 or -79, 71):diffuse(color("#000000")):zoom(0.85) end,
    };
    Def.Sprite{
        Texture="rival1",
        InitCommand=function(s) s:valign(0):xy(pn==PLAYER_1 and -104 or -79, 94):zoom(0.85) end,
    };
    Def.Sprite{
        Texture="rival2",
        InitCommand=function(s) s:valign(0):xy(pn==PLAYER_1 and -104 or -79, 117):zoom(0.85) end,
    };
    Def.Sprite{
        Texture="rival3",
        InitCommand=function(s) s:valign(0):xy(pn==PLAYER_1 and -104 or -79, 139):zoom(0.85) end,
    };
	Def.ActorFrame{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and -25 or 20, 23):zoom(0.9) end,
		RivalScore(pn,1)..{
			InitCommand=function(s) s:y(53) end,
		};
	};
}