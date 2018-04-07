--<<== Items >>==--

-- sunflower Seeds
minetest.register_craftitem("sunflower:sunflower_seeds", {
    description = "Sunflower Seeds",
    groups = {seed = 1, food = 1},
    inventory_image = "sunflower_seeds.png",
    on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "fuel",
	recipe = "sunflower:sunflower_seeds",
	burntime = 2
})

minetest.register_craft({
	type = "shapeless",
	output = "sunflower:sunflower_seeds 4",
	recipe = {"flowers:sunflower"},
	replacements = {
		{"flowers:sunflower", "dye:yellow"}
	}
})

-- sunflower Seeds Dough
minetest.register_craftitem("sunflower:sunflower_seeds_dough", {
    description = "Sunflower Seeds Dough",
    groups = {food = 1},
    inventory_image = "sunflower_seeds_dough.png",
    on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "sunflower:sunflower_seeds_dough",
	recipe = {	{"", "sunflower:sunflower_seeds", ""},
				{"farming:flour", "farming:flour", "farming:flour"}
			}
})

-- sunflower Seeds Oil

minetest.register_node("sunflower:sunflower_seeds_oil", {
	description = "Bottle of Sunflower Seeds Oil",
	drawtype = "plantlike",
	tiles = {"sunflower_seeds_oil.png"},
	inventory_image = "sunflower_seeds_oil.png",
	wield_image = "sunflower_seeds_oil.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	on_use = minetest.item_eat(2, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, food = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "sunflower:sunflower_seeds_oil",
	recipe = {	{"sunflower:sunflower_seeds", "sunflower:sunflower_seeds", "sunflower:sunflower_seeds"},
				{"sunflower:sunflower_seeds", "sunflower:sunflower_seeds", "sunflower:sunflower_seeds"},
				{"", "vessels:glass_bottle", ""}
			}
})

minetest.register_craft({
	type = "fuel",
	recipe = "sunflower:sunflower_seeds_oil",
	burntime = 20,
	replacements = {{ "sunflower:sunflower_seeds_oil", "vessels:glass_bottle"}}
})

-- sunflower Seeds Roasted
minetest.register_craftitem("sunflower:sunflower_seeds_roasted", {
	description = "Roasted Sunflower Seeds",
	groups = {food = 1},
	inventory_image = "sunflower_seeds_roasted.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "fuel",
	recipe = "sunflower:sunflower_seeds_roasted",
	burntime = 2
})
-- sunflower Seeds Bread
minetest.register_craftitem("sunflower:sunflower_seeds_bread", {
	description = "Sunflower Seeds Bread",
	groups = {food = 1},
	inventory_image = "sunflower_seeds_bread.png",
	on_use = minetest.item_eat(4),
})

-- cooking Recipes
minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "sunflower:sunflower_seeds_bread",
	recipe = "sunflower:sunflower_seeds_dough"
})

minetest.register_craft({
	type = "cooking",
	output = "sunflower:sunflower_seeds_roasted",
	recipe = "sunflower:sunflower_seeds"
})

--<<== Technic-Support >>==--

if (minetest.get_modpath("technic")) then

	-- Support Compressor
	local compressor_recipes = {
					{"sunflower:sunflower_seeds 6", "sunflower:sunflower_seeds_oil"},
				}
	for _, data in pairs(compressor_recipes) do

		technic.register_compressor_recipe({input = {data[1]}, output = data[2]})

	end

	-- Support Centrifuge
	local centrifuge_recipes = {
					{ "flowers:sunflower",             "sunflower:sunflower_seeds 4",       "dye:yellow"      },
				}
				
	for _, data in pairs(centrifuge_recipes) do
	
		technic.register_separating_recipe({ input = { data[1] }, output = { data[2], data[3], data[4] } })
		
	end

	-- Support Extractor
	local extractor_recipes = {
		{"flowers:sunflower",                 "sunflower:sunflower_seeds 4"},
	}

	for _, data in ipairs(extractor_recipes) do
		technic.register_extractor_recipe({input = {data[1]}, output = data[2]})
	end
	
end
