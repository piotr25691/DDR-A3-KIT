InitialOptions = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Preferred")

-- Apply CONSTANT sudden mode like in DDR WORLD
local function UpdateConstantMod()
    -- 100% SuddenOffset is the default CONSTANT value.
    if not string.find(InitialOptions, "SuddenOffset") then return end

    -- Are we playing a song?
    local currentSong = GAMESTATE:GetCurrentSong()
    if not currentSong then return end

    -- To apply CONSTANT we need to know the current beat position.
    local timingData = currentSong:GetTimingData()
    local currentBeat = GAMESTATE:GetSongBeat()

    -- Determine the base BPM for the song.
    local displayBpms = currentSong:GetDisplayBpms()
    local baseBPM = displayBpms[1] -- Start with the minimum BPM

    -- If the base BPM is variable, take an average of it.
    if displayBpms[2] then
        baseBPM = (displayBpms[1] + displayBpms[2]) / 2
    end

    -- Get current beat's BPM to apply CONSTANT.
    local currentBPM = timingData:GetBPMAtBeat(currentBeat)

    -- Don't divide by zero
    if currentBPM == 0 then return end

    -- Set SuddenOffset appropriately
    local constantOffset
    if currentBPM*1.5 < baseBPM then
        constantOffset = -math.floor((currentBPM / baseBPM) * 100)
    else
        constantOffset = math.floor((currentBPM / baseBPM) * 100)
    end

    local playerState = GAMESTATE:GetPlayerState(PLAYER_2)
    local currentOptions = playerState:GetPlayerOptionsString("ModsLevel_Song")
    currentOptions = currentOptions:gsub(",Sudden,-?%d+%% SuddenOffset", "")

    -- This only applies to the current song.
    playerState:SetPlayerOptions("ModsLevel_Song", currentOptions .. ",Sudden," .. constantOffset .. "% SuddenOffset")
end

return Def.ActorFrame{
    OnCommand=function(s)
        s:queuecommand("ApplyConstant")
    end,
    ApplyConstantCommand=function(s)
        -- Watch out for BPM changes.
        s:sleep(0.1)
        UpdateConstantMod()
        s:queuecommand("On")
    end
}