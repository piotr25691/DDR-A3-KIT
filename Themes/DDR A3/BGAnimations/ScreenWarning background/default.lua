return Def.ActorFrame {
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#ffffff")):FullScreen():diffusealpha(1) end,
		OnCommand=function(s) s:sleep(1):linear(1):diffusealpha(0) end,
	};
	LoadActor(Model().."jp_warning")..{
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(1):linear(0.25):diffusealpha(1):sleep(3):linear(0.25):diffusealpha(0) end,
		SOUND:StopMusic()
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#b60014")):FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(4):linear(0.25):diffusealpha(1) end,
	};
};
