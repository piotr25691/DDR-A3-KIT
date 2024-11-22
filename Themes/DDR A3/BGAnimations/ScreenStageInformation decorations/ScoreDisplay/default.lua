local t = Def.ActorFrame{};
local SleepOffset = 0.3;
local cx = 640
local ox = 450

local regions = {
	-- United States
    Alabama = {"Alabama", "アラバマ州", "앨라배마주"},
    Alaska = {"Alaska", "アラスカ州", "알래스카주"},
    Arizona = {"Arizona", "アリゾナ州", "애리조나주"},
    Arkansas = {"Arkansas", "アーカンソー州", "아칸소주"},
    California = {"California", "カリフォルニア州", "캘리포니아주"},
    Colorado = {"Colorado", "コロラド州", "콜로라도주"},
    Connecticut = {"Connecticut", "コネチカット州", "코네티컷주"},
    Delaware = {"Delaware", "デラウェア州", "델라웨어주"},
    Florida = {"Florida", "フロリダ州", "플로리다주"},
    Georgia = {"Georgia", "ジョージア州", "조지아주"},
    Hawaii = {"Hawaii", "ハワイ州", "하와이주"},
    Idaho = {"Idaho", "アイダホ州", "아이다호주"},
    Illinois = {"Illinois", "イリノイ州", "일리노이주"},
    Indiana = {"Indiana", "インディアナ州", "인디애나주"},
    Iowa = {"Iowa", "アイオワ州", "아이오와주"},
    Kansas = {"Kansas", "カンザス州", "캔자스주"},
    Kentucky = {"Kentucky", "ケンタッキー州", "켄터키주"},
    Louisiana = {"Louisiana", "ルイジアナ州", "루이지애나주"},
    Maine = {"Maine", "メイン州", "메인주"},
    Maryland = {"Maryland", "メリーランド州", "메릴랜드주"},
    Massachusetts = {"Massachusetts", "マサチューセッツ州", "매사추세츠주"},
    Michigan = {"Michigan", "ミシガン州", "미시간주"},
    Minnesota = {"Minnesota", "ミネソタ州", "미네소타주"},
    Mississippi = {"Mississippi", "ミシシッピ州", "미시시피주"},
    Missouri = {"Missouri", "ミズーリ州", "미주리주"},
    Montana = {"Montana", "モンタナ州", "몬태나주"},
    Nebraska = {"Nebraska", "ネブラスカ州", "네브래스카주"},
    Nevada = {"Nevada", "ネバダ州", "네바다주"},
    New_Hampshire = {"New Hampshire", "ニューハンプシャー州", "뉴햄프셔주"},
    New_Jersey = {"New Jersey", "ニュージャージー州", "뉴저지주"},
    New_Mexico = {"New Mexico", "ニューメキシコ州", "뉴멕시코주"},
    New_York = {"New York", "ニューヨーク州", "뉴욕주"},
    North_Carolina = {"North Carolina", "ノースカロライナ州", "노스캐롤라이나주"},
    North_Dakota = {"North Dakota", "ノースダコタ州", "노스다코타주"},
    Ohio = {"Ohio", "オハイオ州", "오하이오주"},
    Oklahoma = {"Oklahoma", "オクラホマ州", "오클라호마주"},
    Oregon = {"Oregon", "オレゴン州", "오리건주"},
    Pennsylvania = {"Pennsylvania", "ペンシルベニア州", "펜실베이니아주"},
    Rhode_Island = {"Rhode Island", "ロードアイランド州", "로드아일랜드주"},
    South_Carolina = {"South Carolina", "サウスカロライナ州", "사우스캐롤라이나주"},
    South_Dakota = {"South Dakota", "サウスダコタ州", "사우스다코타주"},
    Tennessee = {"Tennessee", "テネシー州", "테네시주"},
    Texas = {"Texas", "テキサス州", "텍사스주"},
    Utah = {"Utah", "ユタ州", "유타주"},
    Vermont = {"Vermont", "バーモント州", "버몬트주"},
    Virginia = {"Virginia", "バージニア州", "버지니아주"},
    Washington = {"Washington", "ワシントン州", "워싱턴주"},
    West_Virginia = {"West Virginia", "ウェストバージニア州", "웨스트버지니아주"},
    Wisconsin = {"Wisconsin", "ウィスコンシン州", "위스콘신주"},
    Wyoming = {"Wyoming", "ワイオミング州", "와이오밍주"},

	-- Japan
    Aichi = {"Aichi", "愛知県", "아이치현"},
    Akita = {"Akita", "秋田県", "아키타현"},
    Aomori = {"Aomori", "青森県", "아오모리현"},
    Chiba = {"Chiba", "千葉県", "지바현"},
    Ehime = {"Ehime", "愛媛県", "에히메현"},
    Fukui = {"Fukui", "福井県", "후쿠이현"},
    Fukuoka = {"Fukuoka", "福岡県", "후쿠오카현"},
    Fukushima = {"Fukushima", "福島県", "후쿠시마현"},
    Gifu = {"Gifu", "岐阜県", "기후현"},
    Gunma = {"Gunma", "群馬県", "군마현"},
    Hiroshima = {"Hiroshima", "広島県", "히로시마현"},
    Hyogo = {"Hyogo", "兵庫県", "효고현"},
    Ibaraki = {"Ibaraki", "茨城県", "이바라키현"},
    Ishikawa = {"Ishikawa", "石川県", "이시카와현"},
    Iwate = {"Iwate", "岩手県", "이와테현"},
    Kagawa = {"Kagawa", "香川県", "가가와현"},
    Kagoshima = {"Kagoshima", "鹿児島県", "가고시마현"},
    Kanagawa = {"Kanagawa", "神奈川県", "가나가와현"},
    Kochi = {"Kochi", "高知県", "고치현"},
    Kumamoto = {"Kumamoto", "熊本県", "구마모토현"},
    Kyoto = {"Kyoto", "京都府", "교토부"},
    Mie = {"Mie", "三重県", "미에현"},
    Miyagi = {"Miyagi", "宮城県", "미야기현"},
    Miyazaki = {"Miyazaki", "宮崎県", "미야자키현"},
    Nagano = {"Nagano", "長野県", "나가노현"},
    Nagasaki = {"Nagasaki", "長崎県", "나가사키현"},
    Niigata = {"Niigata", "新潟県", "니가타현"},
    Oita = {"Oita", "大分県", "오이타현"},
    Okayama = {"Okayama", "岡山県", "오카야마현"},
    Osaka = {"Osaka", "大阪府", "오사카부"},
    Saga = {"Saga", "佐賀県", "사가현"},
    Saitama = {"Saitama", "埼玉県", "사이타마현"},
    Shiga = {"Shiga", "滋賀県", "시가현"},
    Shimane = {"Shimane", "島根県", "시마네현"},
    Shizuoka = {"Shizuoka", "静岡県", "시즈오카현"},
    Tochigi = {"Tochigi", "栃木県", "도치기현"},
    Tokushima = {"Tokushima", "徳島県", "도쿠시마현"},
    Tokyo = {"Tokyo", "東京都", "도쿄도"},
    Tottori = {"Tottori", "鳥取県", "돗토리현"},
    Toyama = {"Toyama", "富山県", "도야마현"},
    Wakayama = {"Wakayama", "和歌山県", "와카야마현"},
    Yamagata = {"Yamagata", "山形県", "야마가타현"},
    Yamaguchi = {"Yamaguchi", "山口県", "야마구치현"},
    Yamanashi = {"Yamanashi", "山梨県", "야마나시현"},
    Okinawa = {"Okinawa", "沖縄県", "오키나와현"},

	-- Other Regions
	Europe = {"Europe", "ヨーロッパ", "유럽"},
	Korea = {"Korea", "韓国", "한국"},
	World = {"World", "世界", "세계"}
}

function StageTopRecord(pn) --�^�ǳ̰��������Ӭ���
	local SongOrCourse, StepsOrTrail;
	local myScoreSet = {
		["HasScore"] = 0;
		["SongOrCourse"] =0;
		["topscore"] = 0;
		["topW1"]=0;
		["topW2"]=0;
		["topW3"]=0;
		["topW4"]=0;
		["topW4"]=0;
		["topMiss"]=0;
		["topOK"]=0;
		["topEXScore"]=0;
		["topMAXCombo"]=0;
		["topDate"]=0;
		};
		
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

		if PROFILEMAN:IsPersistentProfile(pn) then
			-- player profile
			profile = PROFILEMAN:GetProfile(pn);
		else
			-- machine profile
			profile = PROFILEMAN:GetMachineProfile();
		end;

		scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
		assert(scorelist);
		local scores = scorelist:GetHighScores();
		assert(scores);
		if scores[1] then
			myScoreSet["SongOrCourse"]=1;
			myScoreSet["HasScore"] = 1;
			myScoreSet["topscore"] = scores[1]:GetScore();
			myScoreSet["topW1"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1");
			myScoreSet["topW2"]  = scores[1]:GetTapNoteScore("TapNoteScore_W2");
			myScoreSet["topW3"]  = scores[1]:GetTapNoteScore("TapNoteScore_W3");
			myScoreSet["topW4"]  = scores[1]:GetTapNoteScore("TapNoteScore_W4");
			myScoreSet["topW4"]  = scores[1]:GetTapNoteScore("TapNoteScore_W4");
			myScoreSet["topMiss"]  = scores[1]:GetTapNoteScore("TapNoteScore_W4")+scores[1]:GetTapNoteScore("TapNoteScore_Miss");
			myScoreSet["topOK"]  = scores[1]:GetHoldNoteScore("HoldNoteScore_Held");
			--myScoreSet["topEXScore"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
			if (StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_TapsAndHolds" ) >=0) then --If it is not a random course
				if scores[1]:GetGrade() ~= "Grade_Failed" then
					myScoreSet["topEXScore"] = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
				else
					myScoreSet["topEXScore"] = (StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_TapsAndHolds" )*3+StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_Holds" )*3)*scores[1]:GetPercentDP();
				end
			else --If it is Random Course then the scores[1]:GetPercentDP() value will be -1
				if scores[1]:GetGrade() ~= "Grade_Failed" then
					myScoreSet["topEXScore"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
				else
					myScoreSet["topEXScore"]  = 0;
				end
			end
			myScoreSet["topMAXCombo"]  = scores[1]:GetMaxCombo();
			myScoreSet["topDate"]  = scores[1]:GetDate() ;
		else
			myScoreSet["SongOrCourse"]=1;
			myScoreSet["HasScore"] = 0;
		end;
	else
		myScoreSet["HasScore"] = 0;
		myScoreSet["SongOrCourse"]=0;
		
	end
	return myScoreSet;

end;

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1]=Def.ActorFrame{
	LoadActor(Model().."diff")..{
		InitCommand=function(self)
			self:x(pn == PLAYER_1 and cx-434-ox or cx+434+ox);
			self:y(SCREEN_BOTTOM+37)
			self:zoomx(pn == PLAYER_1 and 1 or -1)
		end;
		OnCommand=function(self)
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and cx-434 or cx+434);
		end;
	};
	Def.Sprite{
		Texture ="diff 1x6",
		InitCommand=function(s) s:y(SCREEN_BOTTOM+36)
		s:x(pn == PLAYER_1 and cx-546-ox or cx+546+ox)
		s:draworder(110):pause():queuecommand("Set") end,
		SetCommand=function(self)
			local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
			local sDifficulty = ToEnumShortString(diff);	
				if sDifficulty == 'Beginner' then
					self:setstate(0);
				elseif sDifficulty == 'Easy' then
					self:setstate(1);
				elseif sDifficulty == 'Medium' then
					self:setstate(2);
				elseif sDifficulty == 'Hard' then
					self:setstate(3);
				elseif sDifficulty == 'Challenge' then
					self:setstate(4);
				elseif sDifficulty == 'Edit' then
					self:setstate(5);
				end;
		end;
		OnCommand=function(s)
			s:sleep(SleepOffset+0.2):linear(0.05)
			s:x(pn == PLAYER_1 and cx-546 or cx+546) end,
	};
	LoadActor(Model().."best")..{
		InitCommand=function(self)
			self:x(pn == PLAYER_1 and cx-436-ox or cx+436+ox);
			self:y(SCREEN_BOTTOM+86)
		end;
		OnCommand=function(self)
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and cx-436 or cx+436);
		end;
	};
	Def.Sprite{
	InitCommand=function(s) s:zoom(0.27):shadowlength(1)
	s:x(pn == PLAYER_1 and cx-268-ox or cx+603+ox)
	s:y(SCREEN_BOTTOM+78):horizalign(center):draworder(2) end,
	OnCommand=function(self) self:sleep(SleepOffset+0.2):linear(0.05):x(pn == PLAYER_1 and cx-268 or cx+603)
            local song = GAMESTATE:GetCurrentSong();
			local st = GAMESTATE:GetCurrentStyle():GetStepsType();
			local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
			if song then
				if song:HasStepsTypeAndDifficulty(st,diff) then
					local steps = song:GetOneSteps( st, diff );
					local profile = MachineOrProfile(pn)
					local scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
					local scores = scorelist:GetHighScores();
						assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1];
							assert(topscore);
						local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
						local boos = topscore:GetTapNoteScore("TapNoteScore_W4")
						local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
						local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
						local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
						local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
						if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
							if (greats+perfects) == 0 then
								self:Load(THEME:GetPathG("","ScreenSelectMusic/MarvelousFullcombo_ring"))
							elseif greats == 0 then
								self:Load(THEME:GetPathG("","ScreenSelectMusic/PerfectFullcombo_ring"))
							elseif (misses+boos+goods) == 0 then
								self:Load(THEME:GetPathG("","ScreenSelectMusic/GreatFullcombo_ring"))
							elseif (misses+boos) == 0 then
								self:Load(THEME:GetPathG("","ScreenSelectMusic/GoodFullcombo_ring"))
							end;
							self:visible(true):spin():zoom(1):effectmagnitude(0,0,170)
						else
							self:visible(false)
						end;
					else
						self:visible(false)
					end;
                else
					self:visible(false)
				end;
            else
                self:visible(false)
            end;
        end;
	};
	Def.Quad{
	InitCommand=function(s) s:zoom(0.29):shadowlength(1)
	s:x(pn == PLAYER_1 and cx-288-ox or cx+576+ox)
	s:y(SCREEN_BOTTOM+76):horizalign(center):draworder(2) end,

		OnCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;
			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(pn) then
					-- player profile
					profile = PROFILEMAN:GetProfile(pn);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1]:GetScore();
					end;
					assert(topscore);
					local topgrade;
					local temp=#scores;
						if scores[1] then
							for i=1,temp do 
								topgrade = scores[1]:GetGrade();
								curgrade = scores[i]:GetGrade();
								assert(topgrade);
								if scores[1]:GetScore()>1  then
									if scores[1]:GetScore()==1000000 and scores[1]:GetGrade() =="Grade_Tier17" then --AutoPlayHack
                                self:LoadBackground(THEME:GetPathG("","Grade/Grade_Tier01"));
                                self:diffusealpha(1);
                                break;
                            else --Normal
                                if ToEnumShortString(curgrade) ~= "Failed" then --current Rank is not Failed
                                    self:LoadBackground(THEME:GetPathG("","Grade/Grade_"..ToEnumShortString(curgrade)));
                                    self:diffusealpha(1);
                                    break;
                                else --current Rank is Failed
                                    if i == temp then
                                        self:LoadBackground(THEME:GetPathG("","Grade/Grade_"..ToEnumShortString(curgrade)));
                                        self:diffusealpha(1);
                                        break;
                                    end;
                                end;
                            end;
								else
									self:diffusealpha(0);
								end;
							end;
						else
							self:diffusealpha(0);
						end;
			else
				self:diffusealpha(0);
			end;
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and cx-288 or cx+576);
		end;
	};
	
	scstring="";
	
	Def.RollingNumbers { -- Topscore
			File = THEME:GetPathF("_helveticaneuelt pro 65 md","24px");
			InitCommand=function(s) s:shadowlength(0):zoomy(0.80):zoomx(1.85):maxwidth(240)
			s:x(pn == PLAYER_1 and cx-475-ox or cx+395+ox)
			s:y(SCREEN_BOTTOM+80) end,
			OnCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersCourseData");
				else
					--self:Load("RollingNumbersSongData");
					self:Load("RollingNumbersStageInScore");
				end
				self:diffuse(color("1,1,0.38,1"));
				self:strokecolor(color("0.0,0.0,0.0,1"));
				myScoreSet = StageTopRecord(pn);
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topscore"];
						
						self:diffusealpha(1);
						
						self:targetnumber(topscore);
						scstring = topscore;
					else
						self:diffusealpha(1);

						self:targetnumber(0);
						scstring = 0;
					end
				else
					self:diffusealpha(0);
				end
				self:sleep(SleepOffset+0.2):linear(0.05)
				self:x(pn == PLAYER_1 and cx-475 or cx+395);
			end;
	};
	

	--[[--Topscore mod P1
	LoadFont("_helveticaneuelt pro 65 md 24px") .. {
		Text = scstring;
		InitCommand=function(s) s:shadowlength(0):zoomy(0.80):zoomx(1.85):maxwidth(240)
			s:x(pn == PLAYER_1 and SCREEN_LEFT-OffsetX-40 or SCREEN_RIGHT+OffsetX-40)
			s:y(_screen.cy+280):horizalign(center) end,
		OnCommand=function(self)
			self:diffuse(color("1,1,0.28,1"));
			self:strokecolor(color("0.0,0.0,0.0,1"));
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and SCREEN_LEFT+OffsetX-40 or SCREEN_RIGHT-OffsetX-40);
		end;
	};]]

	
	--Name
	LoadFont("_helveticaneuelt pro 65 md 24px") .. {
		Text=PROFILEMAN:GetProfile(pn):GetDisplayName();
		InitCommand=function(s) s:maxwidth(180):zoomy(0.8):zoomx(1.4)
			s:x(pn == PLAYER_1 and cx-527-ox or cx+342+ox)
			s:y(SCREEN_BOTTOM+110):strokecolor(Color("Outline")):maxwidth(120) end,
		OnCommand=function(self)
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and cx-527 or cx+342);
		end;
	};

	LoadFont("_helveticaneuelt pro 65 md 24px") .. {
		InitCommand=function(s) s:maxwidth(180):zoomy(0.6):zoom(0.8)
			s:x(pn == PLAYER_1 and cx-307-ox or cx+562+ox)
			s:y(SCREEN_BOTTOM+110):strokecolor(Color("Outline")):maxwidth(120) end,
		OnCommand=function(self)
			self:sleep(SleepOffset+0.2):linear(0.05);
			self:x(pn == PLAYER_1 and cx-307 or cx+562);
			self:skewx(-0.1);

			local index

			if Language() == "en_" then
				index = 1
			elseif Language() == "jp_" then
				index = 2
			elseif Language() == "kor_" then
				index = 3
			else
				index = 2
			end

			self:settext(regions.World[index])
		end;
	};
};
end;
	
return t;