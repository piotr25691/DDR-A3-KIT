return Def.ActorFrame {
    LoadActor("selftest")..{
        InitCommand=cmd(FullScreen),
        OnCommand=function(self)
            self:play()
        end,
    },
}
