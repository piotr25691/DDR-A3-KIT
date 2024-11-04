local t = Def.ActorFrame{}

	
t[#t+1] =Def.Quad {
	InitCommand=function(s) s:diffuse(color("#000000")):FullScreen():diffusealpha(1) end,
}

t[#t+1] = Def.BitmapText {
	Font="Common Normal",
	Text="MAIN MENU",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,30):zoom(0.8):zoomx(0.7):diffuse(color("#ffffff")) end,
}

t[#t+1] = Def.BitmapText {
	Font="Common Normal",
	Text="SERVICE BUTTON = EXECUTE",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM-30):zoom(0.5):zoomx(0.4):diffuse(color("#ffffff")) end,
}
t[#t+1] = Def.BitmapText {
	Font="Common Normal",
	Text="TEST BUTTON = SELECT ITEM",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM-45):zoom(0.5):zoomx(0.4):diffuse(color("#ffffff")) end,
}
t[#t+1] = Def.BitmapText {
	Font="Common Normal",
	Text="START BUTTON = EXECUTE",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM-60):zoom(0.5):zoomx(0.4):diffuse(color("#ffffff")) end,
}
t[#t+1] = Def.BitmapText {
	Font="Common Normal",
	Text="PLAYER1 LEFT/RIGHT = SELECT ITEM",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM-75):zoom(0.5):zoomx(0.4):diffuse(color("#ffffff")) end,
}

return t







