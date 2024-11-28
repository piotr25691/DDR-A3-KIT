-- Should this theme act as if is connected to e-AMUSEMENT or not?
function IsNetConnected()
    -- Change to `false` to "disconnect" from e-AMUSEMENT
    -- We cannot dynamically detect networking because `require` statements are not available.
    -- StepMania should consider upgrading to Lua 5.2.
    return true
end
