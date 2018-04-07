local sunflower = {}


--<<== Items >>==--

-- sunflower Seeds
minetest.register_craftitem("sunflower:sunflower_seeds", {
    description = "Sunflower Seeds",
    groups = {seed = 1, food = 1},
    inventory_image = "sunflower_seeds.png",
    on_use = minetest.item_eat(1),
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
minetest.register_craftitem("sunflower:sunflower_seeds_oil", {
    description = "Sunflower Seeds Oil",
    groups = {food = 1},
    inventory_image = "sunflower_seeds_oil.png",
    on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "sunflower:sunflower_seeds_oil",
	recipe = {	{"sunflower:sunflower_seeds", "sunflower:sunflower_seeds", "sunflower:sunflower_seeds"},
				{"sunflower:sunflower_seeds", "sunflower:sunflower_seeds", "sunflower:sunflower_seeds"},
				{"", "vessels:glass_bottle", ""}
			}
})

-- sunflower Seeds Roasted
minetest.register_craftitem("sunflower:sunflower_seeds_roasted", {
	description = "Roasted Sunflower Seeds",
	groups = {food = 1},
	inventory_image = "sunflower_seeds_roasted.png",
	on_use = minetest.item_eat(2),
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