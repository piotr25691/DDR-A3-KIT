local t = Def.ActorFrame{}

function DSMap(MapCode, bobY, bobPeriod, bobEOF, sX, Y, Z,sY, sZ, Z)
	t[#t + 1] =
		Def.ActorFrame {
			OnCommand=function(self)
				self:bob():effectoffset(bobEOF or 0):effectmagnitude(0, bobY or 0,0):effectperiod(bobPeriod or 1)
		end,
		InitCommand = function(self)
			if MapCode == "Map_B2" or MapCode == "Map_B1" or MapCode == "Map_B3" then 
				self:addy(140):blend("BlendMode_Add")
			end
		end,

		Def.Model {
			Meshes = MapCode .. ".txt",
			Materials = MapCode .. ".txt",
			Bones = MapCode .. ".txt",
			OnCommand = function(self)
				self:cullmode(2)
				self:xy(0.7,-8.9 + (Y or 0)):z(4)
				self:addy(9.5)
					:zoom(2+(Z or 0))
					:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0)
				if MapCode == "Map_D" then 
					self:spin():effectmagnitude(0, sX, 0)
				end
			end
		}
	}
end

DSMap("Map_A")
DSMap("Map_C")

DSMap("Map_B3",90,3,0)
DSMap("Map_B2",90,3,1)
DSMap("Map_B1",90,3,2)

DSMap("Map_D",10,10,0,-50,40+20)
DSMap("Map_D",10,10,0,50,20)
DSMap("Map_D",10,10,0,-50,-40+20,2)
DSMap("Map_D",10,10,0,50,-80+20)
DSMap("Map_D",10,10,0,-50,-120+20,3)

return t;