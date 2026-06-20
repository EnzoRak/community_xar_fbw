-- move into seperate file if too much of similar area

local lang = "english"

function p.main()
    p.recordable()
    p.not_recordable()
end

function p.recordable()
    -- none yet
end
function p.not_recordable()
    -- what?
    --local txt = game_inj.bind(game_journal.add_txt, nil, lang)
    -- some could maybe be recordable.
    game_journal.add_txt(lang, "galaxy_blackhole", "This is a ^x00ff00Supermassive Black Hole^!.")
    game_journal.add_txt(lang, "gl_cube_info", "You are inside of a ^x00ff00Good Luck Cube^!. To get out, you have to kill a ^xff0000Major Sliver^!, and in the air there are ^xff0000Guardians^!. This is why it's called a Good Luck Cube.")
    game_journal.add_txt(lang, "dirty_air_case", "This is a cube filled with ^x00ff00Dirty Air^!.")
    game_journal.add_txt(lang, "pink_flower_room", "This is the not-so-uncommon ^xFF00FFPink Flower^!\nThere is an invisible death barrier around the corner that will kill you instantly if you don't have the Pink Key. \n^x00FF00Hint: Check out my challenge at the top of the space gauntlet^!")

    game_journal.add_txt(lang, "alphabet_flower", "This is an ^x00ff00Alphabet Flower^!.\n\nYou will have to remember a code and solve a maze.")
    game_journal.add_txt(lang, "alphabet_flower_room", "This is where you input your code at the very start of the maze.")
    game_journal.add_txt_cb(lang, "alphabet_flower_info", p.alphabet_flower_info)

    game_journal.add_txt(lang, "sunflower", "This is a ^xFFFF00Sunflower^!. You can shrink and enter by going through 2 8x8x8 mazes, with some maps of the mazes inside, or by going throught the seedy tunnels in the face of the flower seed part. Obviously that second option has more difficult enemies.\n\nIt is impossible to go through the sunspots without killing any enemies, so his is not a good idea for Pacifist players.")
    game_journal.add_txt(lang, "sunflower_wilted", "A ^xFFFF00Sunflower^! should have shown up here, but it wilted instead, and turned into just a regular ol' Small Yellow Flower.\n Maybe try to find a place closer to a ^xFFFF00Sun^!?\n\nHint: My Sunflowers can only face to the side, never up or down or diagonally.")
    game_journal.add_txt(lang, "sunflower_treasure", "Now there would be better treasure here if you are inside of a Clay Planet and Small Minigun Planet at the same time. \nThis 'better treasure' lets you fight a boss and unlock a new area.\n\nYou can leave by going through the stem of the flower, which is Ying Tree")
    game_journal.add_txt(lang, "sunflower_treasure2", "^xFF00FFWhen you start the ritual, you won't be able to see the sun immediately, because it is where the sun is currently. It is also much larger than you.\nThe larger you are, the more damage you do, but also the more damage you take. Also, the farther you are, the less damage you take.\n\nYou can leave by going through the stem of the flower, which is Ying Tree\nWhen growing on the planet, blast away immediately.\n\nWhen you defeat the boss, your waypoints in this solar system will also all be wiped. ^!")

    game_journal.add_txt(lang, "ywkey_entrance", "^xff0000WARNING:^x00ff00 Yellow Key is required!\n\n^!Maybe you should come back later...")

    game_journal.add_txt(lang, "rwalk_maze_intro", "This is a maze generated with a random walk. Therefore it should be easier, and the branches not as deep.")
    game_journal.add_txt(lang, "rwalk_maze_treasure", "Use for a quadruple grow?")
    game_journal.add_txt(lang, "simple_rwalk_maze", "The entrance is under the opposite corner")

    game_journal.add_txt(lang, "mcl12_containment_base", "This is the ^x00ff00Mylantis Cave Layer 12 Containment Base^!. We have tried to make it as similar to simulations of MCL12. Note that some places may be innacurate or ^xff00ffunstable^!. We tried our best to make a reward for escaping MCL12. This blue ring device will take you to the center of this sample of MCL12. You will be shrunk so that the sample will be 1 megachunk big. And yes, there are anti-plugs, we don't like cheesing...\n\n^xff0000BEWARE: There are a lot of rats that have evolved to fight off most creatures.^!")
    game_journal.add_txt(lang, "mcl12_treasure", "^x00ff00Congratulations!!^!\n\nYou made it out of the sample of MCL12! Here's our reward. Now all yours.")

    game_journal.add_txt(lang, "community_challenges_intro", "Welcome to the community challenges!\n\n^x00FF00List of Challenges:^!\n\n1. ^xFF00FFPink Key^! Challenge\n2. ^xFF0000R^!^x00FF00i^!^x0000FFn^!^xFF00FFg^! Maze (Incomplete)\n3. Pool Balls Challenge\n4. 7x7x7x7 4 Dimensional Maze\n5. Ascend ^xFFFF00Yellow Rings ^!Challenge")

    game_journal.add_txt(lang, "pk_challenge_1", "Part 1: The 6 Keys\n\nYou will need the following keys: ^xA2EAFFLaser Genesis Key^!, ^x0000E0Blue Key^!, ^xFFF000Yellow Key^!, ^xFFFFFFKey To the Universe^!, ^xE42A26Farmhouse Key^!, and a specific ^x2BE404Green Key^!\n\nThe ^x2BE404Green Key^! is specifically the one with combination ^x2BE404wig_flower_stem_1^!\n\nRemember, obtaining the ^xA2EAFFLaser Genesis Key^! will also wipe your ammo.")
    game_journal.add_txt(lang, "pk_thehardest_1", "Part 2: ^xFF00FFThe Hidden Pink Ring^!\n\nI hope you know which areas lead to more areas without Pink Spheres in the Ying Forest.\n\nOnce you shrink down, the only way to come back to this size is to use a ^x0000FFBlue Ring.^! \n\nThe only way to progress it to find a ^xFF00FFPink Ring^! somewhere that will take you out of the Ying Forest.")
    game_journal.add_txt(lang, "pk_thehardest_2", "In the current beta branch im looking at, There is a Pink Active area in the Super Massive Black Hole.")

    game_journal.add_txt(lang, "rm_intro", "The ring maze is ahead of you.\n")
    game_journal.add_txt(lang, "rm_treasure", "Yeah this isn't finished... cause clearly the Ring interaction isn't working as expected. They all seem to be using a variable named ^xFFFFFFdist^! which is based of absolute distance from bent, so they aren't like cubes. \nI think a better way of doing this would be getting a distance in each of the three axes to see if the player is within the cube shaped hitbox of the ring instead of a sphere shaped hitbox, which is what the current system does. \n\nSo yeah, Dan pls fix this ^xFF00FFbug^! and then I can ^x00FF00maybe^! finish this.")

    game_journal.add_txt(lang, "pool_challenge", "Use the blue ring to take you to the entrance room to the Pool Balls Challenge. \n\nThe treasure will be in the direct opposite corner of this massive Megachunk, where that Pink Sphere is currently.\n\n^xFF0000Note: You will lose all your ammo when you enter, but there is some EMP ammo and Dark Hole recharges at the start. \n\nI recommend having more than 120 EMP Max Ammo for this and Black Hole Drive unlocked. ^!\n\n^xFFFF00 Oh, and also you need a Yellow Key to enter the treasure room.^!")
    game_journal.add_txt(lang, "pc_treasure", "Note: You should set a waypoint somewhere in I3 with easy access to a Pink Ring in case you decide to come back for ^xFF00FFthe secret on the floor.^!")

    game_journal.add_txt(lang, "7777_maze_container", "^xFF00FFThe 7x7x7x7 Hypermaze.^!\n\nThe way I am designing this should make this the hardest maze in the game.")
end
function p.alphabet_flower_info(chunk_id)
    local id = ga_chunk_id_to_parent_chunk_id(chunk_id)
    local code = ga_chunk_get_s(ga_chunk_id_to_level(id), ga_chunk_id_to_vcp(id), "code")
    return "Your code is:\n\n^xff00ff" .. code .. "^!\n\nThe maze is 8x8x8."
end