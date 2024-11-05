return Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("ScreenCompany","Sound")) end,
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#b60014")):FullScreen() end,
		OnCommand=function(s) s:sleep(4.5):linear(0.4):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture="KONAMI_1",
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) 
			s:diffusealpha(0):linear(0.25):diffusealpha(1):sleep(4):linear(0.25):diffusealpha(0)
		end,
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#b60014")):FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(3):linear(0.4):diffusealpha(1) end,
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#ffffff")):FullScreen() end,
		OnCommand=function(s) s:diffusealpha(0):sleep(4):linear(0.5):diffusealpha(1) end,
	};
	Def.Sprite{
		Texture=Language().."BEMANI",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.766) end,
		OnCommand=function(s)
			s:sleep(4):linear(0.4):diffusealpha(1):sleep(2):linear(0.4):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture="EAMUSEMENT",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.6) end,
		OnCommand=function(s)
			s:sleep(7):linear(0.4):diffusealpha(1):sleep(2):linear(0.4):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture=Language().."RSA",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.667) end,
		OnCommand=function(s)
			s:sleep(10):linear(0.4):diffusealpha(1):sleep(2):linear(0.4):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture="license1",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.667) end,
		OnCommand=function(s)
			s:sleep(13):linear(0.25):diffusealpha(1):sleep(0.45):linear(0.25):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture="license2",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.667) end,
		OnCommand=function(s)
			s:sleep(14):linear(0.25):diffusealpha(1):sleep(0.45):linear(0.25):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture="license3",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.667) end,
		OnCommand=function(s)
			s:sleep(15):linear(0.25):diffusealpha(1):sleep(0.45):linear(0.25):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture="license4",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.667) end,
		OnCommand=function(s)
			s:sleep(16):linear(0.25):diffusealpha(1):sleep(0.45):linear(0.25):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture="license5",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.667) end,
		OnCommand=function(s)
			s:sleep(17):linear(0.25):diffusealpha(1):sleep(0.45):linear(0.25):diffusealpha(0)
		end,
	};
};