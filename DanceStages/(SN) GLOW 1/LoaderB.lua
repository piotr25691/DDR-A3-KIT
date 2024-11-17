local t = Def.ActorFrame {}

function DSSuperNOVACube(X1, Y1, Z1, X2, Y2, Z2, xP, yP, zP, S)
    t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
        end,
        Def.Model {
            Meshes = "Map_C.txt",
            Materials = "Map_C.txt",
            Bones = "Map_C.txt",
            InitCommand = function(self)
                self:cullmode(2):zoom(1.3):blend("BlendMode_Add")
            end,
            AnimateCommand = function(self)
                Acel = 3
                WaitA = 5
                WaitB = 0
                if S == "A" then WaitA = 0 WaitB = 5 end
                self:diffusealpha(0):x(X1):y(Y1):z(Z1):sleep(WaitA):accelerate(Acel):x(xP):y(yP):z(zP):diffusealpha(1):decelerate(Acel):x(X2):y(Y2):z(Z2):diffusealpha(0):sleep(WaitB):queuecommand("Animate")
            end,
            OnCommand = function(self)
                self:playcommand("Animate")
            end
        }
    }
end

 DSSuperNOVACube(100,0,100,-100,0,100,0,0,100,"A")
 DSSuperNOVACube(-100,-70,100,100,-70,100,0,-70,100,"B")

 DSSuperNOVACube(-100,-70,-100,-100,-70,100,-100,-70,0,"B")
 DSSuperNOVACube(-100,0,100,-100,0,-100,-100,0,0,"A")

 DSSuperNOVACube(100,-70,100,100,-70,-100,100,-70,0,"A")
 DSSuperNOVACube(100,0,-100,100,0,100,100,0,0,"B")

 DSSuperNOVACube(100,-70,-100,-100,-70,-100,0,-70,-100,"B")
 DSSuperNOVACube(-100,0,-100,100,0,-100,0,0,-100,"A")

 DSSuperNOVACube(100,0,100,100,-200,100,100,-100,100,"A")
 DSSuperNOVACube(-100,-200,100,-100,0,100,-100,-100,100,"B")

 DSSuperNOVACube(100,0,-100,100,-200,-100,100,-100,-100,"A")
 DSSuperNOVACube(-100,-200,-100,-100,0,-100,-100,-100,-100,"B")

return t;
