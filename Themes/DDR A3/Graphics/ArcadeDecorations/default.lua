local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	Def.Sprite{
		Texture="icon",
		InitCommand=function(s) s:zoom(0.655):x(SCREEN_RIGHT-29.3):y(SCREEN_TOP+115) end,
	};
	Def.Sprite{
		Texture=Language().."paseli",
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+355,IsTitleMenu() and _screen.cy+135 or _screen.cy+201) end,
	};
	LoadActor(Model().."base")..{
		InitCommand=function(s) s:diffusealpha(IsTitleMenu() and 0 or 1):xy(_screen.cx,_screen.cy+187):setsize(386,56) end,
	};
};
	
if not IsTitleMenu() then
	t[#t+1] = Def.Sprite{
		InitCommand=function(s) s:zoom(0.6):xy(_screen.cx,_screen.cy+186):queuecommand("Set") end,
		CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
		SetCommand=function(s)
			if GAMESTATE:GetCoinMode() == 'CoinMode_Free' then
				s:Load(THEME:GetPathG("","ArcadeDecorations/"..Model()..Language().."start"))
				s:diffusealpha(1):diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5):sleep(2.5):diffusealpha(0):sleep(2.5):queuecommand("Set") 
			elseif GAMESTATE:GetCoinMode() == "CoinMode_Home" then
				s:Load(THEME:GetPathG("","ArcadeDecorations/"..Model()..Language().."start"))
				s:diffusealpha(1):diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5):sleep(2.5):diffusealpha(0):sleep(2.5):queuecommand("Set")    
			else
				if GAMESTATE:EnoughCreditsToJoin() == true then
					s:Load(THEME:GetPathG("","ArcadeDecorations/"..Model()..Language().."start"))
					s:diffusealpha(1):diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5):sleep(2.5):diffusealpha(0):sleep(2.5):queuecommand("Set")     
				else
					s:Load(THEME:GetPathG("","ArcadeDecorations/coin"))
					s:diffusealpha(1):diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#b4ff01")):effectperiod(2.5):sleep(2.5):diffusealpha(0):sleep(2.5):queuecommand("Set")   
				end
			end
		end
	};
	if GetCurrentModel() == "Gold" then
		t[#t+1] = Def.Sprite{
			InitCommand=function(s) s:zoom(0.6):xy(_screen.cx,_screen.cy+186):queuecommand("Set") end,
			CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
			SetCommand=function(s)
				if GAMESTATE:GetCoinMode() == 'CoinMode_Free' then
					s:Load(THEME:GetPathG("","ArcadeDecorations/"..Language().."button"))
					s:diffusealpha(1):sleep(2.5):diffusealpha(0):sleep(2.5):queuecommand("Set") 
				elseif GAMESTATE:GetCoinMode() == "CoinMode_Home" then
					s:Load(THEME:GetPathG("","ArcadeDecorations/"..Language().."button"))
					s:diffusealpha(1):sleep(2.5):diffusealpha(0):sleep(2.5):queuecommand("Set") 
				else
					if GAMESTATE:EnoughCreditsToJoin() == true then
						s:Load(THEME:GetPathG("","ArcadeDecorations/"..Language().."button"))
						s:diffusealpha(1):sleep(2.5):diffusealpha(0):sleep(2.5):queuecommand("Set") 
					end
				end
			end
		};
	end

	t[#t+1] = Def.Sprite{
		InitCommand=function(s) s:zoom(0.6):xy(_screen.cx,_screen.cy+186):queuecommand("Set") end,
		CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
		SetCommand=function(s)
			if GAMESTATE:GetCoinMode() == 'CoinMode_Free' then
				s:Load(THEME:GetPathG("","ArcadeDecorations/"..Language().."eamuse"))
				s:diffusealpha(0):sleep(2.5):diffusealpha(1):diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5):sleep(2.5):diffusealpha(0):queuecommand("Set") 
			elseif GAMESTATE:GetCoinMode() == "CoinMode_Home" then
				s:Load(THEME:GetPathG("","ArcadeDecorations/"..Language().."eamuse"))
				s:diffusealpha(0):sleep(2.5):diffusealpha(1):diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5):sleep(2.5):diffusealpha(0):queuecommand("Set")    
			else
				if GAMESTATE:EnoughCreditsToJoin() == true then
					s:Load(THEME:GetPathG("","ArcadeDecorations/"..Language().."eamuse"))
					s:diffusealpha(0):sleep(2.5):diffusealpha(1):diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5):sleep(2.5):diffusealpha(0):queuecommand("Set")     
				else
					s:Load(THEME:GetPathG("","ArcadeDecorations/"..Language().."eamuse"))
					s:diffusealpha(0):sleep(2.5):diffusealpha(1):diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#b4ff01")):effectperiod(2.5):sleep(2.5):diffusealpha(0):queuecommand("Set")   
				end
			end
		end
	};
end 

return t