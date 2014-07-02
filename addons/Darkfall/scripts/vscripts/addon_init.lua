-- This chunk of code forces the reloading of all modules when we reload script.
if g_reloadState == nil then
    g_reloadState = {}
    for k,v in pairs( package.loaded ) do
        g_reloadState[k] = v
    end
else
    for k,v in pairs( package.loaded ) do
        if g_reloadState[k] == nil then
            package.loaded[k] = nil
        end
    end
end


local function loadModule(name)
    local status, errorMsg = pcall(function()
        require(name)
    end)

    -- Status Report
    
    if status then
        print("Required module " .. name .. " loaded!")
    else
        print("WARNING: " .. name .. " failed to load!")
        print(errorMsg)
    end
end

loadModule( "util" ) -- Util files
loadModule( "darkfall" ) -- main
