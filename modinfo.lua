local function en_zh(en, zh)
	return (locale == "zh" or locale == "zhr" or locale == "zht" or locale == "ch" or locale == "chs") and zh or en
end
name = en_zh("Lucky God Simulator", "欧皇模拟器")
description = en_zh("Lucky God Simulator", "欧皇模拟器")
author = "明雪"
version = "1.5.0"

forumthread = ""

-- 这让其他玩家知道您的模组是否已过时，请将其更新为与游戏中当前版本相匹配
api_version = 10  -- API版本

-- 这让模组系统知道此模组适用于《饥荒》
dont_starve_compatible = false  -- 是否兼容《饥荒》原版（否）

-- 这让模组系统知道此模组适用于《饥荒》的“巨人的统治”DLC
reign_of_giants_compatible = false  -- 是否兼容“巨人的统治”DLC（否）

-- 这让模组系统知道此模组适用于《饥荒：联机版》
dst_compatible = true  -- 是否兼容《饥荒：联机版》（是）

-- 这让客户端知道，在他们加入使用此模组的服务器之前，他们需要下载此模组
all_clients_require_mod = true  -- 所有客户端是否需要此模组（是）

-- 这让游戏知道此模组不需要在服务器的模组列表中列出
client_only_mod = false  -- 是否为仅客户端模组（否）

-- 这些标签允许运行此模组的服务器通过服务器列表屏幕的过滤器被找到
server_filter_tags = {"slotmachine","slot machine","slots","欧皇模拟器","老虎机"}  -- 服务器过滤器标签

-- 加载优先级：
priority = -20000  -- 加载优先级

-- 游戏内模组信息显示用的图标和图集：
icon_atlas = "icon.xml"  -- 图标图集
icon = "icon.tex"  -- 图标

configuration_options =
{
	{
		name = "Language",
		label = en_zh("Language","语言"),
		hover = en_zh("Choose language","选择语言"),
		options =
		{
			{description = en_zh("Chinese","中文"), data = "ch", hover = en_zh("Chinese","中文"),},
			{description = en_zh("English","英文"), data = "en", hover = en_zh("English","英文"),},
		},
		default = "ch",
	},
	-- 金币设置
	{
		name = "",
		label = en_zh("Coin Settings", "金币设置"),
		hover = en_zh("Configure options related to coins.", "配置与金币相关的选项。"),
		options = {{description = "", data = ""}},
		default = "",
	},

	-- 难度设置
	{
		name = "Difficulty",
		label = en_zh("Difficulty", "难度"),
		hover = en_zh("Adjust the game's difficulty by changing the drop rate of coins.", "通过改变金币的掉落率来调整游戏难度。"),
		options = {
			{description = en_zh("Brutal (x0.05)", "极难 (x0.05)"), data = 0.05},
			{description = en_zh("Abyss (x0.1)", "深渊 (x0.1)"), data = 0.1},
			{description = en_zh("Nightmare (x0.2)", "噩梦 (x0.2)"), data = 0.2},
			{description = en_zh("Hard (x0.5)", "困难 (x0.5)"), data = 0.5},
			{description = en_zh("Normal (x1)", "普通 (x1)"), data = 1},
			{description = en_zh("Easy (x2)", "简单 (x2)"), data = 2},
			{description = en_zh("Very Easy (x5)", "非常容易 (x5)"), data = 5},
			{description = en_zh("Fantastical (x10)", "梦幻 (x10)"), data = 10},
			{description = en_zh("Coin Rain! (x20)", "金币雨! (x20)"), data = 20},
		},
		default = 1,
	},
	{
		name = "Infstack",
		label = en_zh("Coin Stack Limit", "金币堆叠数量"),
		hover = en_zh("Set the maximum number of coins that can be stacked together.", "设置金币可以堆叠的最大数量。"),
		options = {
			{description = en_zh("60", "60"), data = 60},
			{description = en_zh("Unlimited", "无限"), data = true},
		},
		default = 60,
	},

	-- 普通怪是否爆金币
	{
		name = "Mob",
		label = en_zh("Common Monsters Drop Coins", "普通怪是否爆金币"),
		hover = en_zh("Configure whether common monsters drop coins.", "配置普通怪物是否会掉落金币。"),
		options = {
			{description = en_zh("Enabled", en_zh("Enable", "开启")), data = 1},
			{description = en_zh("Disabled", en_zh("Disable", "关闭")), data = 0},
		},
		default = 1,
	},
	{
		name = "Boss",
		label = en_zh("Boss Drops Coins", "Boss是否爆金币"),
		hover = en_zh("Configure whether boss monsters drop coins.", "配置boss是否会掉落金币"),--确定boss是否可以掉落金币
		options =
		{
			{description = en_zh("Enable", "开启"), data = 1},
			{description = en_zh("Disable", "关闭"), data = 0},
		},
		default = 1,
	},
	{
		name = "Environment",
		label = en_zh("Environment Drops Coins", "岩石、树木、巨型作物是否爆金币") ,
		hover = en_zh("Configure whether the environment (rocks, trees, giant crops) drops coins.", "配置环境（岩石、树木、巨型作物）是否会掉落金币")  , --确定环境(岩石、树木、巨型作物)是否会掉落金币
		options =
		{
			{description = en_zh("Enable", "开启"), data = 1},
			{description = en_zh("Disable", "关闭"), data = 0},
		},
		default = 1,
	},
	{
		name = "Refine",
		label = en_zh("Enable Coin Refining", "开启金币精炼") ,
		hover = en_zh("Configure whether to enable refining coins from excess items.", "配置是否开启金币精炼，将多余的物品换成金币"),--确定是否启用金币精炼配方(将多余的材料转化为金币)
		options =
		{
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = true,
	},
	{
		name = "Shop",
		label = en_zh("Enable Coin Shop", "开启金币商店"),
		hover = en_zh("Configure whether to enable a shop where excess coins can be exchanged for useful items.", "配置是否开启金币商店，可以将多余的金币换成各种实用的物品"),--确定是否启用金币商店配方(将多余的金币变成各种奖品)
		options =
		{
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = true,
	},
	{
		name = "Starting",
		label = en_zh("Initial Coins", "初始金币"),
		hover = en_zh("Set the initial number of coins given to all players.", "设置所有玩家的初始金币数量"),--初始金币
		options =
		{
			{description = "0", data = 0},
			{description = "10", data = 10},
			{description = "20", data = 20},
			{description = "30", data = 30},
			{description = "40", data = 40},
			{description = "50", data = 50},
			{description = "60", data = 60},
			{description = "70", data = 70},
			{description = "80", data = 80},
			{description = "90", data = 90},
			{description = "100", data = 100},
			{description = "200", data = 200},
		},
		default = 10,
	},
	{name = "",label = en_zh("Slot Machine Settings","老虎机设置"),hover = "",options =   {{description = "", data = ""},},default = "",},
	{
		name = "position",
		label = en_zh("Slot Machine Position", "老虎机位置"),
		hover = en_zh("Choose the location of the slot machine.", "选择老虎机的位置"),--如果要移动到新的随机位置，请在两个随机选项之间切换
		options = {
			{description = en_zh("Disable", "关闭"), data = 0},
			{description = en_zh("Near Entrance", "大门附近"), data = 1}, --大门附近
			{description = en_zh("Map Center", "地图中心"), data = 2}, --地图中心
			{description = en_zh("Random location 1","随机位置1"), data = 3}, --随机位置1
			{description = en_zh("Random location 2","随机位置2"), data = 4}, --随机位置2
		},
		default = 1,
	},
	{
		name = "SlotMachineDifficulty",
		label = en_zh("Slot Machine Difficulty", "老虎机制作难度"),
		hover = en_zh("Adjust the difficulty level of manufacturing a slot machine.", "调整制作老虎机的难度等级"),
		options =
		{
			{description = en_zh("Very Easy","非常简单"), data = 1},
			{description = en_zh("Easy","简单"), data = 2},
			{description = en_zh("Moderate","一般"), data = 3},
			{description = en_zh("Difficult","困难"), data = 4},
			{description = en_zh("Very Difficult","非常困难"), data = 5},
		},
		default = 3,
	},
	{
		name = "DestroySlotMachine",
		label = en_zh("Allow Destroying Slot Machine", "老虎机允许被摧毁"),
		hover = en_zh("Determine whether the slot machine can be destroyed by players.", "确定老虎机是否能被玩家摧毁"),
		options =
		{
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = false,
	},
	{
		name = "Announcements",
		label = en_zh("Enable Announcement Count", "启用计数公告"),
		hover = en_zh("Enable global announcements for slot machine rolls.", "启用老虎机抽奖次数的全局公告"),--确定是否启用老虎机滚动计数全局公告
		options =
		{
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = true,
	},
	{
		name = "Antitrash",
		label = en_zh("Anti-Trash", "防止垃圾过多") ,
		hover = en_zh("Prevents the slot machine from being locked if there are too many items around it.", "如果老虎机周围物品过多会锁定老虎机，直到周围物品被清理"),--确定如果老虎机前面的物品太多，老虎机是否会锁定/停止工作！
		options =
		{
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = true,
	},
	{
		name = "Decaytime",
		label = en_zh( "Slot Machine Auto-Clean", "老虎机自动清理") ,
		hover = en_zh("Configure whether dropped items from the slot machine disappear after a certain period if not picked up.", "配置是否在一定时间内未拾取，老虎机掉落物品将自动消失。")  ,--确定如果在一定时间内没有拾取，老虎机掉落物品是否会自动消失
		options = {
			{description = en_zh("Disable", "关闭"), data = 0},
			{description = "30", data = 30},
			{description = "45", data = 45},
			{description = "60", data = 60},
			{description = "75", data = 75},
			{description = "90", data = 90},
			{description = "120", data = 120},
		},
		default = 0
	},
	{
		name = "MachineClean",
		label = en_zh( "Slot Machine Manual Clean", "老虎机手动清理"),
		hover = en_zh("Y or U input with #cleanup near the slot machine to clean up surrounding items!", "在老虎机附近使用Y或U键并输入#cleanup来清理周围物品！"),
		options =
		{
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = true,
	},
	{
		name = "CleaningScope",
		label = en_zh( "Manual Cleaning Scope","手动清理范围"),
		hover = en_zh("Set the range within which the slot machine will clean up items.", "设置老虎机清理物品的范围。"),
		options =
		{
			{description = "8", data = 8},
			{description = "12", data = 12},
			{description = "16", data = 16},
			{description = "20", data = 20},
		},
		default = 12,
	},
	{
		name = "AutoStack",
		label = en_zh("Auto Stack","自动堆叠"),
		hover = en_zh("Enable automatic stacking of items, including those obtained from the slot machine.", "启用物品的自动堆叠，包括从老虎机中获得的物品。"),
		options =
		{
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = false,
	},
	{
		name = "IsGiftMachine",
		label = en_zh("Open Gifts Near Slot Machine","靠近老虎机可以开礼物"),
		hover = en_zh("Configure whether gifts can be opened near the slot machine.", "配置是否可以在老虎机附近开启礼物。"),
		options = {
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = true,
	},
	{name = "",label = en_zh("Good, Okay, Bad Weight Settings","Good，Okay，Bad权重设置"),hover = "",options =   {{description = "", data = ""},},default = "",},
	{
		name = "good",
		label = en_zh("Good Weight","Good权重"),
		hover = en_zh("Set the weight for items categorized as 'Good'.", "设置分类为'Good'的物品的权重。"),--good类型物品掉率默认1/6
		options = {
			{description = "0", data = 0},
			{description = "1", data = 1},
			{description = "2", data = 2},
			{description = "3", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
		},
		default = 1,
		tag = "CategoryWeight",
	},
	{
		name = "ok",
		label = en_zh("Ok Weight","Ok权重"),
		hover = en_zh("Set the weight for items categorized as 'Ok'.", "设置分类为'Ok'的物品的权重。"),--ok类型物品掉率默认3/6
		options = {
			{description = "0", data = 0},
			{description = "1", data = 1},
			{description = "2", data = 2},
			{description = "3", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
		},
		default = 3,
		tag = "CategoryWeight",
	},
	{
		name = "bad",
		label = en_zh("Bad Weight","Bad权重"),
		hover = en_zh("Set the weight for items categorized as 'Bad'.", "设置分类为'Bad'的物品的权重。"),--bad类型物品掉率默认2/6
		options = {
			{description = "0", data = 0},
			{description = "1", data = 1},
			{description = "2", data = 2},
			{description = "3", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
		},
		default = 2,
		tag = "CategoryWeight",
	},
	{name = "",label = en_zh("Subclass Weight Settings","细分权重设置"),hover = "",options =   {{description = "", data = ""},},default = "",},
	{
		name = "DropDefault",
		label = en_zh("(Good, Okay, Bad) Default Ratio","(Good,Okay,Bad)默认比例"),
		hover = en_zh("This is a fallback type. When all weights are set to 0, DropDefault will be set to 1 to avoid not drawing any items.", "这是一个保底类型。当所有权重设置为0时，DropDefault将被设置为1，以避免抽不出任何物品。")  ,--更改选择默认老虎机投放的速率
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropRarity",
		label = en_zh("(Good, Okay) Rare Item Ratio","(Good,Okay)优质物品比例"),
		hover = en_zh("Set the weight for high-quality items.", "设置优质物品的权重。") ,
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropJackpot",
		label = en_zh("(Good) Jackpot (Large Amount of Coins) Ratio","(Good)一堆金币比例"),
		hover = en_zh("Set the ratio for drawing a large amount of coins.", "设置抽出一堆金币的比例。"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropBlueprint",
		label = en_zh("(Good) Blueprint Ratio","(Good)蓝图比例"),
		hover = en_zh("Set the ratio for drawing blueprints.", "设置抽出蓝图的比例。"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropEvent",
		label = en_zh("(Good) Event Item Ratio","(Good)活动物品比例"),
		hover = en_zh("Set the ratio for drawing event-related items.", "设置抽出活动物品的比例。"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropTop",
		label = en_zh("(Good) Rare Item Ratio (Top Tier)","(Good)稀有物品比例"),
		hover = en_zh("Set the ratio for drawing rare items.", "设置抽出稀有物品的比例。"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropBoss",
		label = en_zh( "(Good) Boss Drop Rate","(Good)boss掉落物比例"),
		hover = en_zh( "The rate at which boss drops are obtained","抽出boss掉落物的比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropChar",
		label = en_zh( "(Good) Character Exclusive Item Drop Rate","(Good)角色专属物品比例"),
		hover = en_zh("The rate at which character exclusive items are obtained" ,"抽出角色专属物品的比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropBook",
		label = en_zh( "(Good) Book Drop Rate","(Good)书籍比例"),
		hover = en_zh( "The rate at which books are obtained","抽出书籍类物品的比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropBuff",
		label = en_zh( "(Good) Drop Buffs","(Good)DropBuff"),
		hover = en_zh("Some beneficial buffs" ,"一些buff"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropFood",
		label = en_zh( "(Okay) Food Drop Rate","(Okay)食物比例"),
		hover = en_zh( "The rate at which food items are obtained","抽出食物比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropDish",
		label = en_zh( "(Okay) Dish Drop Rate","(Okay)料理比例"),
		hover = en_zh( "The rate at which dishes are obtained","抽出料理比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropSeed",
		label = en_zh( "(Okay) Seed Drop Rate","(Okay)种子比例"),
		hover = en_zh( "The rate at which seeds are obtained","抽出种子比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropMob",
		label = en_zh( "(Okay) Normal Enemy Drop Rate","(Okay)普通怪比例"),
		hover = en_zh( "The rate at which normal enemies are encountered","抽出普通怪物比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropTurf",
		label = en_zh( "(Okay) Flooring Drop Rate","(Okay)地皮比例"),
		hover = en_zh( "The rate at which floor tiles are obtained","抽出地皮比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropPlant",
		label = en_zh("(Okay) Plant Drop Rate" ,"(Okay)植物比例"),
		hover = en_zh( "The rate at which plants are obtained","抽出植物比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropEnemy",
		label = en_zh( "(Bad) Hostile Unit Drop Rate","(Bad)敌对单位比例"),
		hover = en_zh( "The rate at which hostile units are encountered","抽出敌对单位比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropBadBoss",
		label = en_zh("(Bad) Boss-Level Enemy Drop Rate" ,"(Bad)BOSS级怪物比例"),
		hover = en_zh("The rate at which boss-level enemies are encountered" ,"BOSS级怪物"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropEffect",
		label = en_zh( "(Bad) Negative Effect Drop Rate", "(Bad)负向事件比例"),
		hover = en_zh( "The rate at which negative effects or attacks are obtained", "抽出一些攻击效果比例"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{
		name = "DropDebuff",
		label = en_zh("(Bad)DropDebuff","(Bad)DropDebuff"),
		hover = en_zh("(Bad)DropDebuff","一些debuff"),
		options = {
			{description = "0", data = 0},
			{description = "1/2x", data = 0.5},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "3x", data = 3},
			{description = "4x", data = 4},
			{description = "5x", data = 5},
		},
		default = 1,
		tag = "SubclassWeight",
	},
	{name = "",label = en_zh("Tech-Related Settings","科技相关设置"),hover = "",options =   {{description = "", data = ""},},default = "",},
	{
		name = "MachineScience",
		label = en_zh("Slot Machine Requires Technology","老虎机需要科技"),
		hover = en_zh("Whether the slot machine requires technology","老虎机是否需要科技"),
		options = {
			{description = en_zh("No Technology Needed","不需要科技"), data = 0},
			{description = en_zh("Science Machine","科学机器"), data = 1},
			{description = en_zh("Alchemy Engine","炼金引擎"), data = 2},
			{description = en_zh("Shadow Manipulator","暗影操控器"), data = 3},
			{description = en_zh("Prestihatitator","灵子分解器"), data = 4},
			{description = en_zh("Ancient Pseudoscience Station","远古伪科学站"), data = 5},
		},
		default = 0,
		tag = "Science",
	},
	{
		name = "RefineScience",
		label = en_zh("Refining Requires Technology","精炼需要科技"),
		hover = en_zh("Whether refining requires technology","精炼是否需要科技"),
		options = {
			{description = en_zh("No Technology Needed","不需要科技"), data = 0},
			{description = en_zh("Science Machine","科学机器"), data = 1},
			{description = en_zh("Alchemy Engine","炼金引擎"), data = 2},
			{description = en_zh("Shadow Manipulator","暗影操控器"), data = 3},
			{description = en_zh("Prestihatitator","灵子分解器"), data = 4},
			{description = en_zh("Ancient Pseudoscience Station","远古伪科学站"), data = 5},
		},
		default = 0,
		tag = "Science",
	},
	{
		name = "ShopScience",
		label = en_zh("Coin Shop Requires Technology","金币商店需要科技"),
		hover = en_zh("Whether the coin shop requires technology","金币商店是否需要科技"),
		options = {
			{description = en_zh("No Technology Needed","不需要科技"), data = 0},
			{description = en_zh("Science Machine","科学机器"), data = 1},
			{description = en_zh("Alchemy Engine","炼金引擎"), data = 2},
			{description = en_zh("Shadow Manipulator","暗影操控器"), data = 3},
			{description = en_zh("Prestihatitator","灵子分解器"), data = 4},
			{description = en_zh("Ancient Pseudoscience Station","远古伪科学站"), data = 5},
		},
		default = 0,
		tag = "Science",
	},
	{name = "",label = en_zh("Other MOD-Related Settings","其它MOD相关设置"),hover = "",options =   {{description = "", data = ""},},default = "",},
	{
		name = "DropIsland",
		label = en_zh("Island Adventure Item Weight","岛屿冒险物品权重"),
		hover = en_zh("Weight for island adventure items","岛屿冒险物品权重"),
		options = {
			{description = "0", data = 0},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "4x", data = 4},
			{description = "6x", data = 6},
			{description = "8x", data = 8},
			{description = "10x", data = 10},
		},
		default = 2,
		tag = "Mod",
		modName = "workshop-1467214795",
	},
	{
		name = "DropFG",
		label = en_zh("No Danger No Rich Item Weight","富贵险中求物品权重"),
		hover = en_zh("Weight for No Danger No Rich items","富贵险中求物品权重"),
		options = {
			{description = "0", data = 0},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "4x", data = 4},
			{description = "6x", data = 6},
			{description = "8x", data = 8},
			{description = "10x", data = 10},
			{description = "20x", data = 20},
			{description = "40x", data = 40},
		},
		default = 2,
		tag = "Mod",
		modName = "workshop-2823458540",
	},
	{
		name = "DropWLDH",
		label = en_zh("武林大会高难作物 Item Weight","武林大会高难作物物品权重"),
		hover = en_zh("Weight for 武林大会高难作物 items","武林大会高难作物物品权重"),
		options = {
			{description = "0", data = 0},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "4x", data = 4},
			{description = "6x", data = 6},
			{description = "8x", data = 8},
			{description = "10x", data = 10},
			{description = "20x", data = 20},
			{description = "40x", data = 40},
		},
		default = 2,
		tag = "Mod",
		modName = "workshop-2511339795",
	},
	{
		name = "DropWKBD",
		label = en_zh("真神·薇克巴顿 Item Weight","真神·薇克巴顿物品权重"),
		hover = en_zh("Weight for 真神·薇克巴顿 items","真神·薇克巴顿物品权重"),
		options = {
			{description = "0", data = 0},
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "4x", data = 4},
			{description = "6x", data = 6},
			{description = "8x", data = 8},
			{description = "10x", data = 10},
			{description = "20x", data = 20},
			{description = "40x", data = 40},
		},
		default = 2,
		tag = "Mod",
		modName = "workshop-2929911476",
	},
	{name = "",label = en_zh("Special Gameplay Features","特殊玩法"),hover = "",options =   {{description = "", data = ""},},default = "",},
	{
		name = "SlotIslandMode",
		label = en_zh("Slot Island Mode(Conflict with IA)", "孤岛模式(和IA冲突)"),
		hover = en_zh("Toggle Slot Island Mode. When enabled, players will only be able to use the slot machine for rewards and interact with items and structures within a specified radius on a resource-less island." ,"切换老虎机孤岛模式。启用时，玩家将只能在一个无资源的岛屿上使用老虎机进行抽奖。和生成地形的mod会不兼容"),
		options =
		{
			{description = en_zh("Enable", "开启"), data = true},
			{description = en_zh("Disable", "关闭"), data = false},
		},
		default = false,
	},
	{
		name = "MagnificationLowerLimit",
		label = en_zh("Minimum Multiplier Limit","倍率下限"),
		hover = en_zh("Default 1x reward, not recommended to exceed 10 for multiplayer","默认一倍奖励,多人不建议超过10"),
		options = {
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "4x", data = 4},
			{description = "6x", data = 6},
			{description = "8x", data = 8},
			{description = "10x", data = 10},
			{description = "20x", data = 20},
			{description = "30x", data = 30},
			{description = "40x", data = 40},
			{description = "50x", data = 50},
			{description = "100x", data = 100},
		},
		default = 1,
	},
	{
		name = "MagnificationUpperLimit",
		label = en_zh("Maximum Multiplier Limit","倍率上限"),
		hover = en_zh("Maximum limit is 100, too many items may cause lag, not recommended to exceed 10 for multiplayer","上限最高100,物品过多会卡,多人不建议超过10"),
		options = {
			{description = "1x", data = 1},
			{description = "2x", data = 2},
			{description = "4x", data = 4},
			{description = "6x", data = 6},
			{description = "8x", data = 8},
			{description = "10x", data = 10},
			{description = "20x", data = 20},
			{description = "30x", data = 30},
			{description = "40x", data = 40},
			{description = "50x", data = 50},
			{description = "100x", data = 100},
		},
		default = 1,
	},
}