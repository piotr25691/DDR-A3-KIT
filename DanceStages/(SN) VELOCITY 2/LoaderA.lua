local t = Def.ActorFrame{}

function DSMap(MapCode)
	t[#t + 1] =
		Def.ActorFrame {
		InitCommand = function(self)
		end,
		OnCommand=function(self)
			if MapCode == "Map_D" or MapCode == "Map_C2" then
				self:diffusealpha(0):smooth(3):diffusealpha(1):smooth(3):diffusealpha(0):queuecommand("On")
			end
		end,

		Def.Model {
			Meshes = MapCode .. ".txt",
			Materials = MapCode .. ".txt",
			Bones = MapCode .. ".txt",
			OnCommand = function(self)
				self:cullmode(2)
				self:xy(0.7,-9.2):z(4)
				self:addy(9.5)
					:zoom(5)
				if MapCode == "Map_D" or MapCode == "Map_B" or MapCode == "Map_C2" then self:blend("BlendMode_Add") end
				if MapCode == "Map_D" then self:addy(-0.02) end
			end
		}
	}
end

DSMap("Map_A")
DSMap("Map_B")
DSMap("Map_C")
DSMap("Map_C2")
DSMap("Map_D")

return t;