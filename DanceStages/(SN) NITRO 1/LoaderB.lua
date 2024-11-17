local t = Def.ActorFrame {}

function DSMap()
    t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
        end,
        Def.Model {
            Meshes = "Map_C4.txt",
            Materials = "Map_C4.txt",
            Bones = "Map_C4.txt",
            OnCommand = function(self)
                self:cullmode(2)
                self:xy(0, 0)
                self:addy(0.5)
                    :zoom(4)
                    :blend("BlendMode_Add")
            end
        }
    }
end

DSMap()

return t;
