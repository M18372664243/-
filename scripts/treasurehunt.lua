local slotmachineutils = require "modules.slotmachineutils"
local internalloot =
{
-------------------------------GOOD LIST---------------------------------------------
["staydry"] = {loot = {umbrella = 1, raincoat = 1, rainhat = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 雨伞、雨衣、雨帽，防雨三件套
["gears"] = {loot = {gears = 5,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 齿轮x5
["cooloff"] = {loot = {ice = 3, hawaiianshirt = 1, umbrella = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 冰、花纹寸衫、雨伞，降温三件套
["birders"] = {loot = {birdtrap = 1, featherhat = 1, seeds = 4,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 捕鸟器、羽毛帽、种子x4，捕鸟爱好者套装
["slot_goldy"] = {loot = {goldnugget = 5,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 金块x5，金色宝藏
["slot_honeypot"] = {loot = {beehat = 1, bandage = 1, honey = 5,}, group_tag = {"good"}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 蜜蜂帽、绷带、蜂蜜x5，蜂蜜收集者套装
["slot_warrior1"] = {loot = {footballhat = 1, armorwood = 1, spear = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 足球帽、木制盔甲、矛，初级战士套装
["slot_warrior2"] = {loot = {armormarble = 1, hambat = 1, blowdart_pipe = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 大理石盔甲、火腿棒、吹箭筒，中级战士套装
["slot_warrior3"] = {loot = {trap_teeth = 1, armorgrass = 1, boomerang = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 陷阱牙齿、草制盔甲、回旋镖，陷阱战士套装
["slot_warrior4"] = {loot = {armor_sanity = 1, nightsword = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 精神铠甲、暗夜之剑，高级战士套装（注：IA stuff被注释掉了）
["slot_scientist"] = {loot = {transistor = 3, heatrock = 1, gunpowder = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 晶体管x3、热岩石、火药x3，科学家套装
["slot_walker"] = {loot = {cane = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 手杖、金块x3，步行者套装
["slot_gemmy"] = {loot = {redgem = 3, bluegem = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 红宝石x3、蓝宝石x3，宝石套装
["slot_bestgem"] = {loot = {purplegem = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 紫宝石x3，最佳宝石
["slot_lifegiver"] = {loot = {amulet = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 护身符、金块x3，生命赋予者套装
["slot_chilledamulet"] = {loot = {blueamulet = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 蓝色护身符、金块x3，冷却护身符套装
["slot_icestaff"] = {loot = {icestaff = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 冰魔杖、金块x3，冰魔杖套装
["slot_firestaff"] = {loot = {firestaff = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 火魔杖、金块x3，火魔杖套装
["slot_coolasice"] = {loot = {icehat = 1, umbrella = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 冰帽、雨伞，冰爽套装（注：palmleaf_umbrella被注释掉了）
["slot_gunpowder"] = {loot = {gunpowder = 5,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 火药x5
["slot_darty"] = {loot = {blowdart_pipe = 1, blowdart_sleep = 1, blowdart_fire = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 吹箭筒、睡眠吹箭、火焰吹箭，吹箭套装
["slot_firedart"] = {loot = {blowdart_fire = 3, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 火焰吹箭x3、金块x3，火焰吹箭套装
["slot_sleepdart"] = {loot = {blowdart_sleep = 3, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 睡眠吹箭x3、金块x3，睡眠吹箭套装
["slot_blowdart"] = {loot = {blowdart_pipe = 3, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 吹箭筒x3、金块x3，吹箭筒套装
--["slot_speargun"] = {loot = {spear-launcher = 1, spear = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- IA专用，被注释掉了
["slot_dapper"] = {loot = {cane = 1, goldnugget = 3, tophat = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 手杖、金块x3、高顶礼帽，绅士套装
["slot_speed"] = {loot = {yellowamulet = 1, nightmarefuel = 3, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 黄色护身符、噩梦燃料x3、金块x3，速度套装
["slot_coconades"] = {loot = {gunpowder = 5, slurtleslime = 5, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 火药x5、蜗牛粘液x5、金块x3，椰子炸弹套装（注：coconade= 3被注释掉了）
--["slot_obsidian"] = {loot = {--obsidian= 5,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 在IA列表中
["slot_thuleciteclub"] = {loot = {ruins_bat = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 遗迹蝙蝠、金块x3，遗迹棍棒套装
["slot_thulecitesuit"] = {loot = {armorruins = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 遗迹铠甲、金块x3，遗迹铠甲套装
["slot_ultimatewarrior"] = {loot = {armorruins = 1, ruins_bat = 1, ruinshat = 1,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 遗迹铠甲、遗迹蝙蝠、遗迹帽，终极战士套装
["slot_goldenaxe"] = {loot = {goldenaxe = 1, goldnugget = 3,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 金斧头、金块x3，金斧头套装
--["slot_monkeyball"] = {loot = {monkeyball = 1, cave_banana = 2,}, group_tag = {"good"}, classify_tag = {"DropDefault"},},  -- 被注释掉了
--31 original drops  
  
--My Additions  
--Jackpots (Dubloons) 6 total  
["jackpot1"] = {loot = {dubloon = 3,}, group_tag = {"good"}, classify_tag = {"DropJackpot"},},  -- 3个金币
["jackpot2"] = {loot = {dubloon = 5,}, group_tag = {"good"}, classify_tag = {"DropJackpot"},},  -- 5个金币
["jackpot3"] = {loot = {dubloon = 10,}, group_tag = {"good"}, classify_tag = {"DropJackpot"},},  -- 10个金币
["jackpot4"] = {loot = {dubloon = 20,}, group_tag = {"good"}, classify_tag = {"DropJackpot"},},  -- 20个金币
["jackpot5"] = {loot = {dubloon = 30,}, group_tag = {"good"}, classify_tag = {"DropJackpot"},},  -- 30个金币
["jackpot6"] = {loot = {dubloon = 50,}, group_tag = {"good"}, classify_tag = {"DropJackpot"},},  -- 50个金币
["jackpot7"] = {loot = {dubloon = 100,}, group_tag = {"good"}, classify_tag = {"DropJackpot"},},  -- 100个金币
--Blueprints (synergy with cavemen :smug:) 31 total  
["blueprint1"] = {loot = {blueprint = 2,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 蓝图x2
["blueprint2"] = {loot = {blueprint = 3,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 蓝图x3
["blueprint3"] = {loot = {blueprint = 4,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 蓝图x4
["blueprint4"] = {loot = {blueprint = 8,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 蓝图x8
["blueprint5"] = {loot = {ruinsrelic_table_blueprint = 1, ruinsrelic_chair_blueprint = 1, ruinsrelic_vase_blueprint = 1, ruinsrelic_plate_blueprint = 1, ruinsrelic_bowl_blueprint = 1, ruinsrelic_chipbowl_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 遗迹遗物蓝图套装
["blueprint6"] = {loot = {townportal_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 懒人传送塔蓝图
["blueprint7"] = {loot = {dragonflyfurnace_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 龙蝇火炉蓝图
["blueprint8"] = {loot = {bundlewrap_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 包裹蓝图
["blueprint9"] = {loot = {trident_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 三叉戟蓝图
["blueprint10"] = {loot = {deserthat_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 沙漠帽蓝图
["blueprint11"] = {loot = {endtable_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 终端桌蓝图
["blueprint12"] = {loot = {mushroom_light_blueprint = 1, mushroom_light2_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 蘑菇灯蓝图套装
["blueprint13"] = {loot = {blue_mushroomhat_blueprint = 1, green_mushroomhat_blueprint = 1, red_mushroomhat_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},}, -- 蓝色蘑菇帽蓝图、绿色蘑菇帽蓝图、蓝色蘑菇帽蓝图
["blueprint14"] = {loot = {sleepbomb_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 睡眠炸弹蓝图x1
["blueprint15"] = {loot = {turf_shellbeach_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 贝壳沙滩地皮蓝图x1
["blueprint16"] = {loot = {turfcraftingstation_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 制作站地皮蓝图x1
["blueprint17"] = {loot = {archive_resonator_item_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 档案共振器蓝图x1
["blueprint18"] = {loot = {refined_dust_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 精炼尘埃蓝图x1
["blueprint19"] = {loot = {moonstorm_goggleshat_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 月暴护目镜帽蓝图x1
["blueprint20"] = {loot = {oceanfishinglure_hermit_rain_tacklesketch = 1, oceanfishinglure_hermit_snow_tacklesketch = 1, oceanfishinglure_hermit_drowsy_tacklesketch = 1, oceanfishinglure_hermit_heavy_tacklesketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 海钓饵（隐士）雨/雪/困倦/重型钓图各x1
["blueprint21"] = {loot = {winch_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 绞盘蓝图x1
["blueprint22"] = {loot = {dock_kit_blueprint = 1, dock_woodposts_item_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 码头工具包蓝图x1 + 码头木桩蓝图x1
["blueprint23"] = {loot = {boat_cannon_kit_blueprint = 1, cannonball_rock_item_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 船炮套件蓝图x1 + 岩石炮弹蓝图x1
["blueprint24"] = {loot = {polly_rogershat_blueprint = 1, pirate_flag_pole_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 波莉·罗杰斯帽蓝图x1 + 海盗旗杆蓝图x1
["blueprint25"] = {loot = {antlionhat_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 蚁狮帽蓝图x1
["blueprint26"] = {loot = {turf_ruinstrim_glow_blueprint = 1, turf_ruinsbrick_glow_blueprint = 1, turf_ruinstiles_glow_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 发光废墟边缘/砖块/瓦片地皮蓝图各x1
["blueprint27"] = {loot = {turf_ruinstrim_blueprint = 1, turf_ruinsbrick_blueprint = 1, turf_ruinstiles_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 废墟边缘/砖块/瓦片地皮蓝图各x1
["blueprint28"] = {loot = {cookingrecipecard = 2,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 烹饪食谱卡x2
["blueprint29"] = {loot = {cookingrecipecard = 3,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 烹饪食谱卡x3
["blueprint30"] = {loot = {armordreadstone_blueprint = 1, dreadstonehat_blueprint = 1, wall_dreadstone_item_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 恐惧石护甲/帽子/墙壁蓝图各x1
["blueprint31"] = {loot = {support_pillar_scaffold_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 支撑柱脚手架蓝图x1
["blueprint32"] = {loot = {support_pillar_dreadstone_scaffold_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 恐惧石支撑柱脚手架蓝图x1
["blueprint33"] = {loot = {cotl_tabernacle_level1_blueprint = 1, turf_cotl_gold_blueprint = 1, turf_cotl_brick_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- COTL圣所等级1蓝图x1 + COTL金/砖块地皮蓝图各x1
["blueprint34"] = {loot = {armorwagpunk_blueprint = 1, wagpunkhat_blueprint = 1, wagpunkbits_kit_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 瓦朋克护甲/帽子/零件工具包蓝图各x1
["blueprint35"] = {loot = {carpentry_station_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 木工站蓝图x1
["blueprint36"] = {loot = {chestupgrade_stacksize_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropBlueprint"},},  -- 箱子堆叠大小升级蓝图x1
--Event drops
["event1"] = {loot = {lucky_goldnugget = 10,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 幸运金块x10
["event2"] = {loot = {lucky_goldnugget = 20,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 幸运金块x20
["event3"] = {loot = {perdfan = 1, houndwhistle = 1, nightcaphat = 1,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 完美风扇x1, 猎犬哨子x1, 夜间帽x1
["event4"] = {loot = {firecrackers = 6, redlantern = 2, miniboatlantern = 2,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 鞭炮x6, 红灯笼x2, 迷你灯笼x2
["event5"] = {loot = {dragonheadhat = 1, dragonbodyhat = 1, dragontailhat = 1,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 龙首帽x1, 龙身帽x1, 龙尾帽x1
["event6"] = {loot = {perdshrine_blueprint = 1, wargshrine_blueprint = 1, pigshrine_blueprint = 1, yotc_carratshrine_blueprint = 1, yotb_beefaloshrine_blueprint = 1, yot_catcoonshrine_blueprint = 1, yotr_rabbitshrine_blueprint = 1, yotd_dragonshrine_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 各种祭坛蓝图x1
["event7"] = {loot = {dragonboat_kit = 1, boat_bumper_yotd_kit = 2, yotd_oar = 2,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 龙舟套件x1, 船保险杠套件x2, 船桨x2
["event8"] = {loot = {mast_yotd_item = 1, mastupgrade_lamp_item_yotd = 1, yotd_steeringwheel_item = 1, yotd_anchor_item = 1,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 各种船配件x1
["event9"] = {loot = {dragonboat_pack = 2,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 龙舟包x2
["event10"] = {loot = {giftwrap = 4,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 礼品包装纸x4
["event11"] = {loot = {giftwrap_blueprint = 1, winter_treestand_blueprint = 1, wintersfeastoven_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 各种蓝图x1
["event12"] = {loot = {wintersfeastfuel = 5,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 冬宴燃料x5
["event13"] = {loot = {carnival_plaza_kit = 1, carnival_prizebooth_kit = 1, carnival_gametoken = 3,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 嘉年华广场套件x1, 奖品摊位套件x1, 游戏代币x3
["event14"] = {loot = {carnivalgame_memory_kit = 1, carnivalgame_feedchicks_kit = 1, carnivalgame_herding_kit = 1, carnival_gametoken = 3,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 各种嘉年华游戏套件x1, 游戏代币x3
["event15"] = {loot = {carnivalgame_puckdrop_kit = 1, carnivalgame_shooting_kit = 1, carnivalgame_wheelspin_kit = 1, carnival_gametoken = 3,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 同上
["event16"] = {loot = {candybag = 2, madscience_lab_blueprint = 1,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 糖果袋x2, 疯狂科学实验室蓝图x1
["event17"] = {loot = {halloweenpotion_moon = 2, livingtree_root = 2, halloweenpotion_sparks = 1, halloweenpotion_embers = 1,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 万圣节药剂x2, 生命树根x2, 火花药剂x1, 余烬药剂x1
["event18"] = {loot = {halloweenpotion_bravery_large = 2, halloweenpotion_health_large = 2, halloweenpotion_sanity_large = 2,}, group_tag = {"good"}, classify_tag = {"DropEvent"},},  -- 万圣节勇气药剂（大）x2, 健康药剂（大）x2, 理智药剂（大）x2
--Top Tier gear: Ruins, lunar islandgears
["top1"] = {loot = {thulecite = 5,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 图勒石x5
["top2"] = {loot = {greenamulet = 1, orangeamulet = 1, yellowamulet = 1}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 绿色护身符x1, 橙色护身符x1, 黄色护身符x1
["top3"] = {loot = {greenstaff = 1, orangestaff = 1}, yellowstaff = 1, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 绿色法杖x1, 橙色法杖x1, 黄色法杖x1（注意：这里的黄色法杖后面没有逗号，可能是格式错误）
["top4"] = {loot = {eyeturret_item = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 眼炮塔x1
["top5"] = {loot = {opalstaff = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 猫眼石法杖x1
["top6"] = {loot = {greengem = 1, orangegem = 1, yellowgem = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 绿色宝石x1, 橙色宝石x1, 黄色宝石x1
["top7"] = {loot = {greengem = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 绿色宝石x1
["top8"] = {loot = {orangegem = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 橙色宝石x1
["top9"] = {loot = {yellowgem = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 黄色宝石x1
["top10"] = {loot = {moonglass = 10,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 月光玻璃x10
["top11"] = {loot = {glasscutter = 1, moonglassaxe = 1, bathbomb = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 玻璃刀x1, 月光玻璃斧x1, 泡泡浴炸弹x1
["top12"] = {loot = {moonglassaxe = 3,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 月光玻璃斧x3
["top13"] = {loot = {glasscutter = 3,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 玻璃刀x3
["top14"] = {loot = {krampus_sack = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 坎普斯背包x1
["top15"] = {loot = {armordreadstone = 1, dreadstonehat = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 噩梦石护甲x1, 噩梦石帽x1
["top16"] = {loot = {purebrilliance = 4, lunarplant_husk = 6, lunar_forge_kit = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 纯净光辉x4, 月光植物外壳x6, 月光锻造包x1
["top17"] = {loot = {armor_lunarplant = 1, lunarplanthat = 1, sword_lunarplant = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 月光植物护甲x1, 月光植物帽x1, 月光植物剑x1
["top18"] = {loot = {staff_lunarplant = 1, bomb_lunarplant = 6, lunarplant_kit = 2,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 月光植物法杖x1, 月光植物炸弹x6, 月光植物包x2
["top19"] = {loot = {pickaxe_lunarplant = 1, shovel_lunarplant = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 月光植物镐x1, 月光植物铲x1
["top20"] = {loot = {voidclothhat = 1, armor_voidcloth = 1, voidcloth_scythe = 1}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 虚空布帽x1, 虚空布护甲x1, 虚空布镰刀x1
["top21"] = {loot = {voidcloth_umbrella = 2, voidcloth_kit = 2,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 虚空布伞x2, 虚空布包x2
["top22"] = {loot = {horrorfuel = 4, voidcloth = 4, shadow_forge_kit = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 恐怖燃料x4, 虚空布x4, 暗影锻造包x1
["top23"] = {loot = {beargerfur_sack = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 熊獾毛皮袋x1
["top24"] = {loot = {deerclopseyeball_sentryward_kit = 1, deerclops_eyeball = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 独眼巨鹿眼球哨兵哨站套件x1, 独眼巨鹿眼球x1
["top25"] = {loot = {houndstooth_blowpipe = 1, houndstooth = 10,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 猎犬牙吹箭筒x1, 猎犬牙x10
["top26"] = {loot = {armorwagpunk = 1, wagpunkhat = 1, wagpunkbits_kit = 2,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 瓦朋克护甲x1, 瓦朋克帽x1, 瓦朋克部件套件x2
["top27"] = {loot = {wagpunk_bits = 10,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 瓦朋克部件x10
["top28"] = {loot = {chestupgrade_stacksize = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 箱子堆叠升级x1
["top29"] = {loot = {storage_robot = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 存储机器人x1
["top30"] = {loot = {beeswax_spray = 1,}, group_tag = {"good"}, classify_tag = {"DropTop"},},  -- 蜂蜡喷雾x1
--Boss drops
["boss1"] = {loot = {livinglog = 6,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 活木x6
["boss2"] = {loot = {spiderhat = 1, spidereggsack = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 蜘蛛帽x1，蜘蛛卵袋x1
["boss3"] = {loot = {deerclops_eyeball = 1, chesspiece_deerclops_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 独眼巨鹿眼球x1，独眼巨鹿棋子草图x1
["boss4"] = {loot = {goose_feather = 5, chesspiece_moosegoose_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 鹅羽毛x5，鹅鹿棋子草图x1
["boss5"] = {loot = {townportaltalisman = 5, chesspiece_antlion_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 传送门护符x5，蚁狮棋子草图x1
["boss6"] = {loot = {bearger_fur = 1, chesspiece_bearger_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 熊獾毛皮x1，熊獾棋子草图x1
["boss7"] = {loot = {malbatross_beak = 1, malbatross_feather = 12, chesspiece_malbatross_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 邪天翁喙x1，邪天翁羽毛x12，邪天翁棋子草图x1
["boss8"] = {loot = {minotaurhorn = 1, chesspiece_minotaur_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 远古犀牛角x1，远古犀牛棋子草图x1
["boss9"] = {loot = {dragon_scales = 2, lavae_egg = 1, chesspiece_dragonfly_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 龙鳞x2，熔岩虫卵x1，龙蝇棋子草图x1
["boss10"] = {loot = {royal_jelly = 5, hivehat = 1, chesspiece_beequeen_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 蜂王浆x5，蜂巢帽x1，蜂后棋子草图x1
["boss11"] = {loot = {bundlewrap = 3, chesspiece_klaus_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 包裹纸x3，克劳斯棋子草图x1
["boss12"] = {loot = {armor_sanity = 1, nightsword = 1, shadowheart = 1, chesspiece_rook_sketch = 1, chesspiece_knight_sketch = 1, chesspiece_bishop_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 理智护甲x1，暗影剑x1，暗影之心x1，车棋子草图x1，骑士棋子草图x1，主教棋子草图x1
["boss13"] = {loot = {skeletonhat = 1, armorskeleton = 1, thurible = 1, chesspiece_stalker_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 骨架帽x1，骨架护甲x1，香炉x1，织影者棋子草图x1
["boss14"] = {loot = {shroom_skin = 2, chesspiece_toadstool_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 毒菌皮x2，毒菌蟾蜍棋子草图x1
["boss15"] = {loot = {trident = 1, barnacle = 5, chesspiece_crabking_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 三叉戟x1，藤壶x5，帝王蟹棋子草图x1
["boss16"] = {loot = {alterguardianhat = 1, chesspiece_guardianphase3_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 守卫者帽子x1，守卫者三阶段棋子草图x1
["boss17"] = {loot = {alterguardianhatshard = 3,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 守卫者帽子碎片x3
["boss18"] = {loot = {eyemaskhat = 1, milkywhites = 3, chesspiece_eyeofterror_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 恐怖之眼面具x1，牛奶白x3，恐怖之眼棋子草图x1
["boss19"] = {loot = {shieldofterror = 1, yellowgem = 1, greengem = 1, chesspiece_twinsofterror_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 恐怖之盾x1，黄宝石x1，绿宝石x1，恐怖双子棋子草图x1
["boss20"] = {loot = {dreadstone = 6, horrorfuel = 4, chesspiece_daywalker_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 噩梦燃料石x6，噩梦燃料x4，噩梦猪人棋子草图x1
["boss21"] = {loot = {security_pulse_cage = 1, deerclops_eyeball = 1, chesspiece_deerclops_mutated_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 脉冲牢笼x1，晶体独眼巨鹿眼球x1，晶体独眼巨鹿棋子草图x1
["boss22"] = {loot = {security_pulse_cage = 1, bearger_fur = 1, chesspiece_bearger_mutated_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 脉冲牢笼x1，装甲熊毛皮x1，装甲熊棋子草图x1
["boss23"] = {loot = {security_pulse_cage_full = 1, chesspiece_warg_mutated_sketch = 1,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 完整脉冲牢笼x1，月狼棋子草图x1
["boss24"] = {loot = {scraphat = 1, scrap_monoclehat = 1, wagpunkbits_kit = 1, wagpunk_bits = 4,}, group_tag = {"good"}, classify_tag = {"DropBoss"},},  -- 废铁帽x1，单片眼镜废铁帽x1，瓦格朋克部件套装x1，瓦格朋克部件x4
--Character Specific
["char1"] = {loot = {armor_bramble = 1, trap_bramble = 1, compostwrap = 1}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 荆棘护甲x1，荆棘陷阱x1，肥料包裹x1
["char2"] = {loot = {balloon = 1, balloonspeed = 1, balloonparty = 1, balloonvest = 1, balloonhat = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 气球x1，速度气球x1，派对气球x1，气球背心x1，气球帽x1
["char3"] = {loot = {sewing_tape = 5,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 缝纫胶带x5
["char4"] = {loot = {bernie_inactive = 1, lighter = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 沉睡的伯尼x1，打火机x1
["char5"] = {loot = {wathgrithrhat = 1, spear_wathgrithr = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 瓦丝格雷斯帽x1，瓦丝格雷斯长矛x1
["char6"] = {loot = {spicepack = 2,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 香料包x2
["char7"] = {loot = {portabletent_item = 1, walterhat = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 便携帐篷x1，沃尔特帽x1
["char8"] = {loot = {wortox_soul = 5,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 沃拓克斯之魂x5
["char9"] = {loot = {mermhat = 2,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 鱼人帽x2
["char10"] = {loot = {gazpacho = 1, dragonchilisalad = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 鳄梨酱x1，火龙果沙拉x1
["char11"] = {loot = {frogfishbowl = 1, glowberrymousse = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 青蛙鱼缸x1，发光莓慕斯x1
["char12"] = {loot = {voltgoatjelly = 1, nightmarepie = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 电羊奶冻x1，噩梦馅饼x1
["char13"] = {loot = {taffy_spice_chili = 3,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 辣味太妃糖x3
["char14"] = {loot = {taffy_spice_garlic = 3,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 蒜味太妃糖x3
["char15"] = {loot = {taffy_spice_sugar = 3,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 糖味太妃糖x3
["char16"] = {loot = {walking_stick = 1, woodcarvedhat = 1, leif_idol = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 木杖x1，木雕帽x1，雷夫偶像x1		--新伍迪技能树物品！
["char17"] = {loot = {ipecacsyrup = 3,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 依匹克糖浆x3		--新沃姆伍德技能树物品！
["char18"] = {loot = {wathgrithr_improvedhat = 1, spear_wathgrithr_lightning = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 改进的瓦丝格雷斯帽x1，闪电瓦丝格雷斯长矛x1		--新薇格弗德技能树物品！
["char19"] = {loot = {saddle_wathgrithr = 1,}, group_tag = {"good"}, classify_tag = {"DropChar"},},  -- 瓦丝格雷斯马鞍x1
  
--My good drops: 133 total  
--Armor sets  
["good1"] = {loot = {armorsnurtleshell = 1, slurtlehat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 蜗牛壳护甲x1，蜗牛帽x1
["good2"] = {loot = {armordragonfly = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 龙蝇护甲x1
["good3"] = {loot = {cookiecutterhat = 1, beehat = 1, slurtlehat = 1}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 饼干切割者帽x1，蜜蜂帽x1，蜗牛帽x1
["good4"] = {loot = {armor_sanity = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 理智护甲x2
["good5"] = {loot = {armormarble = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 大理石护甲x2
["good6"] = {loot = {armorsnurtleshell = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 蜗牛壳护甲x2
["good7"] = {loot = {cookiecutterhat = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 饼干切割者帽x2
["good8"] = {loot = {beehat = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 蜜蜂帽x2
["good9"] = {loot = {wathgrithrhat = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 瓦丝格雷斯帽x2
["good10"] = {loot = {slurtlehat = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 蜗牛帽x2
  
--Weapon sets  
["good11"] = {loot = {nightsword = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 暗夜剑x2
["good12"] = {loot = {hambat = 1, footballhat = 1}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 火腿棒x1，足球帽x1
["good13"] = {loot = {tentaclespike = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 触手尖刺x2
["good14"] = {loot = {nightstick = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 警棍x2
["good15"] = {loot = {batbat = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 蝙蝠棒x2
["good16"] = {loot = {whip = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 鞭子x2
["good17"] = {loot = {boomerang = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 回旋镖x2
["good18"] = {loot = {blowdart_yellow = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 黄色吹箭x3
["good19"] = {loot = {icestaff = 1, firestaff = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 冰魔杖x1，火魔杖x1
["good20"] = {loot = {staff_tornado = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 龙卷风魔杖x1
--Tools
["good21"] = {loot = {razor = 1, beardhair = 4, silk = 4,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 剃刀x1，胡须x4，丝线x4
["good22"] = {loot = {multitool_axe_pickaxe = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 多功能斧镐x2
["good23"] = {loot = {brush = 1, saddlehorn = 1, beefalohat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 刷子x1，鞍角x1，野牛帽x1
["good24"] = {loot = {farm_hoe = 1, pitchfork = 1, hammer = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 锄头x1，草叉x1，锤子x1
["good25"] = {loot = {featherpencil = 5,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 羽毛笔x5
["good26"] = {loot = {bugnet = 1, fishingrod = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 捕虫网x1，钓鱼竿x1
["good27"] = {loot = {goldenaxe = 1, goldenpickaxe = 1, goldenshovel = 1, golden_farm_hoe = 1, goldenpitchfork = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 金斧头x1，金镐x1，金铲x1，金锄头x1，金草叉x1
["good28"] = {loot = {axe = 1, pickaxe = 1, shovel = 1, farm_hoe = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 斧头x1，镐x1，铲x1，锄头x1
["good29"] = {loot = {saddle_basic = 1, beef_bell = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 基础鞍x1，牛铃x1
["good30"] = {loot = {saddle_war = 1, saddlehorn = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 战斗鞍x1，鞍角x1
["good31"] = {loot = {saddle_race = 1, brush = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 竞速鞍x1，刷子x1
--Clothes  
["good32"] = {loot = {beefalohat = 1, trunkvest_winter = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 野牛帽x1，冬季象鼻背心x1
["good33"] = {loot = {armorslurper = 1, molehat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 啜食者盔甲x1，鼹鼠帽x1
["good34"] = {loot = {winterhat = 1, trunkvest_summer = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 冬帽x1，夏季象鼻背心x1
["good35"] = {loot = {bushhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 灌木帽x1
["good36"] = {loot = {catcoonhat = 1, whip = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 浣猫帽x1，鞭子x1
["good37"] = {loot = {carnival_vest_a = 1, carnival_vest_b = 1, carnival_vest_c = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 狂欢节背心A/B/C各x1
["good38"] = {loot = {sweatervest = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 毛衣背心x1
["good39"] = {loot = {goggleshat = 1, deserthat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 护目镜帽x1，沙漠帽x1
["good40"] = {loot = {eyebrellahat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 防水帽x1
["good41"] = {loot = {featherhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 羽毛帽x1
["good42"] = {loot = {watermelonhat = 1, reflectivevest = 1, grass_umbrella = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 西瓜帽x1，反光背心x1，草伞x1
["good43"] = {loot = {hawaiianshirt = 1, icehat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 夏威夷衬衫x1，冰帽x1
["good44"] = {loot = {red_mushroomhat = 1, green_mushroomhat = 1, blue_mushroomhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 红/绿/蓝蘑菇帽各x1
["good45"] = {loot = {nutrientsgoggleshat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 营养护目镜帽x1
["good46"] = {loot = {plantregistryhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 植物登记帽x1
["good47"] = {loot = {flowerhat = 1, grass_umbrella = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 花帽x1，草伞x1
["good48"] = {loot = {beargervest = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 熊背心x1
["good49"] = {loot = {minerhat = 1, molehat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 矿工帽x1，鼹鼠帽x1
["good50"] = {loot = {earmuffshat = 1, torch = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 耳罩帽x1，火把x1
["good51"] = {loot = {rainhat = 1, raincoat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 雨帽x1，雨衣x1
["good52"] = {loot = {strawhat = 1, minifan = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 草帽x1，迷你风扇x1
["good53"] = {loot = {featherfan = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 羽毛扇x1
["good54"] = {loot = {walrushat = 1, cane = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 海象帽x1，手杖x1
--Boats
["good55"] = {loot = {boat_grass_item = 1, oar = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 草船x1，木桨x1
["good56"] = {loot = {boat_item = 1, oar_driftwood = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 木船x1，漂流木桨x1
["good57"] = {loot = {boat_item = 1, boatpatch = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 木船x1，船只补丁x2
["good58"] = {loot = {mast_item = 1, anchor_item = 1, steeringwheel_item = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 桅杆x1，锚x1，船舵x1
["good59"] = {loot = {boat_rotator_kit = 1, boat_bumper_kelp_kit = 1, boat_bumper_shell_kit = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 船舵套件x1，海草防撞套件x1，贝壳防撞套件x1
["good60"] = {loot = {boat_cannon_kit = 1, cannonball_rock_item = 4,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 船炮套件x1，岩石炮弹x4
["good61"] = {loot = {ocean_trawler_kit = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 海洋拖网套件x2
["good62"] = {loot = {boat_magnet_kit = 1, boat_magnet_beacon = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 船只磁铁套件x1，磁铁信标x1
["good63"] = {loot = {mast_malbatross_item = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 信天翁桅杆x1
["good64"] = {loot = {mast_item = 1, mastupgrade_lightningrod_item = 1, mastupgrade_lamp_item = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 桅杆x1，避雷针升级x1，船灯升级x1
--Light  
["good65"] = {loot = {lantern = 1, minerhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 提灯x1，矿工帽x1
--Survival  
["good66"] = {loot = {trap = 1, birdtrap = 1, beemine = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 陷阱x1，捕鸟器x1，蜜蜂地雷x1
["good67"] = {loot = {umbrella = 1, raincoat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 雨伞x1，雨衣x1
["good68"] = {loot = {umbrella = 1, rainhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 雨伞x1，雨帽x1
["good69"] = {loot = {healingsalve = 1, bandage = 1, tillweedsalve = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 治疗药膏x1，绷带x1，杂草药膏x1
["good70"] = {loot = {bandage = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 绷带x3
["good71"] = {loot = {healingsalve = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 治疗药膏x3
["good72"] = {loot = {compass = 1, backpack = 1, cane = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 指南针x1，背包x1，手杖x1
["good73"] = {loot = {heatrock = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 热能石x2
["good74"] = {loot = {piggyback = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 猪鞍x1
["good75"] = {loot = {bedroll_straw = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 草席卷x2
["good76"] = {loot = {bedroll_furry = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 毛毯卷x1
["good77"] = {loot = {icepack = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 冰袋x1
["good78"] = {loot = {tillweedsalve = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 杂草药膏x3
["good79"] = {loot = {reviver = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 强心针x3
["good80"] = {loot = {lifeinjector = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 生命注射器x3
["good81"] = {loot = {miniflare = 5,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 迷你照明弹x5
["good82"] = {loot = {waterballoon = 5,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 水气球x5
--Farming  
["good83"] = {loot = {farm_hoe = 1, fertilizer = 1, seeds = 5,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 锄头x1，肥料x1，种子x5
["good84"] = {loot = {seedpouch = 1, cookbook = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 种子袋x1，食谱x1
["good85"] = {loot = {farm_plow_item = 1, farm_hoe = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 犁x1，锄头x1
["good86"] = {loot = {soil_amender = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 土壤改良剂x2
["good87"] = {loot = {treegrowthsolution = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 树木生长溶液x2
--Magic
["good88"] = {loot = {panflute = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 排箫x1
["good89"] = {loot = {onemanband = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 一人乐队乐器x2
["good90"] = {loot = {purpleamulet = 1, telestaff = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 紫色护符x1，传送法杖x1
["good91"] = {loot = {reskin_tool = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 皮肤工具x2
--Fishing (no more, now removed since prototypeable!)   
--Ocean  
["good92"] = {loot = {rock_avocado_fruit_sprout = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 岩石鳄梨果苗x3
["good93"] = {loot = {dug_trap_starfish = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 挖出的海星陷阱x3
["good94"] = {loot = {waterplant_planter = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 水生植物花盆x3
["good95"] = {loot = {tacklecontainer = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 钓鱼容器x2
["good96"] = {loot = {supertacklecontainer = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 高级钓鱼容器x1
["good97"] = {loot = {hermit_bundle_shells = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 海难隐士贝壳包x1
["good98"] = {loot = {kelphat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 海带帽x1
["good99"] = {loot = {messagebottleempty = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 空信息瓶x3
["good100"] = {loot = {oceantreenut = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 海洋坚果x1
["good101"] = {loot = {oceanfish_small_8_inv = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小型海洋鱼x1（背包内）
["good102"] = {loot = {oceanfish_medium_8_inv = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 中型海洋鱼x1（背包内）
["good103"] = {loot = {turf_road = 10,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 道路地皮x10
["good104"] = {loot = {turf_dragonfly = 10,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 龙蝇地皮x10
["good105"] = {loot = {smallbird = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小鸟x2
["good106"] = {loot = {antlionhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 蚁狮帽x1		--New Turf Raising Hat
["good107"] = {loot = {pig_coin = 4,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 猪币x4
["good108"] = {loot = {pig_token = 4,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 猪代币x4
["good109"] = {loot = {grassgekko = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 草壁虎x3
["good110"] = {loot = {trinket_8 = 1, trinket_17 = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小饰品8x1，小饰品17x1（硬化橡胶塞 + 弯曲叉勺）
["good111"] = {loot = {trinket_15 = 1, trinket_28 = 1, trinket_30 = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小饰品15x1，小饰品28x1，小饰品30x1（白色棋子小饰品）
["good112"] = {loot = {trinket_16 = 1, trinket_29 = 1, trinket_31 = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小饰品16x1，小饰品29x1，小饰品31x1（黑色棋子小饰品）
["good113"] = {loot = {multiplayer_portal_moonrock_constr_plans = 1, moonrockidol = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 多人传送门月亮石建造计划x1，月亮石偶像x2（棋子小饰品）
["good114"] = {loot = {dock_kit = 4, dock_woodposts_item = 4,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 月亮码头套件x4，木桩x4（新月亮码头掉落物）
["good115"] = {loot = {dug_bananabush = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 挖出的香蕉树x3（新月亮码头掉落物）
["good116"] = {loot = {dug_monkeytail = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 挖出的猴尾树x3（新月亮码头掉落物）
["good117"] = {loot = {palmcone_seed = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 棕榈果种子x3（新月亮码头掉落物）
["good118"] = {loot = {monkey_smallhat = 1, cutless = 1, oar_monkey = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小猴帽x1，短剑x1，猴桨x1（新月亮码头掉落物，火药猴）
["good119"] = {loot = {monkey_mediumhat = 1, stash_map = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 中猴帽x1，藏宝图x1（新月亮码头掉落物，大副）
["good120"] = {loot = {stash_map = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 藏宝图x3
["good121"] = {loot = {polly_rogershat = 1, blackflag = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 波利·罗杰帽x1，黑旗x3
["good122"] = {loot = {opalpreciousgem = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 珍贵欧泊宝石x1
["good123"] = {loot = {fence_rotator = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 栅栏旋转器x2
["good124"] = {loot = {megaflare = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 大型闪光弹x3
["good125"] = {loot = {trinket_26 = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小玩意26x3
["good126"] = {loot = {trinket_25 = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小玩意25x3
["good127"] = {loot = {costume_doll_body = 1, mask_dollhat = 1, mask_dollbrokenhat = 1, mask_dollrepairedhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 玩偶身体x1，玩偶帽子x1，破碎玩偶帽x1，修复玩偶帽x1 -- 新戏剧更新服装
["good128"] = {loot = {costume_queen_body = 1, mask_queenhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 女王身体x1，女王面具x1
["good129"] = {loot = {costume_king_body = 1, mask_kinghat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 国王身体x1，国王面具x1
["good130"] = {loot = {costume_blacksmith_body = 1, mask_blacksmithhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 铁匠身体x1，铁匠帽x1
["good131"] = {loot = {costume_mirror_body = 1, mask_mirrorhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 镜子身体x1，镜子面具x1
["good132"] = {loot = {costume_tree_body = 1, mask_treehat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 树精身体x1，树精帽x1
["good133"] = {loot = {costume_fool_body = 1, mask_foolhat = 1,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 小丑身体x1，小丑帽x1
["good134"] = {loot = {phonograph = 2, record = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 留声机x2，唱片x2
["good135"] = {loot = {decor_lamp = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 装饰灯x3
["good136"] = {loot = {decor_flowervase = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 装饰花瓶x3
["good137"] = {loot = {decor_centerpiece = 2, decor_portraitframe = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 装饰中心摆件x2，装饰画像框x2
["good138"] = {loot = {decor_pictureframe = 3, featherpencil = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 装饰相框x3，羽毛笔x3
["good139"] = {loot = {bootleg = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 黑胶唱片x2
["good140"] = {loot = {moon_mushroomhat = 2,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 月亮蘑菇帽x2
["good141"] = {loot = {healingsalve_acid = 3,}, group_tag = {"good"}, classify_tag = {"DropRarity"},},  -- 酸性治疗药膏x3 -- 新更新添加
--["good1##"] = {loot = { = 1,}, classify_tag = {"DropRarity"},},
--and more in the future!

---------------------------------------OK LIST 29 total 
["slot_anotherspin"] = {loot = {dubloon = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 移动到ok列表，因为这玩意儿太烂了...
["firestarter"] = {loot = {log = 2, cutgrass = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 引火物：原木x2，割下的草x3
["geologist"] = {loot = {rocks = 1, goldnugget = 1, moonrocknugget = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 地质学家套装：岩石x1，金块x1，月岩块x1 -- 移除注释中的黑曜石
["cutgrass"] = {loot = {cutgrass = 5,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 割下的草x5
["logs"] = {loot = {log = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 原木x3
["twigs"] = {loot = {twigs = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 树枝x3
["slot_torched"] = {loot = {torch = 1, charcoal = 2, ash = 2,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 火把套装：火把x1，木炭x2，灰烬x2
["slot_jelly"] = {loot = {fishmeat = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 水母套装：鱼肉x3 -- 移除注释中的水母
["slot_handyman"] = {loot = {axe = 1, hammer = 1, shovel = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 万能工匠套装：斧头x1，锤子x1，铲子x1
["slot_poop"] = {loot = {poop = 5,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 便便x5
["slot_berry"] = {loot = {berries = 5,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 浆果x5
["slot_limpets"] = {loot = {smallmeat = 5,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 小肉x5 -- 移除注释中的limpets
["slot_seafoodsurprise"] = {loot = {fish = 2, eel = 2, fishmeat = 2,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 海鲜惊喜套装：鱼x2，鳗鱼x2，鱼肉x2 -- 移除注释中的其他项
["slot_bushy"] = {loot = {berries = 3, dug_berrybush2 = 1, }, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 灌木丛套装：浆果x3，挖出的多汁浆果丛x1
["slot_bamboozled"] = {loot = {twigs = 3, dug_sapling = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 竹子陷阱套装：树枝x3，挖出的小树苗x1 -- 移除注释中的其他项
["slot_grassy"] = {loot = {trap = 1, cutgrass = 3, strawhat = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 草丛套装：陷阱x1，割下的草x3，草帽x1
["slot_prettyflowers"] = {loot = {petals = 5, flowerhat = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 漂亮花朵套装：花瓣x5，花环帽x1
["slot_witchcraft"] = {loot = {flower_evil = 5, red_cap = 1, green_cap = 1, blue_cap = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 巫术套装：邪恶花瓣x5，红色高顶帽x1，绿色高顶帽x1，蓝色高顶帽x1
["slot_bugexpert"] = {loot = {bugnet = 1, fireflies = 3, butterfly = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 昆虫专家套装：捕虫网x1，萤火虫x3，蝴蝶x3
["slot_flinty"] = {loot = {flint = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 燧石x3
["slot_fibre"] = {loot = {cave_banana = 1, dragonfruit = 1, watermelon = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 纤维套装：洞穴香蕉x1，火龙果x1，西瓜x1
["slot_drumstick"] = {loot = {drumstick = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 鸡腿x3
["slot_fisherman"] = {loot = {oceanfishingrod = 1, oceanfishingbobber_ball = 1, pocket_scale = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 渔夫套装：海洋钓鱼竿x1，海洋钓鱼浮标球x1，便携秤x1
["slot_bonesharded"] = {loot = {hammer = 1, skeleton = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 碎骨套装：锤子x1，骨架x3
["slot_jerky"] = {loot = {meat_dried = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 肉干x3
["slot_coconutty"] = {loot = {butter = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 黄油x1 -- 移除注释中的椰子
["slot_camper"] = {loot = {heatrock = 1, bedroll_straw = 1, meat_dried = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 露营者套装：暖石x1，草席卷x1，肉干x1
["slot_ropey"] = {loot = {rope = 5,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 绳子x5
["slot_tailor"] = {loot = {sewing_kit = 1, silk = 6, tophat = 1,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 裁缝套装：缝纫工具包x1，丝线x6，高顶帽x1
["slot_spiderboon"] = {loot = {spidergland = 2, silk = 5, monstermeat = 3,}, group_tag = {"ok"}, classify_tag = {"DropDefault"},},  -- 蜘蛛恩赐套装：蜘蛛腺体x2，丝线x5，怪物肉x3
--Food ingredients (54 total + weighted)
["food1"] = {loot = {asparagus = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 芦笋x3
["food2"] = {loot = {barnacle = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 藤壶x3
["food3"] = {loot = {batwing = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 蝙蝠翅膀x3
["food4"] = {loot = {berries = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 浆果x3
["food5"] = {loot = {acorn = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 橡果x3
["food6"] = {loot = {butterflywings = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 蝴蝶翅膀x3
["food7"] = {loot = {cactus_meat = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 仙人掌肉x3
["food8"] = {loot = {cactus_flower = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 仙人掌花x3
["food9"] = {loot = {carrot = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 胡萝卜x3
["food10"] = {loot = {cave_banana = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 洞穴香蕉x3
["food11"] = {loot = {corn = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 玉米x3
["food12"] = {loot = {dragonfruit = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 火龙果x3
["food13"] = {loot = {durian = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 榴莲x3
["food14"] = {loot = {eel = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 鳗鱼x3
["food15"] = {loot = {goatmilk = 1,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 山羊奶x1
["food16"] = {loot = {bird_egg = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 鸟蛋x3
["food17"] = {loot = {eggplant = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 茄子x3
["food18"] = {loot = {pondfish = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 池塘鱼x3
["food19"] = {loot = {froglegs = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 蛙腿x3
["food20"] = {loot = {garlic = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 大蒜x3
["food21"] = {loot = {wormlight = 1,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 虫光x1
["food22"] = {loot = {wormlight_lesser = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 小虫光x3
["food23"] = {loot = {honey = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 蜂蜜x3
["food24"] = {loot = {ice = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 冰x3
["food25"] = {loot = {berries_juicy = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 多汁浆果x3
["food26"] = {loot = {kelp = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 海藻x3
["food27"] = {loot = {trunk_summer = 1,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 夏日树干x1
["food28"] = {loot = {trunk_winter = 1,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 冬日树干x1
["food29"] = {loot = {plantmeat = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 植物肉x3
["food30"] = {loot = {cutlichen = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 苔藓x3
["food31"] = {loot = {lightbulb = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 电灯泡x3
["food32"] = {loot = {bird_egg = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 鸟蛋x3（重复项，但保持原样）
["food33"] = {loot = {moon_tree_blossom = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 月树花x3
["food34"] = {loot = {mandrake = 1,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 曼德拉草x1
["food35"] = {loot = {meat = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 肉x3
["food36"] = {loot = {monstermeat = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 怪物肉x3
["food37"] = {loot = {moon_cap = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 月帽x3
["food38"] = {loot = {moonbutterflywings = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 月光蝴蝶翅膀x3
["food39"] = {loot = {smallmeat = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 小肉x3
["food40"] = {loot = {blue_cap = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 蓝帽x3
["food41"] = {loot = {green_cap = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 绿帽x3
["food42"] = {loot = {red_cap = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 红帽x3
["food43"] = {loot = {red_cap = 1, green_cap = 1, blue_cap = 1,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 红帽x1, 绿帽x1, 蓝帽x1
["food44"] = {loot = {onion = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 洋葱x3
["food45"] = {loot = {pepper = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 辣椒x3
["food46"] = {loot = {pomegranate = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 石榴x3
["food47"] = {loot = {potato = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 土豆x3
["food48"] = {loot = {pumpkin = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 南瓜x3
["food49"] = {loot = {rock_avocado_fruit_ripe = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 成熟石榴果x3
["food50"] = {loot = {tallbirdegg = 1,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 高鸟蛋x1
["food51"] = {loot = {tomato = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 番茄x3
["food52"] = {loot = {watermelon= 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 西瓜x3
["food53"] = {loot = {batnose = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 蝙蝠鼻x3
["food54"] = {loot = {seeds = 5,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 种子x5
["food55"] = {loot = {fig = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 无花果x3
["food56"] = {loot = {firenettles = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 火荨麻x3
["food57"] = {loot = {forgetmelots = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 忘忧草x3
["food58"] = {loot = {tillweed = 3,}, group_tag = {"ok"}, classify_tag = {"DropFood"},},  -- 解毒草x3
--Crockpot Foods (Some only) (7 total + weighted)
["dish31"] = {loot = {meatballs = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 肉丸x1
["dish32"] = {loot = {butterflymuffin = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 蝴蝶松饼x1
["dish33"] = {loot = {turkeydinner = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 火鸡正餐x1
["dish34"] = {loot = {taffy = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 太妃糖x1
["dish35"] = {loot = {frogglebunwich = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 蛙腿三明治x1
["dish36"] = {loot = {kabobs = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 烤肉串x1
["dish37"] = {loot = {powcake = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 力量蛋糕x1
["dish1"] = {loot = {seafoodgumbo = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 海鲜浓汤x1
["dish2"] = {loot = {fishsticks = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 炸鱼排x1
["dish3"] = {loot = {californiaroll = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 加州寿司卷x1
["dish4"] = {loot = {fishtacos = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 鱼肉玉米卷x1
["dish5"] = {loot = {unagi = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 鳗鱼料理x1
["dish6"] = {loot = {honeyham = 3,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 蜜汁火腿x3
["dish7"] = {loot = {meatballs = 4,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 肉丸x4
["dish8"] = {loot = {bonestew = 3,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 骨头汤x3
["dish9"] = {loot = {surfnturf = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 海鲜牛排x1
["dish10"] = {loot = {perogies = 4,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 波兰水饺x4
["dish11"] = {loot = {lobsterdinner = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 龙虾正餐x1
["dish12"] = {loot = {lobsterbisque = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 龙虾浓汤x1
["dish13"] = {loot = {barnaclestuffedfishhead = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 酿鱼头x1
["dish14"] = {loot = {barnaclinguine = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 藤壶意大利面x1
["dish15"] = {loot = {barnaclepita = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 藤壶皮塔饼x1
["dish16"] = {loot = {barnaclesushi = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 藤壶寿司x1
["dish17"] = {loot = {turkeydinner = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 火鸡正餐x1
["dish18"] = {loot = {baconeggs = 3,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 培根煎蛋x3
["dish19"] = {loot = {frogglebunwich = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 蛙腿三明治x1
["dish20"] = {loot = {leafymeatsouffle = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 果冻沙拉x1
["dish21"] = {loot = {leafymeatburger = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 素食汉堡x1
["dish22"] = {loot = {dragonpie = 4,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 火龙果派x4
["dish23"] = {loot = {taffy = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 太妃糖x1
["dish24"] = {loot = {frognewton = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 无花果蛙腿三明治x1
["dish25"] = {loot = {figkabab = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 无花果烤串x1
["dish26"] = {loot = {koalefig_trunk = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 无花果酿象鼻x1
["dish27"] = {loot = {flowersalad = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 花沙拉x1
["dish28"] = {loot = {jellybean = 1,}, group_tag = {"ok"}, classify_tag = {"DropDish"},},  -- 彩虹糖豆x1
--Crop seeds (14 total + weighted)
["seed1"] = {loot = {asparagus_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 芦笋种子x4
["seed2"] = {loot = {carrot_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 胡萝卜种子x4
["seed3"] = {loot = {dragonfruit_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 火龙果种子x4
["seed4"] = {loot = {durian_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 榴莲种子x4
["seed5"] = {loot = {eggplant_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 茄子种子x4
["seed6"] = {loot = {garlic_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 大蒜种子x4
["seed7"] = {loot = {onion_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 洋葱种子x4
["seed8"] = {loot = {pepper_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 辣椒种子x4
["seed9"] = {loot = {pomegranate_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 石榴种子x4
["seed10"] = {loot = {potato_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 马铃薯种子x4
["seed11"] = {loot = {pumpkin_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 南瓜种子x4
["seed12"] = {loot = {tomato_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 番茄种子x4
["seed13"] = {loot = {watermelon_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 西瓜种子x4
["seed14"] = {loot = {corn_seeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropSeed"},},  -- 玉米种子x4
  
-- 可携带的生物！（共9种+权重）  
["mob1"] = {loot = {mole = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 鼹鼠x2
["mob2"] = {loot = {rabbit = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 兔子x2
["mob3"] = {loot = {carrat = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 胡萝卜鼠x2
["mob4"] = {loot = {butterfly = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 蝴蝶x2
["mob5"] = {loot = {bee = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 蜜蜂x2
["mob6"] = {loot = {moonbutterfly = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 月蛾x2
["mob7"] = {loot = {wobster_sheller_land = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 龙虾陆行种x2
["mob8"] = {loot = {lightflier = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 发光飞虫x2
["mob9"] = {loot = {lightcrab = 2,}, group_tag = {"ok"}, classify_tag = {"DropMob"},},  -- 发光螃蟹x2
  
-- 地皮（共12种+权重）  
["turf1"] = {loot = {turf_woodfloor = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 木质地皮x3
["turf2"] = {loot = {turf_road = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 道路地皮x3
["turf3"] = {loot = {turf_carpetfloor = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 地毯地皮x3
["turf4"] = {loot = {turf_checkerfloor = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 棋盘格地皮x3
["turf5"] = {loot = {turf_dragonfly = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 龙蝇沙漠地皮x3
["turf6"] = {loot = {turf_carpetfloor2 = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 高级地毯地皮x3
["turf7"] = {loot = {turf_mosaic_grey = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 灰色马赛克地皮x3
["turf8"] = {loot = {turf_mosaic_red = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 红色马赛克地皮x3
["turf9"] = {loot = {turf_mosaic_blue = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 蓝色马赛克地皮x3
["turf10"] = {loot = {turf_ruinstrim_glow = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 发光废墟边缘地皮x3
["turf11"] = {loot = {turf_ruinsbrick_glow = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 发光废墟砖块地皮x3
["turf12"] = {loot = {turf_ruinstiles_glow = 3,}, group_tag = {"ok"}, classify_tag = {"DropTurf"},},  -- 发光废墟瓦片地皮x3
--Plants (16 total + weighted)
["plant1"] = {loot = {pinecone = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 松果x3
["plant2"] = {loot = {dug_sapling = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 树苗x3
["plant3"] = {loot = {dug_grass = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 割下的草x3
["plant4"] = {loot = {dug_berrybush = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 挖起的浆果丛x3
["plant5"] = {loot = {dug_berrybush2 = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 挖起的多汁浆果丛x3
["plant6"] = {loot = {dug_berrybush_juicy = 2,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 挖起的多汁浆果丛x2
["plant7"] = {loot = {dug_marsh_bush = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 挖起的芦苇丛x3
["plant8"] = {loot = {lureplantbulb = 1,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 食人花种子x1
["plant9"] = {loot = {twiggy_nut = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 多枝坚果x3
["plant10"] = {loot = {bullkelp_root = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 巨型海带根x3
["plant11"] = {loot = {dug_rock_avocado_bush = 1,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 挖起的岩石鳄梨丛x1
["plant12"] = {loot = {spore_tall = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 高孢子x3
["plant13"] = {loot = {spore_medium = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 中孢子x3
["plant14"] = {loot = {spore_small = 3,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 小孢子x3
["plant15"] = {loot = {dug_bananabush = 1,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 挖起的香蕉树丛x1
["plant16"] = {loot = {dug_monkeytail = 1,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 挖起的猴尾草丛x1
["plant17"] = {loot = {palmcone_seed = 1,}, group_tag = {"ok"}, classify_tag = {"DropPlant"},},  -- 棕榈果种子x1
-- My Additions 56 total + weighted  
-- Semi valuable materials dropped from environment (no mob items)  
["okay1"] = {loot = {rocks = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 岩石x3
["okay2"] = {loot = {papyrus = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 纸莎草x3
["okay3"] = {loot = {thulecite_pieces = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 铥矿碎片x3
["okay4"] = {loot = {moonglass = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 月岩玻璃x3
["okay5"] = {loot = {fossil_piece = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 化石碎片x2
["okay6"] = {loot = {charcoal = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 木炭x3
["okay7"] = {loot = {cutreeds = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 割下的芦苇x4
["okay8"] = {loot = {petals = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 花瓣x4
["okay9"] = {loot = {goldnugget = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 金块x2
["okay10"] = {loot = {moonrocknugget = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 月岩块x2
["okay11"] = {loot = {nitre = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 硝石x2
-- Common materials/dropped from environment  
["okay12"] = {loot = {petals_evil = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 邪恶花瓣x4
["okay13"] = {loot = {foliage = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 树叶x4
["okay14"] = {loot = {poop = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 粪便x3
["okay15"] = {loot = {guano = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 鸟粪x3
["okay16"] = {loot = {spoiled_food = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 变质食物x4
["okay17"] = {loot = {succulent_picked = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 摘下的多肉植物x4
["okay18"] = {loot = {ice = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 冰x3
["okay19"] = {loot = {boards = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 木板x2
["okay20"] = {loot = {cutstone = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 切割石块x2
["okay21"] = {loot = {rope = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 绳子x2
["okay22"] = {loot = {transistor = 1,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 晶体管x1
-- Materials dropped from mobs, etc 
["okay23"] = {loot = {feather_crow = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 乌鸦羽毛x3
["okay24"] = {loot = {feather_robin = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 知更鸟羽毛x3
["okay25"] = {loot = {feather_robin_winter = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 冬知更鸟羽毛x3
["okay26"] = {loot = {feather_canary = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 金丝雀羽毛x3
["okay27"] = {loot = {beardhair = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 胡须x2
["okay28"] = {loot = {beefalowool = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 牛毛x3
["okay29"] = {loot = {bluegem = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 蓝宝石x2
["okay30"] = {loot = {redgem = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 红宝石x2
["okay31"] = {loot = {manrabbit_tail = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 兔人尾巴x2
["okay32"] = {loot = {gears = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 齿轮x2
["okay33"] = {loot = {houndstooth = 5,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 猎犬牙齿x5
["okay34"] = {loot = {livinglog = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 活木头x3
["okay35"] = {loot = {mosquitosack = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 蚊子囊袋x3
["okay36"] = {loot = {nightmarefuel = 5,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 噩梦燃料x5
["okay37"] = {loot = {pigskin = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 猪皮x2
["okay38"] = {loot = {purplegem = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 紫宝石x2
["okay39"] = {loot = {silk = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 丝绸x4
["okay40"] = {loot = {slurtleslime = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 蜗牛粘液x3
["okay41"] = {loot = {slurper_pelt = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 啜食者皮x2
["okay42"] = {loot = {spidergland = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 蜘蛛腺体x4
["okay43"] = {loot = {steelwool = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 钢羊毛x2
["okay44"] = {loot = {stinger = 5,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 蜂刺x5
["okay45"] = {loot = {tentaclespots = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 触手斑x2
["okay46"] = {loot = {walrus_tusk = 1,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 海象牙x1
["okay47"] = {loot = {coontail = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 浣熊尾巴x2
["okay48"] = {loot = {glommerwings = 1,glommerfuel = 1,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 格罗姆翅膀x1, 格罗姆燃料x1
["okay49"] = {loot = {lightninggoathorn = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 闪电羊角x2
["okay50"] = {loot = {cookiecuttershell = 4,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 饼干切割器壳x4
["okay51"] = {loot = {honeycomb = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 蜂巢x2
["okay52"] = {loot = {spidereggsack = 1,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 蜘蛛卵囊x1
["okay53"] = {loot = {gnarwail_horn = 1,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 格纳瓦伊之角x1
["okay54"] = {loot = {blueprint = 1,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 蓝图x1
["okay55"] = {loot = {palmcone_scale = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 棕榈果鳞片x2
["okay56"] = {loot = {blackflag = 2,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 黑旗x2
["okay57"] = {loot = {glommerfuel = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 格罗姆燃料x3
["okay58"] = {loot = {phlegm = 3,}, group_tag = {"ok"}, classify_tag = {"DropRarity"},},  -- 痰x3
--------------------------------------BAD LIST
["slot_spiderattack"] ={loot ={spider = 5,},  group_tag = {"bad"}, classify_tag = {"DropDefault"},},   --increased to 5-- 蜘蛛
["slot_mosquitoattack"] ={loot ={mosquito= 5,},  group_tag = {"bad"}, classify_tag = {"DropDefault"},},   --mosquito_poison= 5,-- 蚊子
--["slot_snakeattack"] ={loot ={snake = 3,},  group_tag = {"bad"}, classify_tag = {"DropDefault"},},
["slot_monkeysurprise"] ={loot ={monkey = 3,},  group_tag = {"bad"}, classify_tag = {"DropDefault"},},  --primeape = 2, increased to 3-- 猴子
--["slot_poisonsnakes"] ={loot ={snake_poison = 2,},  group_tag = {"bad"}, classify_tag = {"DropDefault"},},
["slot_hounds"] ={loot = {hound = 4,},  group_tag = {"bad"}, classify_tag = {"DropDefault"},},   -- increased to 4猎犬
--Enemies 34 total, 34 weighted
["enemy1"] ={loot ={killerbee = 5,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   												--杀人蜂
["enemy2"] = {loot = {frog = 4,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  													--青蛙
["enemy3"] = {loot = {pigguard = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  												--猪守卫
["enemy4"] = {loot = {nightmarebeak = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--梦魇秃鹫
["enemy5"] = {loot = {crawlingnightmare = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  									--爬行的梦魇
["enemy6"] = {loot = {bat = 5,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  													--蝙蝠
["enemy7"] = {loot = {ghost = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  												--鬼魂
["enemy8"] = {loot = {icehound = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  												--蓝猎犬
["enemy9"] = {loot = {firehound = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--红猎犬
["enemy10"] = {loot = {krampus = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  												--坎普斯
["enemy11"] = {loot = {merm = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  												--鱼人
["enemy12"] = {loot = {spider_warrior = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--蜘蛛战士
["enemy13"] = {loot = {spider_hider = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--洞穴蜘蛛
["enemy14"] = {loot = {spider_spitter = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--喷射蜘蛛
["enemy15"] = {loot = {tallbird = 5,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--高鸟
["enemy16"] = {loot = {tentacle = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--触手
["enemy17"] = {loot = {beeguard = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--嗡嗡蜜蜂
["enemy18"] = {loot = {mutatedhound = 4,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--变异猎犬
["enemy19"] = {loot = {mutated_penguin = 5,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--月岩企鹅
["enemy20"] = {loot = {spider_moon = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--月面蜘蛛
["enemy21"] = {loot = {bird_mutant = 5,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--月盲乌鸦
["enemy22"] = {loot = {bird_mutant_spitter = 5,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  									--畸形鸟
["enemy23"] = {loot = {spider_water = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--海行者
["enemy24"] = {loot = {spider_warrior = 1, spider_moon = 1, spider_healer = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  	--地表特殊蜘蛛
["enemy25"] = {loot = {spider_dropper = 1, spider_hider = 1, spider_spitter = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  --洞穴特殊蜘蛛
["enemy26"] = {loot = {eyeofterror_mini = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  									--可疑小眼怪
["enemy27"] = {loot = {fruitfly = 4,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--果蝇
["enemy28"] = {loot = {shadow_knight = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--暗影骑士
["enemy29"] = {loot = {shadow_rook = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--暗影车
["enemy30"] = {loot = {shadow_bishop = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  										--暗影主教
["enemy31"] = {loot = {tentacle_pillar_arm = 8,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  									--小触手
["enemy32"] = {loot = {eyeplant = 10,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--眼植物
["enemy33"] = {loot = {slurtle = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  												--蛞蝓龟
["enemy34"] = {loot = {slurper = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  												--啜食者
["enemy35"] = {loot = {hedgehound = 6,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},  											--蔷薇狼
["bad_beefalo"] = {loot = {beefalo = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 牛
["bad_fruitdragon"] = {loot = {fruitdragon = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 沙拉蝾螈
["bad_molebat"] = {loot = {molebat = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 裸鼹蝠
["bad_lunarfrog"] = {loot = {lunarfrog = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 明眼青蛙
["bad_leif_sparse"] = {loot = {leif_sparse = 2,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 树精守卫
["bad_rook_nightmare"] = {loot = {rook_nightmare = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 损坏的发条战车
["bad_rook"] = {loot = {rook = 1,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 发条战车
["bad_tentacle"] = {loot = {tentacle = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 触手
["bad_bishop"] = {loot = {bishop = 3,},  group_tag = {"bad"}, classify_tag = {"DropEnemy"},},   -- 主教
--BOSS类
["bad_minotaur"] = {loot = {minotaur = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 远古犀牛
["bad_moose"] = {loot = {moose = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MOOSE_GOOSE,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 麋鹿鹅
["bad_antlion"] = {loot = {antlion = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 蚁狮
["bad_bearger"] = {loot = {bearger = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 熊
["bad_deerclops"] = {loot = {deerclops = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 独眼巨鹿
["bad_lordfruitfly_fruitfly"] = {loot = {lordfruitfly = 1, fruitfly = 10,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 果蝇王
["bad_warglet"] = {loot = {warglet = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 青年座狼
["bad_warg"] = {loot = {warg = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 座狼
["bad_dragonfly"] = {loot = {dragonfly = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 龙蝇
["bad_toadstool"] = {loot = {toadstool = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 毒菌蟾蜍
["bad_toadstool_dark"] = {loot = {toadstool_dark = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 悲惨毒菌蟾蜍
["bad_spiderqueen"] = {loot = {spiderqueen = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 蜘蛛女王
["bad_mutateddeerclops"] = {loot = {mutateddeerclops = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 晶体独眼巨鹿
["bad_mutatedbearger"] = {loot = {mutatedbearger = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 装甲熊
["bad_mutatedwarg"] = {loot = {mutatedwarg = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 月狼
["bad_beequeen"] = {loot = {beequeen = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 蜂王
["bad_sharkboi"] = {loot = {sharkboi = 1,},disabled = true, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 大霜鲨
["bad_daywalker"] = {loot = {daywalker = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 噩梦猪人
["bad_twinofterror"] = {loot = {twinofterror1 = 1, twinofterror2 = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.TWIN_OF_TERROR,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 恐怖双子
["bad_inkblight"] = {loot = {shadowthrall_horns = 1, shadowthrall_hands = 1, shadowthrall_wings = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.INK_BLIGHT,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 莫荒三基
["bad_stalker_atrium"] = {loot = {stalker_atrium = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --织影者
["bad_stalker"] = {loot = {stalker = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --复活的骨架
["bad_stalker_forest"] = {loot = {stalker_forest = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.STALKER_FOREST,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --复活的骨架（森林守护者）
["bad_malbatross"] = {loot = {malbatross = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --邪天翁
["bad_crabking"] = {loot = {crabking = 1,},disabled = true, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --帝王蟹
["bad_rabid_klaus"] = {loot = {klaus = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.RABID_KLAUS,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --狂暴克劳斯
["bad_klaus"] = {loot = {klaus = 1,},disabled = false, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --克劳斯
["bad_shadow_triwizard"] = {loot = {shadow_knight = 1, shadow_rook = 1, shadow_bishop = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.SHADOW_TRIWIZARD,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --暗影三基佬
["bad_daywalker2"] = {loot = {daywalker2 = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 拾荒猪人
["bad_claywarg"] = {loot = {claywarg = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 黏土座狼
["bad_gingerbreadwarg"] = {loot = {gingerbreadwarg = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 姜饼座狼
["bad_spat"] = {loot = {spat = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 钢羊
["bad_eyeofterror"] = {loot = {eyeofterror = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   -- 恐怖之眼
["bad_alterguardian_phase1"] = {loot = {alterguardian_phase1 = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.ALTERGUARDIAN_PHASE1,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --天体一阶段
["bad_alterguardian_phase2"] = {loot = {alterguardian_phase2 = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.ALTERGUARDIAN_PHASE2,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --天体二阶段
["bad_alterguardian_phase3"] = {loot = {alterguardian_phase3 = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.ALTERGUARDIAN_PHASE3,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},   --天体三阶段
--["slot_meteor"] = {loot = { shadowmeteor = 1,},  group_tag = {"bad"}, classify_tag = {"DropBadBoss"},},
--Effects (13 total, 13 weighted)（攻击效果）
["effect1"] = {loot = {trap_teeth_maxwell = 2,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  									-- 麦克斯韦陷阱x2
["effect2"] = {loot = {sandspike = 2,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  											-- 沙锥x2
["effect3"] = {loot = {sandspike_short = 3,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  										-- 短沙锥x3
["effect4"] = {loot = {mushroombomb = 2,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  										-- 蘑菇炸弹x2
["effect5"] = {loot = {mushroombomb_dark = 1,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  									-- 毒蘑菇炸弹x1
["effect6"] = {loot = {sporecloud = 1,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  											-- 毒菌孢子云x1
["effect7"] = {loot = {spore_moon = 8,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  											-- 月亮孢子x8
["effect8"] = {loot = {deciduous_root = 3,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  										-- 落叶毒根x3
["effect9"] = {loot = {gestalt_alterguardian_projectile = 3,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  					-- 守卫者姿态投射物x3
["effect10"] = {loot = {warg_gooicing = 1,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  										-- 座狼冰霜x1
["effect11"] = {disabled = true, loot = {crabking_feeze = 1,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  						-- 帝王蟹冰冻x1 已经删除
["effect12"] = {loot = {fossilspike2 = 5,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},  										-- 远古化石尖刺x5
["effect13"] = {loot = {sandblock = 1,},  group_tag = {"bad"}, classify_tag = {"DropEffect"},},

["debuff1"] = {rollFuc = {function(inst,player) local h = player.components.sanity if player and not player:HasTag("playerghost") and h then h:SetPercent(0) end end,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MENTAL_STORM,},  group_tag = {"bad"}, classify_tag = {"DropDebuff"},},
["debuff2"] = {rollFuc = {function(inst,player) local h = player.components.hunger if player and not player:HasTag("playerghost") and h then h:SetPercent(0) end end,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.HUNGER_PANGS,},  group_tag = {"bad"}, classify_tag = {"DropDebuff"},},
["debuff3"] = {disabled = true, rollFuc = {function(inst,player) local h = player.components.health if player and not player:HasTag("playerghost") and h then h:SetPercent(0.001) end end,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.ONE_BLOOD_WARRIOR,},  group_tag = {"bad"}, classify_tag = {"DropDebuff"},},

["buff1"] = {rollFuc = {function(inst,player) local h = player.components.sanity if player and not player:HasTag("playerghost") and h then h:SetPercent(1) end end,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MENTAL_BOOST,},  group_tag = {"good"}, classify_tag = {"DropBuff"},},
["buff2"] = {rollFuc = {function(inst,player) local h = player.components.hunger if player and not player:HasTag("playerghost") and h then h:SetPercent(1) end end,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.FULL_STOMACH,},  group_tag = {"good"}, classify_tag = {"DropBuff"},},
["buff3"] = {disabled = true, rollFuc = {function(inst,player) local h = player.components.health if player and not player:HasTag("playerghost") and h then h:SetPercent(1) end end,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.HEALTH_BOOST,},  group_tag = {"good"}, classify_tag = {"DropBuff"},},
--------------------------------富贵险中求------------------------------------------------------
["FGblueprint1"] = {loot = {tallbirdnest_blueprint = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.TALLBIRD_NEST_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},   --高脚鸟
["FGblueprint2"] = {loot = {houndmound_blueprint = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.HOUND_MOUND_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},   --猎犬丘
["FGblueprint3"] = {loot = {catcoonden_blueprint = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.CAT_COONDEN_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},   --猫窝
["FGblueprint4"] = {loot = {slurtlehole_blueprint = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.SLURTLE_HOLE_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},   --蛞蝓龟
["FGblueprint5"] = {loot = {wobster_den_blueprint = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.WOBSTER_DEN_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},   --龙虾窝
["FGblueprint6"] = {loot = {moonglass_wobster_den_blueprint = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MOONGLASS_WOBSTER_DEN_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},   --月光龙虾窝
["FGblueprint7"] = {loot = {monkeybarrel_blueprint = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MONKEY_BARREL_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},   --猴子窝
["FGblueprint8"] = {loot = {ndnr_treasurechest_root_blueprint = 1,},  disabled = true, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.ROOT_TREASURE_CHEST_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},  --根箱(不存在)
["FGblueprint9"] = {loot = {ancient_altar_blueprint = 1,}, disabled = false, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.ANCIENT_ALTAR_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},  --远古伪科学站
["FGblueprint10"] = {loot = {ndnr_opalpreciousamulet_blueprint = 1,}, disabled = true, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.OPAL_PRECIOUS_AMULET_BLUEPRINT,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropBlueprint"},},  --彩虹护符
["FGenemy1"] = {loot = {ndnr_snake = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"bad"}, classify_tag = {"DropFG", "DropEnemy"},},   --蛇
["FGdish1"] = {loot = {ndnr_snakeoil = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropDish"},},   --蛇油
["FGdish2"] = {loot = {ndnr_snakewine = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropDish"},},   --蛇酒
["FGdish3"] = {loot = {ndnr_coffee = 5,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropDish"},},   --咖啡
["FGokay1"] = {loot = {ndnr_antivenom = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropRarity"},},   --解毒剂
["FGokay2"] = {loot = {ndnr_antibiotic = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropRarity"},},   --抗生素
["FGokay3"] = {loot = {ndnr_alloyaxe = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropRarity"},},   --合金斧
["FGokay4"] = {loot = {ndnr_alloypickaxe = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropRarity"},},   --合金镐
["FGokay5"] = {loot = {ndnr_alloyshovel = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropRarity"},},   --合金铲
["FGokay6"] = {loot = {ndnr_alloyhammer = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropRarity"},},   --合金锤
["FGokay7"] = {loot = {ndnr_alloyhoe = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropRarity"},},   --合金园艺锄
["FGokay8"] = {loot = {ndnr_obsidianaxe = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropFG", "DropRarity"},},   --黑曜石斧头
["FGtop1"] = {loot = {ndnr_snakeskinhat = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropTop"},},   --蛇皮帽
["FGtop2"] = {loot = {ndnr_armor_snakeskin = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropTop"},},   --蛇皮夹克
["FGtop3"] = {loot = {ndnr_spear_obsidian = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropTop"},},   --黑曜石长矛
["FGtop4"] = {loot = {ndnr_armorobsidian = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropTop"},},   --黑曜石护甲
["FGtop5"] = {loot = {ndnr_cutlass = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropTop"},},   --剑鱼短剑
["FGtop6"] = {loot = {ndnr_alloyspear = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropTop"},},   --合金长矛
["FGtop7"] = {loot = {dug_ndnr_coffeebush = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropFG", "DropTop"},},   --咖啡树
--------------------------------武林大会------------------------------------------------------
["WLDHdish1"] = {loot = {gzresource_moontale = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropDish"},},   --满月神话
["WLDHdish2"] = {loot = {gzresource_lemonjuice = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropDish"},},   --查理之泪
["WLDHdish3"] = {loot = {gzresource_lakelady = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropDish"},},   --湖中美人
["WLDHdish4"] = {loot = {gzresource_crowncake = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropDish"},},   --霸王桂冠
["WLDHdish5"] = {loot = {gzresource_earthquakecake = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropDish"},},   --地震蛋糕
["WLDHdish6"] = {loot = {gzresource_strawberrycookie = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropDish"},},   --无双曲奇
["WLDHseed1"] = {loot = {gzresource_mango_seeds = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropSeed"},},   --芒果种子
["WLDHseed2"] = {loot = {gzresource_strawberry_seeds = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropSeed"},},   -- 草莓种子
["WLDHseed3"] = {loot = {gzresource_apple_seeds = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropSeed"},},   --苹果种子
["WLDHseed4"] = {loot = {gzresource_orange_seeds = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropSeed"},},   --香橙种子
["WLDHseed5"] = {loot = {gzresource_sugarbeet_seeds = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropSeed"},},   --甜菜种子
["WLDHseed6"] = {loot = {gzresource_whitegourd_seeds = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"ok"}, classify_tag = {"DropWLDH", "DropSeed"},},   --冬瓜种子
["WLDHseed7"] = {loot = {gzresource_lemon_seeds = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropSeed"},},   --柠檬种子
["WLDHadvanced1"] = {loot = {gzresource_apple_advanced = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropRarity"},},  --苹果干
["WLDHadvanced2"] = {loot = {gzresource_whitegourd_advanced = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropRarity"},},  --冬瓜干
["WLDHadvanced3"] = {loot = {gzresource_mango_advanced = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropRarity"},},  --芒果干
["WLDHadvanced4"] = {loot = {gzresource_orange_advanced = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropRarity"},},  --香橙干
["WLDHadvanced5"] = {loot = {gzresource_lemon_advanced = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropRarity"},},  --柠檬干
["WLDHadvanced6"] = {loot = {gzresource_strawberry_advanced = 3,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropRarity"},},  -- 草莓干
["WLDHtop1"] = {loot = {gzequ_candyfloss = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropTop"},},   --棉花糖
["WLDHFormula1"] = {loot = {gzresource_orange_advanced = 1, onion_seeds = 2, asparagus_seeds = 1,}, disabled = false, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.FULL_MOON_MYTH_FORMULA,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropTop"},},   --满月神话配方(满月)
["WLDHFormula2"] = {loot = {gzresource_lemon_advanced = 1, eggplant_seeds = 1, pumpkin_seeds = 1, seeds = 1,}, disabled = false, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.CHARLIE_TEARS_FORMULA,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropTop"},},   --查理之泪配方(黄昏)
["WLDHFormula3"] = {loot = {gzresource_mango_advanced = 1, dragonfruit_seeds = 3,}, disabled = false, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.LAKE_BEAUTY_FORMULA,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropTop"},},   --湖中美人配方(下雨天)
["WLDHFormula4"] = {loot = {gzresource_whitegourd_advanced = 1, pomegranate_seeds = 2, watermelon_seeds = 1,}, disabled = false, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.OVERLORD_CROWN_FORMULA,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropTop"},},   --霸王桂冠配方(暴动打完影怪)
["WLDHFormula5"] = {loot = {gzresource_apple_advanced = 1, potato_seeds = 1, tomato_seeds = 2,}, disabled = false, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc, announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.EARTHQUAKE_CAKE_FORMULA,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropTop"},},   --地震蛋糕配方(新月)
["WLDHFormula6"] = {loot = {gzresource_strawberry_advanced = 1, durian_seeds = 3,}, disabled = false, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,  announceTemplate = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.BUFF_TRIGGERED_TEMPLATE, itemName = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MUSOU_COOKIE_FORMULA,},  group_tag = {"good"}, classify_tag = {"DropWLDH", "DropTop"},},   --无双曲奇配方(重置远古时间段)
--------------------------------真神薇克巴顿------------------------------------------------------
["WKBDgood1"] = {loot = {mb_backpack = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --小书包
["WKBDbook2"] = {loot = {mb_book_harvest = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --丰收之时
["WKBDbook3"] = {loot = {mb_book_assistant = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --工具人召唤术
["WKBDbook4"] = {loot = {mb_book_defense = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --森林秘术
["WKBDbook5"] = {loot = {mb_book_resurrent = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --祈愿
["WKBDbook6"] = {loot = {mb_book_bcgm = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --本草纲目
["WKBDbook7"] = {loot = {mb_book_donquixote = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --唐吉坷德的骑士精神
["WKBDbook8"] = {loot = {mb_book_protector = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --守护者召唤术
["WKBDbook9"] = {loot = {mb_book_wormwood_soul = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --沃姆伍德之魂
["WKBDbook10"] = {loot = {mb_book_sunrise = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --光明重现
["WKBDbook11"] = {loot = {mb_book_terror = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --恐怖故事
["WKBDbook12"] = {loot = {mb_book_meteor_shower = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --星之守护
["WKBDbook13"] = {loot = {mb_book_ruins = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --遗迹之门
["WKBDbook14"] = {loot = {mb_book_shadowattack = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --利刃华尔兹
["WKBDbook15"] = {loot = {mb_book_new_moon = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --新月神话
["WKBDbook16"] = {loot = {mb_book_spring = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --春回大地
["WKBDbook17"] = {loot = {mb_book_sunset = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --黑暗降临
["WKBDbook18"] = {loot = {mb_book_grow_sapling = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --拔苗助长的故事
["WKBDbook19"] = {loot = {mb_book_medusa = 1,}, announce = {isAnnounced = true, announceFuc = slotmachineutils.announceFuc,},  group_tag = {"good"}, classify_tag = {"DropWKBD", "DropBook"},},   --美杜莎之眼
-------------------------------ISLAND ADVENTURES LIST-------------------------------------------
--GOOD DROPS:
--IA default: 
["IAstaydry"] = {loot = {palmleaf_umbrella = 1, armor_snakeskin = 1, snakeskinhat = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropDefault"},},  	-- 棕榈叶伞x1，蛇皮盔甲x1，蛇皮帽x1
["IAslot_warrior"] = {loot = {spear_launcher = 1, spear_poison = 1, armorseashell = 1, coconade = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropDefault"},},   -- 矛发射器x1，毒矛x1，贝壳盔甲x1，椰子炸弹x1
["IAslot_speargun"] = {loot = {spear_launcher = 1, spear = 1, goldnugget = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropDefault"},},   -- 矛发射器x1，矛x1，金块x3
["IAslot_obsidian"] = {loot = {obsidian = 5,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropDefault"},},   -- 黑曜石x5
["IAslot_monkeyball"] = {loot = {monkeyball = 1, cave_banana = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropDefault"},},   -- 猴球x1，洞穴香蕉x2
-- Obsidian loot - 7 total  
["IAtop1"] = {loot = {spear_obsidian = 1, armorobsidian = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropTop"},},   -- 黑曜石矛x1，黑曜石盔甲x1
["IAtop2"] = {loot = {obsidianaxe = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropTop"},},   -- 黑曜石斧头x2
["IAtop3"] = {loot = {obsidianmachete = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropTop"},},   -- 黑曜石砍刀x2
["IAtop4"] = {loot = {spear_obsidian = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropTop"},},   -- 黑曜石矛x2
["IAtop5"] = {loot = {armorobsidian = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropTop"},},   -- 黑曜石盔甲x2
["IAtop6"] = {loot = {obsidiancoconade = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropTop"},},   -- 黑曜石椰子炸弹x3
["IAtop7"] = {loot = {windstaff = 1, wind_conch = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropTop"},},   -- 风杖x1，风螺x1
["IAtop8"] = {loot = {volcanostaff = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropTop"},},   -- 火山法杖x1
-- Boss specific drops  
["IAboss1"] = {loot = {magic_seal = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropBoss"},},   -- 魔法封印x1
["IAboss2"] = {loot = {turbine_blades = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropBoss"},},   -- 涡轮叶片x1
["IAboss3"] = {loot = {piratepack = 1, quackenbeak = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropBoss"},},   -- 海盗背包x1，咯咯鸟嘴x1
["IAboss4"] = {loot = {tigereye = 1, shark_gills = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropBoss"},},   -- 虎眼石x1，鲨鱼鳃x3
-- Character Specific  
["IAchar1"] = {loot = {surfboard_item = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropChar"},},   -- 冲浪板x2
["IAchar2"] = {loot = {woodlegshat = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropChar"},},   -- 木腿帽x1
-- My Additions (general rarity)  
-- Armor sets  
["IAgood1"] = {loot = {armorseashell = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 贝壳盔甲x2
["IAgood2"] = {loot = {armorlimestone = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 石灰石盔甲x2
["IAgood3"] = {loot = {armorcactus = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 仙人掌盔甲x2
["IAgood4"] = {loot = {oxhat = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 牛角帽x2
["IAgood5"] = {loot = {gashat = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 气体帽x2
-- Weapon sets  
["IAgood6"] = {loot = {spear_poison = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 毒矛x2
["IAgood7"] = {loot = {blowdart_poison = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 毒吹箭x3
["IAgood8"] = {loot = {coconade = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 椰子炸弹x3
["IAgood9"] = {loot = {spear_launcher = 2, spear = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 矛发射器x2，矛x2
["IAgood10"] = {loot = {cutlass = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 短剑x2
["IAgood11"] = {loot = {harpoon = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 鱼叉x1
["IAgood12"] = {loot = {ia_trident = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 海神三叉戟x1
["IAgood13"] = {loot = {needlespear = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 针矛x3
["IAgood14"] = {loot = {peg_leg = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 木腿x2
["IAgood15"] = {loot = {blowdart_flup = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 弗鲁吹箭x3
-- Tools  
["IAgood16"] = {loot = {machete = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 砍刀x3
["IAgood17"] = {loot = {goldenmachete = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 金砍刀x2
["IAgood18"] = {loot = {machete = 1, goldenmachete = 1, obsidianmachete = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 砍刀x1，金砍刀x1，黑曜石砍刀x1
["IAgood19"] = {loot = {axe = 1, goldenaxe = 1, obsidianaxe = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 斧头x1，金斧头x1，黑曜石斧头x1
--Clothes  
["IAgood20"] = {loot = {brainjellyhat = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 脑浆帽 x1
["IAgood21"] = {loot = {double_umbrellahat = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 双层伞帽 x1
["IAgood22"] = {loot = {shark_teethhat = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 鲨鱼牙帽 x1
["IAgood23"] = {loot = {blubbersuit = 1, armor_windbreaker = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 脂肪套装 x1, 防风背心 x1
["IAgood24"] = {loot = {aerodynamichat = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 飞行帽 x1
["IAgood25"] = {loot = {tarsuit = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 焦油套装 x2
["IAgood26"] = {loot = {snakeskinhat = 1, armor_snakeskin = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 蛇皮帽 x1, 蛇皮夹克 x1
["IAgood27"] = {loot = {captainhat = 1, piratehat = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 船长帽 x1, 海盗帽 x1
["IAgood28"] = {loot = {armor_lifejacket = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 救生衣 x2
["IAgood29"] = {loot = {tropicalfan = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 热带扇 x1
--Boats  
["IAgood30"] = {loot = {sail_palmleaf = 1, boat_torch = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 棕榈叶帆 x1, 船用火把 x1
["IAgood31"] = {loot = {sail_cloth = 1, boat_lantern = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 布帆 x1, 船用灯笼 x1
["IAgood32"] = {loot = {sail_snakeskin = 1, telescope = 1},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 蛇皮帆 x1, 望远镜 x1
["IAgood33"] = {loot = {sail_feather = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 羽毛帆 x1
["IAgood34"] = {loot = {ironwind = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 铁风号
["IAgood35"] = {loot = {quackendrill = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 橡皮鸭钻头
["IAgood36"] = {loot = {quackeringram = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 橡皮鸭攻城锤
["IAgood37"] = {loot = {telescope = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 望远镜 x2
["IAgood38"] = {loot = {supertelescope = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 高级望远镜 x1
["IAgood39"] = {loot = {boatrepairkit = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 船舶修理套件 x2
["IAgood40"] = {loot = {boatcannon = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 船炮 x1
["IAgood41"] = {loot = {trawlnet = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 拖网 x2
--Light  
["IAgood42"] = {loot = {bottlelantern = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 瓶灯 x2
["IAgood43"] = {loot = {tarlamp = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 焦油灯 x2
--Survival  
["IAgood44"] = {loot = {thatchpack = 1, palmleaf_umbrella = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 茅草包 x1, 棕榈叶伞 x1
["IAgood45"] = {loot = {seasack = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 海难背包 x1
["IAgood46"] = {loot = {seatrap = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 捕鱼陷阱 x2
["IAgood47"] = {loot = {antivenom = 5,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 解毒剂 x5
["IAgood48"] = {loot = {wall_limestone_item = 8,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 石灰石墙 x8
["IAgood49"] = {loot = {wall_enforcedlimestone_item = 8,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 强化石灰石墙 x8
["IAgood50"] = {loot = {sandbagsmall_item = 8,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 小型沙袋 x8
--Farming  
["IAgood51"] = {loot = {mussel_stick = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 贻贝棒 x3
--Magic  
["IAgood52"] = {loot = {ox_flute = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 牛笛 x1
--Misc + new content/drops I forgot about previously oops  
["IAgood53"] = {loot = {crate = 4,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 木箱 x4
["IAgood54"] = {loot = {ia_messagebottle = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 岛屿信息瓶 x1
["IAgood55"] = {loot = {ia_messagebottle = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 岛屿信息瓶 x2
["IAgood56"] = {loot = {ia_messagebottle = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 岛屿信息瓶 x3
["IAgood57"] = {loot = {parrot_pirate = 10,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 海盗鹦鹉 x10
["IAgood58"] = {loot = {nubbin = 2,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 芽孢 x2
["IAgood59"] = {loot = {corallarve = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 珊瑚幼虫 x3
["IAgood60"] = {loot = {doydoybaby = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 小渡渡鸟 x1
["IAgood61"] = {loot = {doydoyegg = 1, doydoyfeather = 4,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 渡渡鸟蛋 x1, 渡渡鸟羽毛 x4
["IAgood62"] = {loot = {sunken_boat_trinket_4 = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 沉船宝藏（饰品4）x1
["IAgood63"] = {loot = {buriedtreasure = 1,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 埋藏宝藏 x1
["IAgood64"] = {loot = {tropicalbouillabaisse = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 热带海鲜浓汤 x3
["IAgood65"] = {loot = {surfnturf = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 海鲜牛排 x3
["IAgood66"] = {loot = {dug_coffeebush = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 咖啡树幼苗 x3
["IAgood67"] = {loot = {dug_elephantcactus = 3,},  group_tag = {"good"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 象鼻树幼苗 x3

--OKAY DROPS:
--IA default:
["IAgeologist"] = {loot = {rocks = 1, goldnugget = 1, obsidian = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDefault"},},
["IAslot_jelly"] ={loot ={jellyfish_dead = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDefault"},},
["IAslot_limpets"] ={loot ={limpets = 5,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDefault"},},
["IAslot_seafoodsurprise"] = {loot ={limpets = 2, jellyfish_dead = 1, fish_tropical = 2, fishmeat = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDefault"},},
["IAslot_bamboozled"] ={loot ={dug_bambootree = 1, bamboo = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDefault"},},
["IAslot_fisherman"] ={loot ={fishmeat = 3, fish_tropical = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDefault"},},
["IAslot_coconutty"] ={loot ={coconut = 5,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDefault"},},
["IAslot_tailor"] ={loot ={sewing_kit = 1, fabric= 3, tophat = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDefault"},},
--Foods
["IAfood1"] = {loot = {sweet_potato = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood2"] = {loot = {coffeebeans = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood3"] = {loot = {limpets = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood4"] = {loot = {roe = 5,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood5"] = {loot = {seaweed = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood6"] = {loot = {mussel = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood7"] = {loot = {fishmeat_small = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood8"] = {loot = {fishmeat = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood9"] = {loot = {rainbowjellyfish_dead = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood10"] = {loot = {solofish_dead = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood11"] = {loot = {swordfish_dead = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood12"] = {loot = {fish_tropical = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood13"] = {loot = {neon_quattro = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood14"] = {loot = {purple_grouper = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood15"] = {loot = {pierrot_fish = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood16"] = {loot = {shark_fin = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood17"] = {loot = {tunacan = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood18"] = {loot = {blubber = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood19"] = {loot = {coral_brain = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood20"] = {loot = {dragoonheart = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
["IAfood21"] = {loot = {mysterymeat = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropFood"},},
--Crockpot Foods (Some only)
["IAdish1"] = {loot = {ceviche = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDish"},},
["IAdish2"] = {loot = {jellyopop = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDish"},},
["IAdish3"] = {loot = {seafoodgumbo = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDish"},},
["IAdish4"] = {loot = {musselbouillabaise = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropDish"},},
--Seeds 
["IAseed1"] = {loot = {sweet_potato_seeds = 4,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropSeed"},},
--Mobs: 
["IAmob1"] = {loot = {crab = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropMob"},},
["IAmob2"] = {loot = {lobster = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropMob"},},
["IAmob3"] = {loot = {rainbowjellyfish = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropMob"},},
--Turfs:
["IAturf1"] = {loot = {turf_magmafield = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropTurf"},},
["IAturf2"] = {loot = {turf_snakeskin = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropTurf"},},
["IAturf3"] = {loot = {turf_volcano = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropTurf"},},
--Plants:
["IAplant1"] = {loot = {jungletreeseed = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropPlant"},},
["IAplant2"] = {loot = {coconut = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropPlant"},},
["IAplant3"] = {loot = {dug_bambootree = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropPlant"},},
["IAplant4"] = {loot = {dug_bush_vine = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropPlant"},},
["IAplant5"] = {loot = {dug_coffeebush = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropPlant"},},
["IAplant6"] = {loot = {dug_elephantcactus = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropPlant"},},
--My Additions (general rarity)
--Materials
["IAokay1"] = {loot = {vine = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 藤蔓x3
["IAokay2"] = {loot = {bamboo = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 竹子x3
["IAokay3"] = {loot = {seashell = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 海螺x3
["IAokay4"] = {loot = {palmleaf = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 棕榈叶x3
["IAokay5"] = {loot = {coral = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 珊瑚x3
["IAokay6"] = {loot = {sand = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 沙子x3
["IAokay7"] = {loot = {obsidian = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 黑曜石x1
["IAokay8"] = {loot = {fabric = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 布料x3
["IAokay9"] = {loot = {ia_messagebottleempty = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 空的信息瓶x3
["IAokay10"] = {loot = {limestonenugget = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 石灰石x3
["IAokay11"] = {loot = {tar = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 焦油x3
["IAokay12"] = {loot = {snakeskin = 3,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 蛇皮x3
["IAokay13"] = {loot = {venomgland = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 毒蛇腺体x2
["IAokay14"] = {loot = {dorsalfin = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 背鳍x2
["IAokay15"] = {loot = {ox_horn = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 牛角x1
["IAokay16"] = {loot = {mosquitosack_yellow = 2,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 黄色蚊子包x2
["IAokay17"] = {loot = {snakeoil = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 蛇油x1
["IAokay18"] = {loot = {doydoyfeather = 1,},  group_tag = {"ok"}, classify_tag = {"DropIsland", "DropRarity"},},   -- 多多鸟羽毛x1
  
--BAD DROPS:  
--IA default:  
["IAslot_mosquitoattack"] ={loot ={mosquito_poison= 3,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 蚊子毒素x3（减少到3，之前太强了）
["IAslot_snakeattack"] ={loot ={snake = 5,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 蛇x5（增加到5）
["IAslot_monkeysurprise"] ={loot ={primeape = 3,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},  -- 高级猿猴x3（增加到3）
["IAslot_poisonsnakes"] ={loot ={snake_poison = 3,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 毒蛇x3（增加到3）
  
--Enemies   
["IAenemy1"] = {loot = {crocodog = 4,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 鳄鱼狗x4
["IAenemy2"] = {loot = {poisoncrocodog = 3,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 毒鳄鱼狗x3
["IAenemy3"] = {loot = {watercrocodog = 3,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 水鳄鱼狗x3
["IAenemy4"] = {loot = {pirateghost = 2,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 海盗幽灵x2
["IAenemy5"] = {loot = {dragoon = 2,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 龙骑兵x2
["IAenemy6"] = {loot = {flup = 4,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 泡泡鱼x4
["IAenemy7"] = {loot = {tropical_spider_warrior = 2,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 热带蜘蛛战士x2
["IAenemy8"] = {loot = {kraken_tentacle = 2,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEnemy"},},   -- 克拉肯触手x2
  
--Effects  
["IAeffect1"] = {loot = {poisonhole = 2,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEffect"},},   -- 毒坑x2
["IAeffect2"] = {loot = {lavapool = 2,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEffect"},},   -- 岩浆池x2
["IAeffect3"] = {loot = {tar_trap = 2,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEffect"},},   -- 焦油陷阱x2
["IAeffect4"] = {loot = {kraken_inkpatch = 2,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEffect"},},   -- 克拉肯墨斑x2
--["IAeffect"] = {loot = { = 1,},  group_tag = {"bad"}, classify_tag = {"DropIsland", "DropEffect"},},
}
return internalloot