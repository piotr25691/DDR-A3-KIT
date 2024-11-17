local t = Def.ActorFrame{}

	function DSMap(MapCode, _CM, X, Y, Z, rX, rY, rZ, Zo, ModelTime, sX, sY, sZ, bobX, bobY, bobZ, bobEOF, bobPeriod)
		t[#t + 1] =
			Def.ActorFrame {
			InitCommand = function(self)
				self:bob():effectoffset(bobEOF or 0):effectmagnitude(bobX or 0, bobY or 0, bobZ or 0):effectperiod(bobPeriod or 1)
			end,
			Def.Model {
				Meshes = MapCode .. ".txt",
				Materials = MapCode .. ".txt",
				Bones = MapCode .. ".txt",
				InitCommand = function(self)
					self:cullmode(_CM)
					self:addx(X or 0):addy(Y or 0):addz(Z or 0):rotationx(rX or 0):rotationy(rY or 0):rotationz(rZ or 0):zoom(5 + (Zo or 0))
					if MapCode == "Map_E1" or
					   MapCode == "Map_E2" or
					   MapCode == "Map_D" or
					   MapCode == "Map_C2" or
					   MapCode == "Map_B"
					then
					   self:diffusealpha(0.8)
					   self:blend("BlendMode_Add")
					end
				end,
				OnCommand = function(self)
					self:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0):position(ModelTime or 0)
					if MapCode == "Map_C2" then
						self:diffusealpha(0):accelerate(3):diffusealpha(1):accelerate(3):diffusealpha(0):queuecommand("On")
					end
				end
			}
		}
	end

	function RDolphin(ang)
		t[#t + 1] =
			Def.ActorFrame {
			InitCommand = function(self)
				self:x(120*math.cos(ang*(math.pi/180))):z(120*math.sin(ang*(math.pi/180))):zoom(6)
				self:rotationy(ang):addy(9)
			end,
			
			Def.Model {
				Meshes = "Map_F.txt",
				Materials = "Map_F.txt",
				Bones = "Map_F.txt",
				InitCommand = function(self)
					self:addy(10)
					self:cullmode(2)
				end,
				OnCommand = function(self)
					self:diffusealpha(1):zoom(1.5):linear(1.8):zoomx(0.2):zoomz(0.2):diffusealpha(0):sleep(1):zoom(1.5):sleep(0.2)
					self:queuecommand("On")
				end
			},

			Def.Sprite {
				Texture="Ring_2.png";
				InitCommand=function(self)
					self:SetSize(10,10)
					self:rotationx(90):addy(-2)
					self:blend("BlendMode_Add")
				end,
				OnCommand=function(self)
					self:sleep(0.1):zoom(0.5):diffusealpha(0):linear(0.05):diffusealpha(1):linear(0.35):zoom(1.3):diffusealpha(0):sleep(2.5)
					self:queuecommand("On")
				end;
			},

		}
	end

	DSMap("Map_A1",2,0,50,0,0,0,0,1.1)
	DSMap("Map_B",2,0,60,0,0,90,0,1.8,0,0,45)
	DSMap("Map_B",2,0,60,0,0,0,0,1.7,0,0,45)
	DSMap("Map_D",2,0,7)
	DSMap("Map_C1",2,0,0.5,0,0,0,0,-1)
	DSMap("Map_C2",2,0,0.5,0,0,0,0,-1)
	DSMap("Map_E1",2,105,5,105,0,0,0,0,0,0,45)
	DSMap("Map_E2",2,105,5,105,0,0,0,1.85)
	DSMap("Map_E1",2,-105,5,-105,0,0,0,0,0,0,45)
	DSMap("Map_E1",2,0,0,0,0,0,0,0,0,0,45)
	DSMap("Map_B",2,0,-40,0,0,90,0,1.8,0,0,45)
	DSMap("Map_B",2,0,-40,0,0,0,0,1.7,0,0,45)
	DSMap("Map_E1",2,105,-130,105,0,0,0,0,0,0,45)
	DSMap("Map_E2",2,105,-130,105,0,0,0,1.85)
	DSMap("Map_E1",2,-105,-130,-105,0,0,0,0,0,0,45)
	DSMap("Map_E1",2,0,-125,0,0,0,0,0,0,0,45)

	for i=0,7 do
		RDolphin(45*i)
	end

return t;