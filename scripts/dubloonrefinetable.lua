local refineConfig = {
    {item = "phlegm", cost = 3, qty = 3}, --Phlegm
    {item = "walrus_tusk", cost = 3, qty = 5}, --Walrus Tusk
    {item = "gnarwail_horn", cost = 3, qty = 8}, --Gnarwail Horn
    {item = "blackflag", cost = 3, qty = 1}, --Black Flag
    {item = "gears", cost = 3, qty = 1}, --Gears
    {item = "lantern", cost = 3, qty = 1}, --Lantern
    {item = "spidereggsack", cost = 3, qty = 1}, --Spider Eggs
    {item = "steelwool", cost = 3, qty = 1}, --Steel Wool
    {item = "tentaclespots", cost = 3, qty = 1}, --Tentacle Spots
    {item = "messagebottleempty", cost = 5, qty = 1}, --Empty Bottle
    {item = "cutless", cost = 5, qty = 1}, --Cutless
    {item = "coontail", cost = 8, qty = 1}, --Catcoon Tail
    {item = "goose_feather", cost = 8, qty = 1}, --Down Feather
    {item = "malbatross_feather", cost = 8, qty = 1}, --Malbatross Feather
    {item = "slurper_pelt", cost = 8, qty = 1}, --Slurper Pelt
    {item = "beardhair", cost = 10, qty = 1}, --Beard Hair
    {item = "slurtle_shellpieces", cost = 10, qty = 1}, --Broken Shell
    {item = "townportaltalisman", cost = 10, qty = 1}, --Desert Stone
    {item = "furtuft", cost = 15, qty = 1}, --Fur Tuft
    {item = "goldnugget", cost = 15, qty = 1}, --Gold Nugget
    {item = "beefalowool", cost = 20, qty = 1}, --Beefalo Wool
    {item = "boneshard", cost = 20, qty = 1}, --Bone Shard
    {item = "flint", cost = 20, qty = 1}, --Flint
    {item = "houndstooth", cost = 20, qty = 1}, --Hound Tooth
    {item = "moonglass", cost = 20, qty = 1}, --Moon Glass Shard
    {item = "mosquitosack", cost = 20, qty = 1}, --Mosquito Sack
    {item = "nightmarefuel", cost = 20, qty = 1}, --Nightmare Fuel
    {item = "poop", cost = 20, qty = 1}, --Manure
    {item = "rocks", cost = 20, qty = 1}, --Rocks
    {item = "rottenegg", cost = 20, qty = 1}, --Rotten Egg
    {item = "silk", cost = 20, qty = 1}, --Silk
    {item = "spidergland", cost = 20, qty = 1}, --Spider Gland
    {item = "pinecone", cost = 30, qty = 1}, --Pinecone
    {item = "cutgrass", cost = 40, qty = 1}, --Cut Grass
    {item = "twigs", cost = 40, qty = 1}, --Twigs
    {item = "spoiled_food", cost = 40, qty = 1}, --Rot
    {item = "stinger", cost = 40, qty = 1}, --Stinger
    {item = "ash", cost = 60, qty = 1}, --Ash
    {item = "carnival_prizeticket", cost = 20, qty = 1, tech = TECH.CARNIVAL_PRIZESHOP_ONE, filter = {"CRAFTING_STATION", "DUBLOONREFINE"}, sortkey = -21}, --Dubloon recipes (Cawnival)
    {item = "lucky_goldnugget", cost = 3, qty = 1, tech = TECH.PERDOFFERING_ONE, filter = {"CRAFTING_STATION", "DUBLOONREFINE"}, sortkey = -22}, --Lunar New Year event recipes
    {item = "peg_leg", cost = 3, qty = 3, tag = {"Island"}}, -- Peg Leg
    {item = "snakeoil", cost = 3, qty = 8, tag = {"Island"}}, -- Snake Oil
    {item = "magic_seal", cost = 3, qty = 15, tag = {"Island"}}, -- Magic Seal
    {item = "tigereye", cost = 3, qty = 15, tag = {"Island"}}, -- Eye of the Tiger Shark
    {item = "sunken_boat_trinket_4", cost = 3, qty = 15, tag = {"Island"}}, -- Sea Worther
    {item = "needlespear", cost = 3, tag = {"Island"}}, -- Cactus Spike
    {item = "bottlelantern", cost = 3, tag = {"Island"}}, -- Bottle Lantern
    {item = "boat_lantern", cost = 3, tag = {"Island"}}, -- Boat Lantern
    {item = "doydoyfeather", cost = 8, tag = {"Island"}}, -- Doydoy Feather
    {item = "dorsalfin", cost = 10, tag = {"Island"}}, -- Dorsal Fin
    {item = "ia_messagebottleempty", cost = 10, tag = {"Island"}}, -- Empty Message Bottle
    {item = "mosquitosack_yellow", cost = 10, tag = {"Island"}}, -- Yellow Mosquito Sack
    {item = "snakeskin", cost = 10, tag = {"Island"}}, -- Snake Skin
    {item = "venomgland", cost = 10, tag = {"Island"}}, -- Venom Gland
    {item = "tar", cost = 15, tag = {"Island"}}, -- Tar
    {item = "bamboo", cost = 20, tag = {"Island"}}, -- Bamboo
    {item = "coral", cost = 20, tag = {"Island"}}, -- Coral
    {item = "palmleaf", cost = 20, tag = {"Island"}}, -- Palm Leaf
    {item = "sand", cost = 20, tag = {"Island"}}, -- Sand
    {item = "seashell", cost = 20, tag = {"Island"}}, -- Seashell
    {item = "vine", cost = 20, tag = {"Island"}}, -- Vine
    {item = "hail_ice", cost = 30, tag = {"Island"}}, -- Hail
    {item = "jungletreeseed", cost = 30, tag = {"Island"}}, -- Jungle Tree Seed
}

return refineConfig