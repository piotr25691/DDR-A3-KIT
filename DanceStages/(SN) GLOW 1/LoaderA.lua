local t = Def.ActorFrame {}

function DSMap(MapCode,Z,aY)
    t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
        end,
        Def.Model {
            Meshes = MapCode .. ".txt",
            Materials = MapCode .. ".txt",
            Bones = MapCode .. ".txt",
            InitCommand = function(self)
                self:zoom(Z or 1):addy(aY or 30)
            end,
            AnimateCommand = function(self)
                Acel = 3
                self:diffusealpha(0.1):smooth(1):diffusealpha(1):smooth(1):diffusealpha(0.1):queuecommand("Animate")
            end,
            OnCommand = function(self)
                if MapCode == "Map_B1" or MapCode == "Map_F2" then
                    self:playcommand("Animate")
                end
                self:cullmode(2)
                if DSMap == "Map_E1" or DSMap == "Map_E2" or DSMap == "Map_E3" then
                    self:blend("BlendMode_Add")
                end
            end
        }
    }
end

DSMap("Map_A1",4.5)
DSMap("Map_A2",4.5)
DSMap("Map_B1",4.5)
DSMap("Map_F1",1,0)
DSMap("Map_F2",1,0)
DSMap("Map_E1",4.5)
DSMap("Map_E2",4.5)
DSMap("Map_E3",4.5)

return t;
