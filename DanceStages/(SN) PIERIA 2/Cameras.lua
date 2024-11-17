local t = Def.ActorFrame{}

t.Camera1MessageCommand=function(self)
	ResetCamera()
	--SN 7
	Camera:addz(-50):addy(15):addrotationx(10):smooth(7):addrotationx(-30):addy(10):addrotationy(-25)
end
t.Camera2MessageCommand=function(self)
	ResetCamera()
	--SN 7
	Camera:addrotationx(90):addz(-75):addx(-20):addy(20):linear(7):addx(25):addy(-25)
end
t.Camera3MessageCommand=function(self)
	ResetCamera()
	--sn 10
	Camera:addz(-50):addy(10):addrotationy(60):linear(10):addy(20):addrotationy(-55):addrotationx(20):addz(10)
end
t.Camera4MessageCommand=function(self)
	ResetCamera()
	--SN 4
	Camera:addrotationy(200):addrotationx(10):linear(4):addz(-20):addrotationx(5)
end
t.Camera5MessageCommand=function(self)
	ResetCamera()
	--SN 2
	Camera:addrotationy(-90):addrotationx(20):addz(-100	):linear(2):addz(40)
end
t.Camera6MessageCommand=function(self)
	ResetCamera()
	--SN 4
	Camera:addrotationy(-60):addrotationx(20):addz(-120):linear(4):addz(10):addrotationy(30):addrotationx(10)
end
t.Camera7MessageCommand=function(self)
	ResetCamera()
	--sn 5
	Camera:addrotationx(90):addz(-30):linear(5):addrotationy(50):addz(-80)
end
t.Camera8MessageCommand=function(self)
	ResetCamera()
	--SN 3
	Camera:addz(10):addrotationy(-10):linear(3):addrotationy(-20):addrotationx(20)
end
t.Camera9MessageCommand=function(self)
	ResetCamera()
	--sn 5
	Camera:addrotationx(30):addrotationy(40):addz(-60):linear(5):addrotationy(-40):addz(60):addrotationx(-20)
end
t.Camera10MessageCommand=function(self)
	ResetCamera()
	--SN 7
	Camera:addrotationy(250):addrotationx(20):addz(-7):addx(-13):linear(7):addx(26)
end
t.Camera11MessageCommand=function(self)
	ResetCamera()
	--SN 7
	Camera:addz(25):addrotationy(180):smooth(7):addrotationy(-150)
end
t.Camera12MessageCommand=function(self)
	ResetCamera()
	--SN 5
	Camera:addz(20):addrotationy(-80):smooth(5):addrotationx(20):addrotationy(-10):addx(3):addy(2)
end
t.Camera13MessageCommand=function(self)
	ResetCamera()
	--SN 6
	Camera:addz(25):addrotationy(45):smooth(6):addrotationy(-40):addrotationx(25):addz(-5)
end
t.Camera14MessageCommand=function(self)
	ResetCamera()
	--SN 7
	Camera:addz(-50):addy(15):addrotationx(10):smooth(7):addrotationx(-30):addy(10):addrotationy(-25)
end
t.Camera15MessageCommand=function(self)
	ResetCamera()
	--SN 6
	Camera:addy(45):addrotationx(-47):smooth(5):addrotationx(47):addz(-5):addy(-45)
end

	------- WAIT TIMES  -------8
	NumCameras=tonumber(15)
	WaitTime = {7,7,10,4,2,4,5,3,5,7,7,5,6,7,6}
	
return t;