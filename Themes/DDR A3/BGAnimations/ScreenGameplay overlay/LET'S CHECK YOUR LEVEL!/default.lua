local SMSleep = 0;

return Def.ActorFrame{
	InitCommand=function(s) s:x(_screen.cx):y(SCREEN_BOTTOM-100):zoom(0.55) end,
	LoadActor("1")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+4.3):diffusealpha(1)
		s:sleep(4.7):diffusealpha(0) end,
	};
	LoadActor("2")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+9):diffusealpha(1)
		s:sleep(4.3):diffusealpha(0) end,
	};
	LoadActor("3")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+13.3):diffusealpha(1)
		s:sleep(4.3):diffusealpha(0) end,
	};
};