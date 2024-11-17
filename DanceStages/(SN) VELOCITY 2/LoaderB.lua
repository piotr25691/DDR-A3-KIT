local t = Def.ActorFrame{}

function DSMap(MapCode, sX, sY, sZ, Z)
	t[#t + 1] =
		Def.ActorFrame {
		InitCommand = function(self)
		end,
		OnCommand=function(self)
			if MapCode == "Map_B" then
				self:diffusealpha(0):smooth(3):diffusealpha(1):smooth(3):diffusealpha(0):queuecommand("On")
			end
		end,

		Def.Model {
			Meshes = MapCode .. ".txt",
			Materials = MapCode .. ".txt",
			Bones = MapCode .. ".txt",
			OnCommand = function(self)
				self:cullmode(2)
				self:xy(0.7,-8.9):z(4)
				self:addy(9.5)
					:zoom(Z or 5):position(ModelTime or 0)
					:blend("BlendMode_Add")
					:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0)
			end
		}
	}
end

DSMap("Map_E",math.random(60,70),math.random(60,70),math.random(60,70),7)
DSMap("Map_E",math.random(50,60),math.random(50,60),math.random(50,60),6)
DSMap("Map_E",math.random(40,50),math.random(40,50),math.random(40,50),5)

return t;