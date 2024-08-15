return Def.ActorFrame {
    LoadActor("selftest")..{
        InitCommand=cmd(FullScreen),
        OnCommand=function(self)
            SOUND:StopMusic()
            self:play()
        end,
    },
}
