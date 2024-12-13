return Def.ActorFrame{
	
	Def.Sound{
		File=THEME:GetPathS("ScreenEvaluation","ExtraStage"),
		OnCommand=function(s) s:sleep(4.5):queuecommand("Play") end,
		PlayCommand=function(s) s:play() end,
	};
	
	Def.ActorFrame{
		InitCommand=function(s) s:xy(_screen.cx,_screen.cy+184) end,
		OnCommand=function(s) s:diffusealpha(0):zoomx(1.5):zoomy(0.667):sleep(4.5):diffusealpha(1):linear(0.1):zoomx(0.667):queuecommand("Animate") end,
		AnimateCommand=function(s) s:sleep(0.7):linear(1):diffusealpha(0.2):linear(0.5):diffusealpha(1):queuecommand("Animate") end,
		OffCommand=function(s) s:stoptweening():linear(0.1):zoomx(0.23):zoomy(0) end,
		LoadActor("bg");
		LoadActor("tex");
	};
};