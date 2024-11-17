local t = Def.ActorFrame{}

function DSMap(MapCode, _CM, X, Y, Z, rX, rY)
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
					:zoom(0.6)
					:blend("BlendMode_Add")
			end
		}
	}
end
	
DSMap("Map_C",2,0,-35,0,180,0)
DSMap("Map_C",2,0,-35,0,0,45)
DSMap("Map_C",2,0,-35,0,180,90)
DSMap("Map_C",2,0,-35,0,0,135)
DSMap("Map_C",2,0,-35,0,180,180)
DSMap("Map_C",2,0,-35,0,0,225)
DSMap("Map_C",2,0,-35,0,180,270)
DSMap("Map_C",2,0,-35,0,0,315)


return t;