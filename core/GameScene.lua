local composer = require( "composer" )

local scene = composer.newScene()

local PlanetBase = require("core.modules.PlanetBase");
local SpaceShip = require("core.modules.SpaceShip");

--------------------------- local declarations -----------------------------


--------------------------- composer functions -----------------------------


function scene:create( event )
    local sceneGroup = self.view

    local spaceBackground = display.newImage( sceneGroup, "core/assets/images/space-1.jpg");
    Resizer:fitToHeight(spaceBackground);
    spaceBackground.x = content.centerX;
    spaceBackground.y = content.centerY;

    local planetBase = PlanetBase.new();
    planetBase.x = content.centerX;
    planetBase.y = content.centerY;

    local function spawn()
        local spawnCountdown = math.random( 1000,3000 );
        timer.performWithDelay( spawnCountdown, function(event)
            local shipType = math.random( 2 )-1;
            local typeLetter;
            if(shipType==0) then
                shipType=SpaceShip.TYPE_POWER;
            elseif(shipType==1) then
                shipType=SpaceShip.TYPE_SPEED;
            end
            local shipDifficulty = math.random( 2 );

            local spaceShip = SpaceShip.new(shipType, shipDifficulty);
            spaceShip:attackTarget( planetBase );
            spawn();
        end, 1 );
    end
    spawn();

end


function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        
    elseif ( phase == "did" ) then
        
    end
end


function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        
    elseif ( phase == "did" ) then
        
    end
end



function scene:destroy( event )
    local sceneGroup = self.view

end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene