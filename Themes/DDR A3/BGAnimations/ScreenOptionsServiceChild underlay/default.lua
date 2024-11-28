local t = Def.ActorFrame {
  OnCommand=function(s)
       SOUND:StopMusic()
  end
}

local screenName = Var "ScreenName"

t[#t+1] =Def.Quad {
	InitCommand=function(s) s:diffuse(color("#000000")):FullScreen():diffusealpha(1) end,
}

t[#t+1] = Def.BitmapText {
	Font="_helvetica-condensed-light 24px",
	Text="SERVICE BUTTON = EXECUTE",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM-30):zoom(0.5):diffuse(color("#ffffff")) end,
}
t[#t+1] = Def.BitmapText {
	Font="_helvetica-condensed-light 24px",
	Text="TEST BUTTON = SELECT ITEM",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM-45):zoom(0.5):diffuse(color("#ffffff")) end,
}
t[#t+1] = Def.BitmapText {
	Font="_helvetica-condensed-light 24px",
	Text="START BUTTON = EXECUTE",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM-60):zoom(0.5):diffuse(color("#ffffff")) end,
}
t[#t+1] = Def.BitmapText {
	Font="_helvetica-condensed-light 24px",
	Text="PLAYER1 LEFT/RIGHT = SELECT ITEM",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM-75):zoom(0.5):diffuse(color("#ffffff")) end,
}

return t
