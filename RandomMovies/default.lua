local t = Def.ActorFrame{
	InitCommand=cmd();
}

local rmax = 9;
local num = math.random(11,33);

t[#t+1] = LoadActor( "Char"..num )..{
InitCommand=cmd(draworder,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;decelerate,100;diffusealpha,1);
};
	
return t;
	
