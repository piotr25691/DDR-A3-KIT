local screenname = Var "LoadingScreen"
local paseli = 78742 -- 500 USD
local paseliPrice = 157 -- 1 USD
local function PaseliText_P1()
	--Text of "EXTRA PASELI : XX"
	local text = LoadFont("Common Normal") .. {
		InitCommand = cmd(draworder,99;x,SCREEN_LEFT+7;y,SCREEN_BOTTOM-7.5;zoom,0.42;strokecolor,color("0.3,0.3,0.3,1");playcommand,"Refresh");
		RefreshCommand = function(self)
			local netConnected = IsNetConnected()
			self:horizalign(left)
			if not netConnected then self:settext('') return end 
			if GAMESTATE:IsSideJoined(PLAYER_1) then
			    self:settext('PASELI: '..paseli):playcommand("TestHome"):playcommand("TestFree"):playcommand("UpdateVisible") return end
			if GAMESTATE:IsEventMode() then self:settext('PASELI: NOT AVAILABLE'):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Free' then self:settext('PASELI: NOT AVAILABLE'):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Pay' then self:settext('EXTRA PASELI: 0'):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Home' then self:settext('') return end

		end;
                 DeductPaseliCommand = function(self)
                 if GAMESTATE:IsSideJoined(PLAYER_1) and paseli >= paseliPrice then 
		     paseli = paseli-paseliPrice
                     return end
                 end;
		TestHomeCommand = function(self)
		if GAMESTATE:GetCoinMode()=='CoinMode_Home' then self:settext('') return end
		end;
		TestFreeCommand = function(self)
		if GAMESTATE:GetCoinMode()=='CoinMode_Free' then self:settext('PASELI: NOT AVAILABLE') return end
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end;
			self:visible( bShow );
		end;
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"DeductPaseli";);
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

local function PaseliText_P2()
	--Text of "EXTRA PASELI : XX"
	local text = LoadFont("Common Normal") .. {
		InitCommand = cmd(draworder,99;x,SCREEN_RIGHT-7;y,SCREEN_BOTTOM-7.5;zoom,0.42;strokecolor,color("0.3,0.3,0.3,1");playcommand,"Refresh");
		RefreshCommand = function(self)
			local netConnected = IsNetConnected()
			self:horizalign(right)
			if not netConnected then self:settext('') return end
			if GAMESTATE:IsSideJoined(PLAYER_2) then
			    self:settext('PASELI: '..paseli):playcommand("TestHome"):playcommand("TestFree"):playcommand("UpdateVisible")  return end
			if GAMESTATE:IsEventMode() then self:settext('PASELI: NOT AVAILABLE'):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Free' then self:settext('PASELI: NOT AVAILABLE'):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Pay' then self:settext('EXTRA PASELI: 0'):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Home' then self:settext('') return end 
		end;
                DeductPaseliCommand = function(self)
                if GAMESTATE:IsSideJoined(PLAYER_2) and paseli >= paseliPrice then 
                    paseli = paseli-paseliPrice
                    return end
                end;
		TestHomeCommand = function(self)
		if GAMESTATE:GetCoinMode()=='CoinMode_Home' then self:settext('') return end
		end;
		TestFreeCommand = function(self)
		if GAMESTATE:GetCoinMode()=='CoinMode_Free' then self:settext('PASELI: NOT AVAILABLE') return end
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end;
			self:visible( bShow );
		end;
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"DeductPaseli";);
            ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;



local function CreditsText()
	local text = LoadFont("Common Normal") .. {
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-7.5;zoom,0.42;strokecolor,color("0.3,0.3,0.3,1");playcommand,"Refresh");
		RefreshCommand=function(self)
		--Other coin modes
			if GAMESTATE:IsEventMode() then self:settext('EVENT MODE'):playcommand("UpdateVisible") return end
			--if GAMESTATE:IsEventMode() then self:settext('CREDIT : 0') return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Free' then self:settext('FREE PLAY'):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Home' then self:settext('HOME MODE'):playcommand("UpdateVisible") return end
		--Normal pay
			local coins=GAMESTATE:GetCoins()
			local coinsPerCredit=PREFSMAN:GetPreference('CoinsPerCredit')
			local credits=math.floor(coins/coinsPerCredit)
			local remainder=math.mod(coins,coinsPerCredit)
			local s='CREDIT: '
			if credits > 1 then
				s='CREDITS: '..credits
			elseif credits == 1 then
				s=s..credits
			else
				s=s..0
			end
			--self:horizalign(left)
			self:settext(s):playcommand("UpdateVisible")
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end;

			self:visible( bShow );
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"DeductPaseli");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

local function CoinsText()
	local text = LoadFont("Common Normal") .. {
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X+80;y,SCREEN_BOTTOM-7.5;zoom,0.42;strokecolor,color("0.3,0.3,0.3,1");horizalign,center;playcommand,"Refresh");
		RefreshCommand=function(self)
			local coins=GAMESTATE:GetCoins()
			local coinsPerCredit=PREFSMAN:GetPreference('CoinsPerCredit')
			local remainder=math.mod(coins,coinsPerCredit)
			local s='COIN: '
			if coinsPerCredit > 1 then
				s=s..remainder..'/'..coinsPerCredit
			else
				s=''
			end

			if not GAMESTATE:GetCoinMode() == 'CoinMode_Pay' then
				self:settext('');
			end

			self:settext(s):playcommand("UpdateVisible")
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end;

			self:visible( bShow );
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

local function NetworkText()
	local text = LoadFont("Common Normal") .. {
		InitCommand=function (self)
			self:draworder(99);
			self:name("NetworkStatus");
			self:settext("-----");
			self:x(SCREEN_CENTER_X-177);
			self:y(SCREEN_BOTTOM-7.5);
			self:horizalign(right);
        	self:zoom(0.42)
			self:strokecolor(color("0.3,0.3,0.3,1"));
		end;
		RefreshCommand=function (self)
			local netConnected = IsNetConnected();

			if netConnected then
				self:diffuse(color("#00FF00"));
				self:settext("ONLINE"):playcommand("UpdateVisible");
			else
				self:diffuse(color("#888888"));
				self:settext("LOCAL MODE"):playcommand("UpdateVisible");
			end
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end

			self:visible( bShow );
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

local t = Def.ActorFrame {}
local netConnected = IsNetConnected();

t[#t+1] = Def.ActorFrame {
	NetworkText();
	CreditsText();
	CoinsText();
	PaseliText_P1();
	PaseliText_P2();
};

return t;
