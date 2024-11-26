-- NOTE: this implementation is buggy, don't rely on it.

local currentEvent = nil
local previousEvent = nil
local isAnimating = false

return Def.ActorFrame {
    LoadActor(THEME:GetPathG("","HoldJudgment label 1x2/Hold"))..{
        InitCommand=function(s) s:diffusealpha(0):animate(false):xy(SCREEN_LEFT+185, SCREEN_CENTER_Y-75) end,
        OnCommand=function(s)
            -- Fix position when playing Double Style
            if GAMESTATE:GetCurrentStyle():GetName() == "double" then
                s:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y-75)
            end
        end,
        JudgmentMessageCommand=function(self, params)
            if params.Player ~= PLAYER_2 then return end;
            if params.TapNoteScore == 'TapNoteScore_AvoidMine' 
                or params.TapNoteScore == 'TapNoteScore_HitMine'
            then
				self:visible(true)

                -- Prioritize HitMine over AvoidMine
                if params.TapNoteScore == 'TapNoteScore_HitMine' then
                    currentEvent = 'TapNoteScore_HitMine'
                elseif currentEvent ~= 'TapNoteScore_HitMine' then
                    currentEvent = params.TapNoteScore
                end

                -- Only start the animation if not already animating
                if not isAnimating and params.TapNoteScore then
                    self:queuecommand("Animate")
                end
            else
                self:visible(false)
            end
        end;
        AnimateCommand=function(self)
            isAnimating = true
            self:finishtweening()

			-- NG
            if currentEvent == 'TapNoteScore_HitMine' then
                self:setstate(1)
			-- OK
            elseif currentEvent == 'TapNoteScore_AvoidMine' and previousEvent ~= 'TapNoteScore_HitMine' then
                self:setstate(0)
			-- OK after NG (buggy with only comparing 1 recent judgment)
			else
				self:setstate(0)
            end

            self:diffusealpha(1)
            self:zoom(0.28*1.5)
            self:sleep(0.5)
            self:diffusealpha(0)

            -- Reset currentEvent after animation
			previousEvent = currentEvent
            currentEvent = nil
            isAnimating = false
        end,
    }
}