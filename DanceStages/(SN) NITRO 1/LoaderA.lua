local t = Def.ActorFrame {}

function DSMap(MapCode, _CM, X, Y, Z, rX, rY, rZ, Zo, ModelTime, sX, sY, sZ, bobX, bobY, bobZ, bobEOF, bobPeriod,
    Diffuse)
    t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
            self:bob():effectoffset(bobEOF or 0):effectmagnitude(bobX or 0, bobY or 0, bobZ or 0):effectperiod(
                bobPeriod or 1)
        end,
        Def.Model {
            Meshes = MapCode .. ".txt",
            Materials = MapCode .. ".txt",
            Bones = MapCode .. ".txt",
            OnCommand = function(self)
                self:cullmode(_CM)
                self:xy(0, 0)
                self:addx(X or 0):addy(0.5):addz(Z or 0):addrotationx(rX or 0):addrotationy(rY or 0):addrotationz(rZ or 0)
                    :zoom(4 + (Zo or 0)):position(ModelTime or 0)
                self:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0):diffusealpha(Diffuse or 1)
                if MapCode == "Map_B" or MapCode == "Map_C1" or MapCode=="Map_E" then
                    self:blend("BlendMode_Add")
                end
                if MapCode == "Map_C3" or MapCode == "Map_E" then
                    DA=1
                    if MapCode == "Map_E" then DA = 0.6 end
                    self:diffusealpha(0):smooth(3):diffusealpha(DA):smooth(3):diffusealpha(0):queuecommand("On")
                end
            end


        }
    }
end

DSMap("Map_A1",2)

DSMap("Map_F1",2,0,0,70,270)
DSMap("Map_F2",2,0,0,170,270,0,0,0,2)
DSMap("Map_F1",2,0,0,370,270,0,0,0,4)

DSMap("Map_F1",2,0,0,-70,-270,0,0,0,4)
DSMap("Map_F2",2,0,0,-170,-270,0,0,0,2)
DSMap("Map_F1",2,0,0,-370,-270)

DSMap("Map_A2",2)
DSMap("Map_C1",2)

DSMap("Map_B", 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, math.random(30, 50),math.random(30, 50))
DSMap("Map_B", 1, 0, 0, 0, 0, 0, 0, -0.7, 0, 0, math.random(30, 50),math.random(30, 50))

DSMap("Map_D", 2, 250, 0, 0, 0, 0, 0, 2, 0, math.random(90,150),math.random(90,150),math.random(50,90))
DSMap("Map_D", 2, -250, 0, 0, 0, 0, 0, 2, 0,math.random(90,150),math.random(90,150),math.random(50,90)) 
DSMap("Map_C2",2)
DSMap("Map_C3",2)
DSMap("Map_E",2)

return t;
