InitialOptions = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptionsString("ModsLevel_Preferred")

-- Apply CONSTANT sudden mode like in DDR WORLD
local function UpdateConstantMod()
    -- 100% SuddenOffset is the default CONSTANT value.
    if not string.find(InitialOptions, "SuddenOffset") then return end

    -- Get song and timing details
    local currentSong = GAMESTATE:GetCurrentSong()
    if not currentSong then return end

    local timingData = currentSong:GetTimingData()
    local currentBeat = GAMESTATE:GetSongBeat()

    -- Retrieve BPM information
    local displayBpms = currentSong:GetDisplayBpms()
    local baseBPM = displayBpms[1] -- Start with the minimum BPM

    -- Handle cases where maximum BPM is nil (constant BPM songs)
    if displayBpms[2] then
        baseBPM = (displayBpms[1] + displayBpms[2]) / 2
    end

    -- Calculate current BPM
    local currentBPM = timingData:GetBPMAtBeat(currentBeat)

    -- Don't divide by zero
    if currentBPM == 0 then return end

    -- Compute SuddenOffset as a percentage of base BPM
    local constantOffset
    if currentBPM*1.5 < baseBPM then
        constantOffset = -math.floor((currentBPM / baseBPM) * 100)
    else
        constantOffset = math.floor((currentBPM / baseBPM) * 100)
    end

    -- Apply the dynamic modifier
    local playerState = GAMESTATE:GetPlayerState(PLAYER_1)
    local currentOptions = playerState:GetPlayerOptionsString("ModsLevel_Song")
    currentOptions = currentOptions:gsub(",Sudden,-?%d+%% SuddenOffset", "")

    playerState:SetPlayerOptions("ModsLevel_Song", currentOptions .. ",Sudden," .. constantOffset .. "% SuddenOffset")
end

return Def.ActorFrame{
    OnCommand=function(s)
        s:queuecommand("ApplyConstant")
    end,
    ApplyConstantCommand=function(s)
        s:sleep(0.1)
        UpdateConstantMod()
        s:queuecommand("On")
    end
}