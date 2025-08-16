--In is intended that a modder override this file.

--Called during a regular (non discrete) update.
--This is called once per frame.
function p.update()
    --more!!!
end

--When the game is paused,
--such as when in a menu.
function p.update_passive()
    --more!!!
end

--Gets called first during a (discrete) update cycle.
--The the engine performs its own discrete update.
--Then the update_discrete_post function gets called
--There are 25 discrete updates per second.
function p.update_discrete_pre()
    --more!!!
end

--See function "p.update_discrete_pre".
function p.update_discrete_post()
    --more!!!
end
