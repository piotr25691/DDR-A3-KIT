return Def.ActorFrame {
	LoadActor( "selftest" )..{
		InitCommand=cmd(FullScreen);
	};
}