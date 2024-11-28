-- 01 ExtraStageStars.lua
-- Recreate the extra stage conditions of arcade versions of DDR (DDR A and newer).

ExtraStageStars = 0
StarsAddedRecently = 0

function GetExtraStageStars()
    return ExtraStageStars
end

function GetRecentExtraStageStars()
    return StarsAddedRecently
end

local function IsFullCombo(pn)
    return STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):FullComboOfScore("TapNoteScore_W4")
end

local function IsRiskyOrLife4(pn)
    local options = GAMESTATE:GetPlayerState(pn):GetPlayerOptionsArray("ModsLevel_Preferred")
    return table.search(options, '4Lives') or table.search(options, '1Lives')
end

local function IsFinalStage()
    return STATSMAN:GetCurStageStats():GetStage() == "Stage_Final"
end

local function IsExtraStageEnabled()
    return PREFSMAN:GetPreference("AllowExtraStage")
end

local function IsEventMode()
    return GAMESTATE:IsEventMode()
end

local function IsExtraStage()
    return GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2()
end

local function DidPlaySong()
    local currentScreen = Var "LoadingScreen"
    return currentScreen == "ScreenEvaluationNormal"
end

function AddExtraStageStars(rank, pn)
	-- Extra Stage is turned off in Event Mode
	if IsEventMode() then return end
    if not DidPlaySong() then return end
    if IsExtraStage() then return end

    local starsToAdd = 0
    -- AAA
    if rank == "Grade_Tier01" or rank == "Grade_Tier02" then
        starsToAdd = 3
    -- AA
    elseif rank == "Grade_Tier03" or rank == "Grade_Tier04" or rank == "Grade_Tier05" then
        starsToAdd = 2
    -- A
    elseif rank == "Grade_Tier06" or rank == "Grade_Tier07" or rank == "Grade_Tier08" then
        starsToAdd = 1
    end

	-- Did the player full combo the song?
    if IsFullCombo(pn) then
        starsToAdd = starsToAdd + 1
    end

    -- Is the player playing on LIFE4 or RISKY?
    if IsRiskyOrLife4(pn) then
        starsToAdd = starsToAdd + 1
    end

    -- You cannot add more than 3 stars per stage.
    if starsToAdd > 3 then
        starsToAdd = 3
    end

    -- Ensure we don't exceed 9 stars if you have >=7 stars.
    local maxStarsAllowed = 9 - ExtraStageStars
    if starsToAdd > maxStarsAllowed then
        starsToAdd = maxStarsAllowed
    end

    if ExtraStageStars < 9 then
        ExtraStageStars = ExtraStageStars + starsToAdd
    end

    StarsAddedRecently = starsToAdd
    return starsToAdd
end

-- Overwriting GAMESTATE to change the StepMania extra stage mechanics.
function HasEarnedArcadeExtraStage()
    if ExtraStageStars == 9 and IsFinalStage() and IsExtraStageEnabled() and not IsEventMode() then
        return "Grade_Tier16"
    else
        return "Grade_Tier01"
    end
end