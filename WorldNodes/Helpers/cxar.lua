-- also could be referred as misc.
-- not named that incase of conflicts.

function p.add_txt(x,y,z,api_name)
    set_pos(x,y,z,"block_xar_journal")
    block_set_s(x,y,z,"api_name",api_name)
end