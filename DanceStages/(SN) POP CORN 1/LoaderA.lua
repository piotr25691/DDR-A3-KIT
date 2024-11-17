local t = Def.ActorFrame {}

function DSMap(MapCode, _CM, X, Y, Z, rX, rY, rZ, Zo, ModelTime, sX, sY, sZ, bobX, bobY, bobZ, bobEOF, bobPeriod,
    Diffuse)
    t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
            self:bob():effectoffset(bobEOF or 0):effectmagnitude(bobX or 0, bobY or 0, bobZ or 0):effectperiod(bobPeriod or 1)
        end,
        Def.Model {
            Meshes = MapCode .. ".txt",
            Materials = MapCode .. ".txt",
            Bones = MapCode .. ".txt",
            OnCommand = function(self)
                self:cullmode(_CM):zoom(1)
                if MapCode == "Map_E" then
                    self:blend("BlendMode_Add")
                end
                self:xy(0, 0)
                self:addx(X or 0):addy(Y or 0):addz(Z or 0):addrotationx(rX or 0):addrotationy(rY or 0):addrotationz(rZ or 0):zoom(35 + (Zo or 0)):position(ModelTime or 0)
                self:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0):diffusealpha(Diffuse or 1)

            end
        }
    }
end

DSMap("Map_A", 2, 0, 83.5)

DSMap("Map_B", 2, 0, -230, 680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.05)
DSMap("Map_B", 2, 0, -230, 560, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.25)
DSMap("Map_B", 2, 0, -230, 440, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.50)
DSMap("Map_B", 2, 0, -230, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.75)
DSMap("Map_B", 2, 0, -230, 200)
DSMap("Map_B", 2, 0, -230, 65)
DSMap("Map_B", 2, 0, -230, -680, 0, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.05)
DSMap("Map_B", 2, 0, -230, -560, 0, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.25)
DSMap("Map_B", 2, 0, -230, -440, 0, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.50)
DSMap("Map_B", 2, 0, -230, -320, 0, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.75)
DSMap("Map_B", 2, 0, -230, -200, 0, 180)
DSMap("Map_B", 2, 0, -230, -65, 0, 180)
DSMap("Map_B", 2, 0, 160, 680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.05)
DSMap("Map_B", 2, 0, 160, 560, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.25)
DSMap("Map_B", 2, 0, 160, 440, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.50)
DSMap("Map_B", 2, 0, 160, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.75)
DSMap("Map_B", 2, 0, 160, 200)
DSMap("Map_B", 2, 0, 160, 65)
DSMap("Map_B", 2, 0, 160, -680, 0, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.05)
DSMap("Map_B", 2, 0, 160, -560, 0, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.25)
DSMap("Map_B", 2, 0, 160, -440, 0, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.50)
DSMap("Map_B", 2, 0, 160, -320, 0, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.75)
DSMap("Map_B", 2, 0, 160, -200, 0, 180)
DSMap("Map_B", 2, 0, 160, -65, 0, 180)

DSMap("Map_C", 2, 0, -40)
DSMap("Map_C", 2, 0, -40, 0, 0, 90)
DSMap("Map_C", 2, 0, -40, 0, 0, 180)
DSMap("Map_C", 2, 0, -40, 0, 0, 270)

DSMap("Map_D1", 2, 0, 83.5)
DSMap("Map_E", 2, 0, 83.5)

return t;
