--thanks to S3ZM4L01N (iamnot.a.skinwalker) for this idea
--should replace the 1 hour sleep bent here? to intercept and sometimes randomly teleport to dream dimension, depending on the number of hours difference between game time and play time. The longer the interval, the more likely to teleport. (This also nerfs sleeping for farming :))

--I also wanted to implement the Yellow Rings idea from L9M2 (l9m2), except slightly differently. It first says Grow/Shrink when you use it, and only after you use it CHANGE into a different ring. 

--Additionally, a 2 sided fractal. Basically, there is no floor solid block, its all part of one fractal, the top and bottom (but they are two seperate chunks, a top and bottom layer) It should be solid at first, and then its just a copy of itself. Maybe there can be tunnels between the two areas for some sort of puzzle?
    --Im not sure if both the top and bottom should have their own "floor", or if only needed on one side...

--6x 2d maze, on the surface of a cube. (A cube surface maze)

--looping maze, for 3d and 2d maze, should add functions in std_loop3maze for this. 

--a hollow planet, a core on the inside, where its hard to move through the air (time consuming? how will I force this...) But there are tubes connecting from all 6 sides to help you get to the center easier. 

--slightly reworked ->  a universe flower, except its a corrupt universe, or it could be the same, just mylantis is different...

--Undercity, a city that is at the bottom of Mylantis (lockbox area) directly oposite the top city. We can have Bob's Well Founded Lumber here (real)

--Orienting surfaces (making the camera change which way is "down")... It should be ment controlled, getting in range, and depending on the type of gravity controlled surface, could set the left vector (up, or the other one i forgot...) to always face properly such that the gravity surface is down. This might have to replace a camera update file... or it could just be its own update...

--Mossy Air passcode, so basically other blocks can have a variable that keeps track of the code, and another one that sets the digit added of the next one. 

--deep space void air, possiablly a passcode, or another challenge, or more content in general. I want to place a link in dreamland somewhere. 

--haystack dungeon, with needle microdungeon inside 

--a Happy Land inside Hell Temple becomes sad lands. 

--from room 15/15, a self replecating block, that creates ments around it that creates more ments, and the old ments "transform" into blocks. Once a chunk is completely filled of this block, it transforms the entire chunk into a copy of the block at the larger level, which should also keep spreading. Eventually, the entire world can be destryed, but it would be funny, and also we can make it so that this block (which is actually a ment) can only be in deep areas of the world. 

--a chunk with every chunk that has a unique secret trophy in it (because there is no secret trophy bent, you must place the specific xar chunk with the said trophy to get the specific trophy in it.)
function p.__get_is_solid() return true end
function p.__get_tex() return "block_bedroom" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
    create_xar_chunk("XAR_RICHMOND_BEDROOM")
    --time for dreamland
    --set_pos(7,14,7,"")
end