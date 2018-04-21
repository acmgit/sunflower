--<<== Items >>==--

-- sunflower Seeds
minetest.register_craftitem("vegan_sunflower:seeds", {
    description = "Sunflower Seeds",
    groups = {seed = 1, food = 1},
    inventory_image = "vegan_sunflower_seeds.png",
    on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "fuel",
	recipe = "vegan_sunflower:seeds",
	burntime = 2
})

minetest.register_craft({
	type = "shapeless",
	output = "vegan_sunflower:seeds 4",
	recipe = {"flowers:sunflower"},
	replacements = {
		{"flowers:sunflower", "dye:yellow"}
	}
})

-- sunflower Seeds Dough
minetest.register_craftitem("vegan_sunflower:seeds_dough", {
    description = "Sunflower Seeds Dough",
    groups = {food = 1},
    inventory_image = "vegan_sunflower_seeds_dough.png",
    on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "vegan_sunflower:seeds_dough",
	recipe = {	{"", "vegan_sunflower:seeds", ""},
				{"farming:flour", "farming:flour", "farming:flour"}
			}
})

-- sunflower Seeds Oil

minetest.register_node("vegan_sunflower:seeds_oil", {
	description = "Bottle of Sunflower Seeds Oil",
	drawtype = "plantlike",
	tiles = {"vegan_sunflower_seeds_oil.png"},
	inventory_image = "vegan_sunflower_seeds_oil.png",
	wield_image = "vegan_sunflower_seeds_oil.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	on_use = minetest.item_eat(2, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, food = 1, food_oil = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "vegan_sunflower:seeds_oil",
	recipe = {	{"vegan_sunflower:seeds", "vegan_sunflower:seeds", "vegan_sunflower:seeds"},
				{"vegan_sunflower:seeds", "vegan_sunflower:seeds", "vegan_sunflower:seeds"},
				{"", "vessels:glass_bottle", ""}
			}
})

minetest.register_craft({
	type = "fuel",
	recipe = "vegan_sunflower:seeds_oil",
	burntime = 20,
	replacements = {{ "vegan_sunflower:seeds_oil", "vessels:glass_bottle"}}
})

-- sunflower Seeds Roasted
minetest.register_craftitem("vegan_sunflower:seeds_roasted", {
	description = "Roasted Sunflower Seeds",
	groups = {food = 1},
	inventory_image = "vegan_sunflower_seeds_roasted.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "fuel",
	recipe = "vegan_sunflower:seeds_roasted",
	burntime = 2
})
-- sunflower Seeds Bread
minetest.register_craftitem("vegan_sunflower:seeds_bread", {
	description = "Sunflower Seeds Bread",
	groups = {food = 1},
	inventory_image = "vegan_sunflower_seeds_bread.png",
	on_use = minetest.item_eat(4),
})

-- cooking Recipes
minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "vegan_sunflower:seeds_bread",
	recipe = "vegan_sunflower:seeds_dough"
})

minetest.register_craft({
	type = "cooking",
	output = "vegan_sunflower:seeds_roasted",
	recipe = "vegan_sunflower:seeds"
})

--<<== Technic-Support >>==--

if (minetest.get_modpath("technic")) then

	-- Support Compressor
	local compressor_recipes = {
					{"vegan_sunflower:seeds 6", "vegan_sunflower:seeds_oil"},
				}
	for _, data in pairs(compressor_recipes) do

		technic.register_compressor_recipe({input = {data[1]}, output = data[2]})

	end

	-- Support Centrifuge
	local centrifuge_recipes = {
					{ "flowers:sunflower",             "vegan_sunflower:seeds 4",       "dye:yellow"      },
				}
				
	for _, data in pairs(centrifuge_recipes) do
	
		technic.register_separating_recipe({ input = { data[1] }, output = { data[2], data[3], data[4] } })
		
	end

	-- Support Extractor
	local extractor_recipes = {
		{"flowers:sunflower",                 "vegan_sunflower:seeds 4"},
	}

	for _, data in ipairs(extractor_recipes) do
		technic.register_extractor_recipe({input = {data[1]}, output = data[2]})
	end
	
end
