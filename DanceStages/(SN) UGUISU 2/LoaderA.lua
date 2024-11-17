local t = Def.ActorFrame{}

function DSMap(MapCode,Z,Y,rY)
	t[#t + 1] =
		Def.ActorFrame {
		InitCommand = function(self)
		end,
		OnCommand=function(self)
			if MapCode == "Map_A2" or MapCode == "Map_B2.1" or MapCode == "Map_B2.2" then
				self:diffusealpha(0):smooth(3):diffusealpha(1):smooth(3):diffusealpha(0):queuecommand("On")
			end
		end,

		Def.Model {
			Meshes = MapCode .. ".txt",
			Materials = MapCode .. ".txt",
			Bones = MapCode .. ".txt",
			InitCommand = function(self)
				self:cullmode(2)
				self:xy(0.7,-8.9):z(4)
				self:addy(Y or 9.5):addrotationy(rY or 0)
					:zoom(Z or 1)
			end,
			OnCommand = function(self)
				if MapCode == "Map_A2" or
				MapCode == "Map_A3" or 
				MapCode == "Map_B1.1" or 
				MapCode == "Map_B1.2" or 
				MapCode == "Map_B2.1" or 
				MapCode == "Map_B2.2" or
				MapCode == "Map_C1" or
				MapCode == "Map_C2" 
				then
					self:blend("BlendMode_Add")
				end
				if 	MapCode == "Map_C1" then
					self:diffusealpha(0.5)
				end
			end
		}
	}
end

DSMap("Map_A",2)
DSMap("Map_C1")
DSMap("Map_C2")
DSMap("Map_D",1.4)

DSMap("Map_B1.1",0.5,-7,0)
DSMap("Map_B1.1",0.5,-7,90)
DSMap("Map_B1.1",0.5,-7,180)
DSMap("Map_B1.1",0.5,-7,270)
DSMap("Map_B1.2",0.5,-7,0)
DSMap("Map_B1.2",0.5,-7,90)
DSMap("Map_B1.2",0.5,-7,180)
DSMap("Map_B1.2",0.5,-7,270)

DSMap("Map_B2.1",0.5,-7,0)
DSMap("Map_B2.1",0.5,-7,90)
DSMap("Map_B2.1",0.5,-7,180)
DSMap("Map_B2.1",0.5,-7,270)
DSMap("Map_B2.2",0.5,-7,0)
DSMap("Map_B2.2",0.5,-7,90)
DSMap("Map_B2.2",0.5,-7,180)
DSMap("Map_B2.2",0.5,-7,270)

DSMap("Map_A1")
DSMap("Map_A2")
DSMap("Map_A3")


return t;