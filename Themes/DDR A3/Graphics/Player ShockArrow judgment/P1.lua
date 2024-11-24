return Def.ActorFrame {
	LoadActor(THEME:GetPathG("","HoldJudgment label 1x2/Hold"))..{
		InitCommand=function(s) s:diffusealpha(0):animate(false):xy(SCREEN_LEFT+185, SCREEN_CENTER_Y-75) end,
		JudgmentMessageCommand=function(self, params)
			if params.Player ~= PLAYER_1 then return end;
			if params.TapNoteScore == 'TapNoteScore_AvoidMine' 
				or params.TapNoteScore == 'TapNoteScore_HitMine'
			then
				self:visible(true)
				self:finishtweening()
				
				if params.TapNoteScore == 'TapNoteScore_HitMine' then
					self:setstate(1)
					self:queuecommand("Animate")
				elseif params.TapNoteScore == 'TapNoteScore_AvoidMine' then
					self:setstate(0)
					self:queuecommand("Animate");
				end
			else
				self:visible(false)
			end
		end;
		AnimateCommand=function(self)
			self:diffusealpha(1)
			self:zoom(0.34*1.5)
			self:sleep(0.5)
			self:diffusealpha(0)
		end,
	}
}