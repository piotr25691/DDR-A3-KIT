local t = Def.ActorFrame {}

function DSMap(MapCode)
    t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
        end,
        Def.Model {
            Meshes = MapCode .. ".txt",
            Materials = MapCode .. ".txt",
            Bones = MapCode .. ".txt",
            OnCommand = function(self)
                self:cullmode(2):zoom(2)
                self:xy(0, 0)
                self:addy(0.5):addz(-50)
            end
        }
    }
end

function DSSuperNOVA(Map)
    t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
        end,
        Def.Model {
            Meshes = Map .. ".txt",
            Materials = Map .. ".txt",
            Bones = Map .. ".txt",
            InitCommand = function(self)
                self:cullmode(2):zoom(2):addy(0.5):addz(-50)
            end,
            AnimateCommand = function(self)
                self:diffusealpha(0):smooth(3):diffusealpha(1):smooth(3):diffusealpha(0):queuecommand("Animate")
            end,
            OnCommand = function(self)
                self:playcommand("Animate")
            end
        }
    }
end

DSMap("Map_A")
DSSuperNOVA("Map_B")


return t;
