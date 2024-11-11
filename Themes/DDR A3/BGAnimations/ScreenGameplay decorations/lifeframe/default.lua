local pn = ...
local Risky = GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):LifeSetting() == 'LifeType_Battery'

local gauge = GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):DrainSetting()

function GaugeTextureDanger(g)
	if g == 'DrainType_Flare1' then
		return "Flare1"
	elseif g == 'DrainType_Flare2' then
		return "Flare2"
	elseif g == 'DrainType_Flare3' then
		return "Flare3"
	elseif g == 'DrainType_Flare4' then
		return "Flare4"
	elseif g == 'DrainType_Flare5' then					
		return "Flare5"
	elseif g == 'DrainType_Flare6' then
		return "Flare6"
	elseif g == 'DrainType_Flare7' then
		return "Flare7"
	elseif g == 'DrainType_Flare8' then
		return "Flare8"
	elseif g == 'DrainType_Flare9' then
		return "Flare9"
	elseif g == 'DrainType_FlareEX' then
		return "FlareEX"
	elseif g == 'DrainType_FloatingFlare' then
		return "FlareEX"
	else
		return "danger"
	end
end

function GaugeTextureHot(g)
	if g == 'DrainType_Flare1' then
		return "Flare1"
	elseif g == 'DrainType_Flare2' then
		return "Flare2"
	elseif g == 'DrainType_Flare3' then
		return "Flare3"
	elseif g == 'DrainType_Flare4' then
		return "Flare4"
	elseif g == 'DrainType_Flare5' then
		return "Flare5"
	elseif g == 'DrainType_Flare6' then
		return "Flare6"
	elseif g == 'DrainType_Flare7' then
		return "Flare7"
	elseif g == 'DrainType_Flare8' then
		return "Flare8"
	elseif g == 'DrainType_Flare9' then
		return "Flare9"
	elseif g == 'DrainType_FlareEX' then
		return "FlareEX"
	elseif g == 'DrainType_FloatingFlare' then
		return "FlareEX"
	else
		return "full"
	end
end

function GaugeTexture(g)
	if g == 'DrainType_Flare1' then
		return "Flare1"
	elseif g == 'DrainType_Flare2' then
		return "Flare2"
	elseif g == 'DrainType_Flare3' then
		return "Flare3"
	elseif g == 'DrainType_Flare4' then
		return "Flare4"
	elseif g == 'DrainType_Flare5' then
		return "Flare5"
	elseif g == 'DrainType_Flare6' then
		return "Flare6"
	elseif g == 'DrainType_Flare7' then
		return "Flare7"
	elseif g == 'DrainType_Flare8' then
		return "Flare8"
	elseif g == 'DrainType_Flare9' then
		return "Flare9"
	elseif g == 'DrainType_FlareEX' then
		return "FlareEX"
	elseif g == 'DrainType_FloatingFlare' then
		return "FlareEX"
	else
		return "normal"
	end
end

function GaugeSpeed(g)
	if string.find(g, "Flare") then
		return pn=="PlayerNumber_P2" and 0.8 or -0.8
	else
		return pn=="PlayerNumber_P2" and 0.6 or -0.6
	end
end

function GaugeSpeedDanger(g)
	if string.find(g, "Flare") then
		return pn=="PlayerNumber_P2" and 0.8 or -0.8
	else
		return pn=="PlayerNumber_P2" and 4 or -4
	end
end

function GaugeDiffuse(g)
	if string.find(g, "Flare") then
		return "#888888"
	else
		return "#FFFFFF"
	end
end


return Def.ActorFrame{
    InitCommand=function(s)
        s:xy(pn==PLAYER_1 and _screen.cx-231 or _screen.cx+229,SCREEN_TOP+23):draworder(99)
    end,
    Name="LifeFrame",
	Def.Sprite{
        Texture=THEME:GetPathB("","ScreenGameplay decorations/lifeframe/stream/base"),
		InitCommand=function(s) s:x(pn==PLAYER_1 and -7 or 9):zoomto(296,20):diffusealpha(Risky and 0 or 1) end,
	};
	Def.Sprite{
        Texture=THEME:GetPathB("","ScreenGameplay decorations/lifeframe/stream/"..GaugeTexture(gauge)),
		InitCommand=function(s) s:x(pn==PLAYER_1 and -8 or 10) end,
        OnCommand=function(s) s:scaletoclipped(296,20)
            :MaskDest():ztestmode("ZTestMode_WriteOnFail"):customtexturerect(0,0,1,1)
            :texcoordvelocity(GaugeSpeed(gauge),0)
        end,
        HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == pn then
				if param.HealthState == "HealthState_Danger" then
					self:Load(THEME:GetPathB("","ScreenGameplay decorations/lifeframe/stream/"..GaugeTextureDanger(gauge)))
					self:texcoordvelocity(GaugeSpeedDanger(gauge),0)
					self:diffuse(color(GaugeDiffuse(gauge)))
				elseif param.HealthState == "HealthState_Hot" then
					self:Load(THEME:GetPathB("","ScreenGameplay decorations/lifeframe/stream/"..GaugeTextureHot(gauge)))
					self:texcoordvelocity(GaugeSpeed(gauge),0)
					self:diffuse(color("#ffffff"))
		  		else
					self:Load(THEME:GetPathB("","ScreenGameplay decorations/lifeframe/stream/"..GaugeTexture(gauge)))
					self:texcoordvelocity(GaugeSpeed(gauge),0)
					self:diffuse(color("#ffffff"))
		  		end;
			end;
		end;
    };
	Def.Sprite{
        Name="LifeFrame"..pn,
        InitCommand=function(s) s:x(pn==PLAYER_1 and -3.97 or 6):zoom(0.667):rotationy(pn==PLAYER_2 and 180 or 0):y(-0.5) end,
        BeginCommand=function(self)
			if Risky then
				self:Load(THEME:GetPathB("ScreenGameplay","decorations/lifeframe/"..Model().."life"))  
			else
				self:Load(THEME:GetPathB("ScreenGameplay","decorations/lifeframe/"..Model().."normal"))
			end;
        end
    };
};
