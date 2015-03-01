mcrd = {}

mcrd.DiceRoll = {}
mcrd.DiceRoll[0] = minetest.dir_to_facedir({x= 0,y= 0,z= 1},true)
mcrd.DiceRoll[1] = minetest.dir_to_facedir({x= 0,y= 0,z=-1},true)
mcrd.DiceRoll[2] = minetest.dir_to_facedir({x= 0,y= 1,z= 0},true)
mcrd.DiceRoll[3] = minetest.dir_to_facedir({x= 0,y=-1,z= 0},true)
mcrd.DiceRoll[4] = minetest.dir_to_facedir({x= 1,y= 0,z= 0},true)
mcrd.DiceRoll[5] = minetest.dir_to_facedir({x=-1,y= 0,z= 0},true)

minetest.register_node("mcrd:dice", {
	tiles = {
		"mcrd_dice_tile_one.png",
		"mcrd_dice_tile_six.png",
		"mcrd_dice_tile_five.png",
		"mcrd_dice_tile_two.png",
		"mcrd_dice_tile_three.png",
		"mcrd_dice_tile_four.png"
	},
	description = "Throwable Dice",
	groups = { cracky=1,oddly_breakable_by_hand=1 },
	paramtype2 = "facedir",
	on_place = function (itemstack, placer, pointed_thing)
		local dir = math.floor(math.random(0,59)/10)
		minetest.chat_send_all(tostring(dir))
		local pos = minetest.get_pointed_thing_position(pointed_thing,true)
 
		minetest.set_node(pos,
		{
			name="mcrd:dice",
			param2=mcrd.DiceRoll[dir]
		})
 
		--itemstack:take_item()
		return itemstack
	end
})
