-------------------------------------------------------------------------------
--Class declaration
-------------------------------------------------------------------------------
if Darkfall == nil then
    Darkfall = {}
    Darkfall.__index = Darkfall
    Darkfall.szNativeClassName = "dota_base_game_mode"
end

function Darkfall:new (o)
    o = o or {}
    setmetatable(o, self)
    HANDLE = o
    return o
end

function GetDarkfall()
    return HANDLE
end

--------------------------------------------------------------------------------
--Global Variables
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--Initialise Darkfall
--------------------------------------------------------------------------------

function Darkfall:InitDarkfall()
    
    print( "Initialising Darkfall!" )
    
    print( "Generating GameRules" )

    GameRules:SetHeroRespawnEnabled( false )
    GameRules:SetUseUniversalShopMode( true )
    GameRules:SetHeroSelectionTime( 30.0 )
    GameRules:SetPreGameTime( 0.0 )
    GameRules:SetPostGameTime( 60.0 )
    GameRules:SetTreeRegrowTime( 30.0 )
    GameRules:SetHeroMinimapIconSize( 250 )
    GameRules:SetTimeOfDay( 0.75 )
    
    
    -- Set the thinker up
    Entities:FindAllByClassname('dota_base_game_mode')[1]:SetThink('Think', 'Darkfall', 0.2, self)
    
end

-------------------------------------------------------------------------------
--Think function
-------------------------------------------------------------------------------
function Darkfall:Think()
    --this is executed every 0.25 seconds
  --return how long we want to wait for another Think()
  return 0.2
end