local t = Def.ActorFrame {}

function DSMap(MapCode, _CM, X, Y, Z)
    t[#t + 1] = Def.ActorFrame {
        OnCommand = function(self)
			self:queuecommand('Rate')
		end,
		RateCommand = function(self)
			self:SetUpdateFunction(StageRate)
		end,
        Def.Model {
            Meshes = MapCode .. ".txt",
            Materials = MapCode .. ".txt",
            Bones = MapCode .. ".txt",
            InitCommand = function(self)
                self:cullmode(_CM)
                self:xy(0, 0)
                self:addx(X or 0):addy(Y or 0.5):addz(Z or 0)
                    :zoom(3)
            end,
            OnCommand = function(self)
                if MapCode == "Map_F" then
                    self:blend("BlendMode_Add")
                    self:diffusealpha(0):smooth(3):diffusealpha(1):smooth(3):diffusealpha(0):queuecommand("On")
                end
                if MapCode == "Map_A" or MapCode == "Map_B" or MapCode == "Map_C" then
                    self:zoomx(3*1.6)
                end
            end,
        }
    }
end

DSMap("Map_A", 2)
DSMap("Map_B", 2)
DSMap("Map_C", 2)
DSMap("Map_D", 2)
DSMap("Map_E", 2,0,-3.5,8)
DSMap("Map_F", 2,0,-3.5,8)

return t;
