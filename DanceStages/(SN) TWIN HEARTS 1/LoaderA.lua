local t = Def.ActorFrame{}

function DSMap(MapCode, _CM, X, Y, Z, rX, rY, Zoom)
	t[#t + 1] =
		Def.ActorFrame {
		InitCommand = function(self)
		end,
		Def.Model {
			Meshes = MapCode .. ".txt",
			Materials = MapCode .. ".txt",
			Bones = MapCode .. ".txt",
			OnCommand = function(self)
				self:cullmode(_CM)
				self:xy(0.7,-8.9):z(4)
				self:addx(X or 0):addy(Y or 0):addz(Z or 0):addrotationx(rX or 0):addrotationy(rY or 0)
					:zoom(0.6 + (Zoom or 0))
				if MapCode == "Map_B2" or
					MapCode == "Map_B1" or
					MapCode == "Map_D2"
					then
					 self:blend("BlendMode_Add")
				 end
				 if MapCode == "Map_D2" then
					self:diffusealpha(0):smooth(3):diffusealpha(1):smooth(3):diffusealpha(0):queuecommand("On")
				end

			end
		}
	}
end
	

DSMap("Map_A",2,0,0,0,0,0,0.5)
DSMap("Map_B2",2)
DSMap("Map_B1",2)
DSMap("Map_E",2,0,10)
DSMap("Map_D1",2,0,10)
DSMap("Map_D2",2,0,9.95)

return t;