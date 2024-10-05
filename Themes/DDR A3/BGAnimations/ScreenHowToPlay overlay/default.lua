local t = Def.ActorFrame{
    LoadActor(Model().."howtoplay.mp4")..{
        InitCommand=function(self)
            self:Center()
            self:FullScreen()
        end,
        OnCommand=function(self)
            self:play()
        end,
    },

    LoadActor("music.ogg")..{
        OnCommand=function(self)
            self:play()
        end,
    },
}

return t