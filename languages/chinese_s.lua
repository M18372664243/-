local STRINGS = GLOBAL.STRINGS
local nm = STRINGS.NAMES
local rec = STRINGS.RECIPE_DESC
local gen_desc = STRINGS.CHARACTERS.GENERIC.DESCRIBE
STRINGS.UI.CRAFTING_FILTERS.DUBLOONREFINE = "老虎机"
STRINGS.UI.CRAFTING_FILTERS.DUBLOONSHOP = "奇趣金币商店"

-- 老虎机
nm.SLOTMACHINE = "神奇老虎机"
rec.SLOTMACHINE = "做任何事情都要十拿九稳。除了这个。"
gen_desc.SLOTMACHINE = "我想我能再逗留一会儿，或两会儿。"

-- 金币
nm.DUBLOON = "金币"
rec.DUBLOON = "赌博的必备品？也许吧！"
gen_desc.DUBLOON = "看这金币闪闪发光，简直让人移不开眼！"

-- 10连币
nm.OHCOIN10 = "10倍币"
rec.OHCOIN10 = "十倍奖励，也伴随着十倍的风险哦！"
gen_desc.OHCOIN10 = "高风险，高回报，这才是真正的赌博艺术！"

-- 随机币
nm.OHCOINRANDOM = "随机币"
rec.OHCOINRANDOM = "奖励倍数未知，快来试试手气吧！"
gen_desc.OHCOINRANDOM = "赌徒的正确打开方式？当然是用这神秘随机币啦！"

-- 一堆金币的描述生成
local dubloonrefine = require "dubloonrefinetable"
for _, data in ipairs(dubloonrefine) do
    if data.qty and data.qty > 1 then
        nm["DUBLOON_"..string.upper(data.item)] = "金币小山(X"..data.qty..")"
    end
end

-- 金块
rec.GOLDNUGGET = "金子！闪闪发光的金子！发财啦！"

-- 不可制作的物品描述
rec.TRINKET_25 = "老虎机里摇出三个骷髅？这玩意儿可有点诡异，使用前请三思！"
rec.TRINKET_26 = "哇！老虎机里竟然摇出了三个金块！这运气也太好了吧！"
rec.TENTACLESPIKE = "黏糊糊的还带刺？这绝对是海怪的杰作！"
rec.TOWNPORTALTALISMAN = "想去哪里就去哪里，这个传送神器满足你所有的旅行梦想！"
rec.FIREFLIES = "黑暗中的小精灵，它们会为你带来光明！"
rec.HONEYCOMB = "嗡嗡嗡，我是蜂巢，里面装满了甜蜜的蜂蜜哦！"
rec.JELLYBEAN = "甜甜的，糯糯的，满足你的甜食欲望，还能给你补充能量呢！"
rec.FOSSIL_PIECE = "哇，这是化石碎片！看看能不能把它们拼成完整的古生物吧！"
rec.SLURTLEHAT = "顶级壳保护！戴上这顶帽子，你就是最酷的探险家！"
rec.ARMORSNURTLESHELL = "遇到问题就躲进壳里？这可真是个聪明的办法！"
rec.OPALSTAFF = "召唤一个小月亮？这法杖也太神奇了吧！"
rec.HIVEHAT = "戴上这顶帽子，就像女王一样威严！不过要小心别被蜜蜂蛰了哦！"
rec.SKELETONHAT = "驾驭噩梦的力量？这顶帽子看起来确实有点吓人呢！"
rec.KRAMPUS_SACK = "这是怎么到这里的？难道是克拉姆普斯的恶作剧？"
rec.HALLOWEENPOTION_MOON = "喝下这瓶药水，感觉有什么变化在酝酿呢！"
rec.LIVINGTREE_ROOT = "这树苗看起来有点毛骨悚然，不过也许能种出神奇的树呢！"
rec.HALLOWEENPOTION_HEALTH_SMALL = "小小一瓶，却对你的心脏大有好处！健康小秘诀哦！"
rec.HALLOWEENPOTION_SANITY_SMALL = "心灵需要安慰？这瓶小药水就是你的心灵鸡汤！"
rec.HALLOWEENPOTION_HEALTH_LARGE = "大瓶装的健康药水！让你的心脏更加强壮！"
rec.HALLOWEENPOTION_SANITY_LARGE = "更多的安慰，更多的心灵治愈！这瓶大药水绝对让你心情舒畅！"
rec.CUTLESS = "别看它样子普通，关键时刻可是能派上用场的！如果它有用，那就有用！"
rec.OAR_MONKEY = "这船桨不仅能划船，还能对付敌人呢！真是一物多用！"
rec.STASH_MAP = "埋藏的宝藏？这张地图能帮你找到它们！快来一场寻宝之旅吧！"
rec.PIG_COIN = "正面还是反面？这枚小猪硬币可是个好运的象征哦！"

-- IA物品描述
if TUNING.SLOTMACHINE_MODCONFIGDATA["workshop-1467214795".."_enable"] then
    rec.NEEDLESPEAR = "尖锐且易碎，使用的时候要小心别伤到自己哦！"
    rec.BLOWDART_FLUP = "瞄准眼睛！这吹箭可是猎人的好帮手！"
    rec.BIOLUMINESCENCE = "哇哦，好漂亮的光！这生物发光的现象真是太神奇了！"
    rec.IA_MESSAGEBOTTLE = "东？我以为你说的是西！这漂流瓶里的信息可真让人摸不着头脑呢！"
    rec.IA_TRIDENT = "在波塞冬的王国里最有效？这三叉戟看起来确实很有海神的风范！"
    rec.HARPOON = "对付你最大的敌人！这鱼叉可是个厉害的武器呢！"
    rec.SUNKEN_BOAT_TRINKET_4 = "我有如此多的景象要给你看。这沉船饰品里藏着无数的秘密呢！"
    rec.PIRATEPACK = "用你的思想换一个金币？这海盗背包可真是个神奇的宝贝！"
    rec.DOYDOYEGG = "从灭绝中回归！这渡渡鸟蛋可是个珍贵的生命呢！"
else
    -- 当IA没有开启时
    STRINGS.CHARACTERS.WOODIE.DESCRIBE.DUBLOON = "我发现了金子！"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.DUBLOON = "沃尔夫冈强有力的下颚在上面咬出了凹痕！"
    STRINGS.CHARACTERS.WARLY.DESCRIBE.DUBLOON = "金黄火腿，金黄蜂蜜，金黄钱币。"
    STRINGS.CHARACTERS.WILLOW.DESCRIBE.DUBLOON = "海盗的钱！"
    STRINGS.CHARACTERS.WAXWELL.DESCRIBE.DUBLOON = "它们互相碰撞发出的叮铃响声让人心满意足。"
    STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.DUBLOON = "啊哈！海盗们用的货币。"
    STRINGS.CHARACTERS.WX78.DESCRIBE.DUBLOON = "不再使用的货币"
    STRINGS.CHARACTERS.WENDY.DESCRIBE.DUBLOON = "无赖们使用的货币。"
    STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.DUBLOON = "前辈们留下的战利品！"
    STRINGS.CHARACTERS.WORTOX.DESCRIBE.DUBLOON = "海盗的钱也一样没有灵魂。"
    STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.DUBLOON = "吃的东西？ 不是"
    STRINGS.CHARACTERS.WANDA.DESCRIBE.DUBLOON = "我会在口袋里放一把，祈求好运。"
    STRINGS.CHARACTERS.WINONA.DESCRIBE.DUBLOON = "虽然不多，但至少我得到了报酬。"
    STRINGS.CHARACTERS.WALTER.DESCRIBE.DUBLOON = "噢...我想这终究不是巧克力。"
    STRINGS.CHARACTERS.WEBBER.DESCRIBE.DUBLOON = "闪亮的金币！"
    STRINGS.CHARACTERS.WURT.DESCRIBE.DUBLOON = "闪亮的硬币!"

    STRINGS.CHARACTERS.GENERIC.DESCRIBE.OHCOIN10 = "10倍币，十倍幸运，一触即发！"
    STRINGS.CHARACTERS.WOODIE.DESCRIBE.OHCOIN10 = "十倍金币在手，Woodie的财富梦想成真！"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.OHCOIN10 = "沃尔夫冈的战吼配上十倍币，无人能敌！"
    STRINGS.CHARACTERS.WARLY.DESCRIBE.OHCOIN10 = "金黄火腿与十倍金币，Warly的幸运食谱！"
    STRINGS.CHARACTERS.WILLOW.DESCRIBE.OHCOIN10 = "海盗Willow的宝藏，十倍币闪耀光芒！"
    STRINGS.CHARACTERS.WAXWELL.DESCRIBE.OHCOIN10 = "十倍币的叮铃声，是Waxwell的幸运乐章！"
    STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.OHCOIN10 = "十倍币，Wickerbottom解开幸运之谜的关键！"
    STRINGS.CHARACTERS.WX78.DESCRIBE.OHCOIN10 = "即便在废弃之地，十倍币也是WX-78的宝藏！"
    STRINGS.CHARACTERS.WENDY.DESCRIBE.OHCOIN10 = "无赖Wendy的幸运日，十倍币助她翻身！"
    STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.OHCOIN10 = "前辈们的战利品，十倍币传承荣耀！"
    STRINGS.CHARACTERS.WORTOX.DESCRIBE.OHCOIN10 = "十倍币，连海盗的灵魂也会为之颤抖！"
    STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.OHCOIN10 = "十倍币，不是食物，但Wormwood也爱不释手！"
    STRINGS.CHARACTERS.WANDA.DESCRIBE.OHCOIN10 = "Wanda的幸运口袋，十倍币是必备之选！"
    STRINGS.CHARACTERS.WINONA.DESCRIBE.OHCOIN10 = "Winona的报酬升级，十倍币带来满满收获！"
    STRINGS.CHARACTERS.WALTER.DESCRIBE.OHCOIN10 = "噢！这不是巧克力，但这是十倍的快乐！"
    STRINGS.CHARACTERS.WEBBER.DESCRIBE.OHCOIN10 = "闪亮的十倍金币，Webber的宝藏之光！"
    STRINGS.CHARACTERS.WURT.DESCRIBE.OHCOIN10 = "Wurt的幸运硬币，十倍闪耀，无人能及！"

    STRINGS.CHARACTERS.GENERIC.DESCRIBE.OHCOINRANDOM = "OHCOINRANDOM，随机倍率，幸运无极限！"
    STRINGS.CHARACTERS.WOODIE.DESCRIBE.OHCOINRANDOM = "随机倍数，Woodie的每一次抽取都是惊喜！"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.OHCOINRANDOM = "沃尔夫冈咆哮，随机倍数带来无尽挑战！"
    STRINGS.CHARACTERS.WARLY.DESCRIBE.OHCOINRANDOM = "Warly的幸运转盘，随机倍数金币大放送！"
    STRINGS.CHARACTERS.WILLOW.DESCRIBE.OHCOINRANDOM = "海盗Willow的随机宝藏，每一次都是新发现！"
    STRINGS.CHARACTERS.WAXWELL.DESCRIBE.OHCOINRANDOM = "随机倍数的叮铃声，Waxwell的幸运旋律！"
    STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.OHCOINRANDOM = "随机倍数币，Wickerbottom探索未知的钥匙！"
    STRINGS.CHARACTERS.WX78.DESCRIBE.OHCOINRANDOM = "废弃之地的奇迹，WX-78的随机倍数宝藏！"
    STRINGS.CHARACTERS.WENDY.DESCRIBE.OHCOINRANDOM = "无赖Wendy的翻身机会，随机倍数改变命运！"
    STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.OHCOINRANDOM = "前辈们的随机战利品，荣耀与惊喜并存！"
    STRINGS.CHARACTERS.WORTOX.DESCRIBE.OHCOINRANDOM = "随机倍数币，连海盗的灵魂也为之舞动！"
    STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.OHCOINRANDOM = "随机倍数，不是食物，但Wormwood也充满期待！"
    STRINGS.CHARACTERS.WANDA.DESCRIBE.OHCOINRANDOM = "Wanda的幸运抽签，随机倍数带来无限可能！"
    STRINGS.CHARACTERS.WINONA.DESCRIBE.OHCOINRANDOM = "Winona的随机报酬，每一次都是新收获！"
    STRINGS.CHARACTERS.WALTER.DESCRIBE.OHCOINRANDOM = "噢！这不是巧克力，但这是随机的快乐源泉！"
    STRINGS.CHARACTERS.WEBBER.DESCRIBE.OHCOINRANDOM = "随机倍数的闪亮金币，Webber的宝藏奇遇！"
    STRINGS.CHARACTERS.WURT.DESCRIBE.OHCOINRANDOM = "Wurt的幸运随机硬币，每一次闪耀都是惊喜！"

    STRINGS.CHARACTERS.WOODIE.DESCRIBE.SLOTMACHINE = "北方精神指引着我的命运。"
    STRINGS.CHARACTERS.WX78.DESCRIBE.SLOTMACHINE = "金属多巴胺分配器"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SLOTMACHINE = "沃尔夫冈是个赌徒！"
    STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SLOTMACHINE = "我打赌，结果是要看运气的。"
    STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SLOTMACHINE = "不可否认，我有玩弄命运的嗜好。"
    STRINGS.CHARACTERS.WENDY.DESCRIBE.SLOTMACHINE = "啊，这似乎是合理的命运测试。"
    STRINGS.CHARACTERS.WARLY.DESCRIBE.SLOTMACHINE = "也许我可以赢点好吃的？"
    STRINGS.CHARACTERS.WILLOW.DESCRIBE.SLOTMACHINE = "这好像是在浪费时间。"
    STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SLOTMACHINE = "决定命运悲喜的机器。"
    STRINGS.CHARACTERS.WEBBER.DESCRIBE.SLOTMACHINE = "我想我还不到玩这个的年龄。"
    STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.SLOTMACHINE = "幸运盒子"
    STRINGS.CHARACTERS.WINONA.DESCRIBE.SLOTMACHINE = "快点，妈妈需要一副新的工作手套！"
    STRINGS.CHARACTERS.WANDA.DESCRIBE.SLOTMACHINE = "如果我每次得到不好的东西都让时间倒流，这算不算作弊？"
    STRINGS.CHARACTERS.WORTOX.DESCRIBE.SLOTMACHINE = "谁能抵挡如此的命运考验？"
    STRINGS.CHARACTERS.WALTER.DESCRIBE.SLOTMACHINE = "是的，对于这个来说我还太年轻了。"
    STRINGS.CHARACTERS.WURT.DESCRIBE.SLOTMACHINE = "我能赢到一条鱼吗？"
end

STRINGS.SLOTMACHINE_ANNOUNCE_TEXT = {
    -- 通用摇奖次数文本
    USER_ROLLS = "已经摇了",
    USER_ACHIEVEMENT = "次老虎机，真是摇奖小达人，连查理姐姐都得说声佩服！",
    MACHINE_ROLLS = "在这台老虎机上已经摇了",
    MACHINE_ACHIEVEMENT = "次，连饥荒世界的幸存者都得来学学这份坚持！",

    -- 特定摇奖次数的公告文本
    USER_50 = "刚刚完成了第50次摇奖，他们还能继续摇多少次呢？饥荒世界里可没有这么容易的食物来源哦！",
    USER_100 = "已经摇了100次老虎机了，他们绝对不是上瘾了，对吧？更像是饥荒中的探险家在寻找宝藏！",
    USER_200 = "已经完成了200次摇奖，也许有人该去劝劝他们了！不过在饥荒世界里，这份坚持或许能换来一顿大餐！",
    USER_500 = "已经摇了500次老虎机了，如果你现在安全的话，就眨眨眼吧！饥荒中的探险家也得休息啊！",
    USER_1000 = "已经达成了1000次摇奖的壮举，这简直是摇奖界的传奇啊！连饥荒世界的Boss都得来祝贺！",
    USER_2000 = "已经摇了2000次老虎机了，这绝对是摇奖界的超级巨星，饥荒世界里的幸存者都得来学习这份毅力！",
    USER_5000 = "摇奖5000次！这不仅是坚持，更是对老虎机的深沉热爱！饥荒世界里的摇奖大师，非你莫属！",
    USER_10000 = "10000次摇奖！他们与老虎机之间，定有着不解之缘！饥荒世界的摇奖传奇，你当之无愧！",
    USER_20000 = "20000次！这摇奖的次数，简直可以绕饥荒世界一圈了！摇奖大师的称号，非你莫属！",
    USER_50000 = "50000次摇奖！这不仅是毅力，更是对摇奖的极致追求！饥荒世界的摇奖之神，你当之无愧！",
    USER_100000 = "难以置信！100000次摇奖！你已成为饥荒摇奖界的传说，无人能敌！",

    -- 老虎机相关文本
    SHOULD_CLEAN_UP = "哎呀，这周围是不是太乱了？我得赶紧清理一下，不然查理姐姐都要以为我这里是饥荒里的垃圾场了！",
    GETTING_MESSY = "看来我得注意点，别让这老虎机周围变成饥荒里的‘宝藏堆’，虽然都是宝贝，但也得有个序啊！",
    REALLY_SHOULD_CLEAN = "天哪，我得放慢脚步，把这周围打扫得干干净净。毕竟，连老虎机都喜欢整洁的环境，不是吗？",
    TOO_MANY_ITEMS = "哎呀，这老虎机周围的东西太多了，我得赶紧清理干净。不然，下次抽奖时老虎机该说‘我太饱了，吃不下’了！",
    CAN_DO_BETTER = "哼，我还可以做得更好！不能让这周围变成饥荒里的‘杂物博物馆’，我得保持我的领地整洁！",
    STILL_SOME_TO_CLEAN = "哎呀，还有几个小东西没清理，我得赶紧把它们搞定。不然，它们都要开始‘造反’了！",

    SLOT_HUNGRY = "哎呀，老虎机看起来有点‘饿’了，是不是应该给它喂点什么呢？",
    CLEAN_FOR_LUCK = "听说清理干净老虎机周围会带来好运哦！我得试试这个‘饥荒玄学’！",
    TOO_MANY_SNACKS = "哎呀，我放了太多‘零食’在老虎机周围了，它都要被‘撑死’了！",
    LUCKY_SPOT = "这个地方真是个‘幸运之地’！每次清理完都有好运，我得常来！",
    NOT_A_GARAGE = "哎呀，我不是在饥荒里开杂货铺的！得赶紧把这些东西收拾收拾！",
    KEEP_IT_TIDY = "保持整洁，连老虎机都会给你‘点赞’哦！",

    CLEANUP_NOT_ENABLED = "糟糕！没有开启清理模式，我可不是扫地机器人！",
    NEED_A_SWEEPER = "哎呀，我需要在附近建一个自动扫地老虎机来帮我扫地，不然我可要累死了！",
    MATURE_SLOTMACHINE = "哈哈，你已经是个成熟的老虎机了，要学会自己打扫哦！",
    CLEANUP_IN_PROGRESS = "清理模式启动！看我把这些都扫得干干净净！",

    NORMAL_BASE_TEMPLATE = "【%s】从老虎机中抽到了【%s】",
    WLDH_FORMULA_WIN_TEMPLATE = "恭喜【%s】从神秘的老虎机中抽中了传说中的【%s】配方！看来你的冒险之路又要增添一抹神秘色彩了~",
    FG_BLUEPRINT_WIN_TEMPLATE = "哇哦！【%s】在老虎机的咔嚓声中获得了珍贵的【%s】蓝图！建筑大师之路，由此开始！",
    DEBUFF_TRIGGERED_TEMPLATE = "哎呀！【%s】在抽奖时竟然触发了【%s】效果！看来运气这东西，真是让人又爱又恨啊~",
    BUFF_TRIGGERED_TEMPLATE = "哇塞！【%s】在老虎机前得到了查理的特别眷顾，获得了【%s】的祝福！真是让人羡慕不已！",
    MAGNIFICATION_TEMPLATE = "【%d倍】",


    MENTAL_STORM = "精神风暴!",
    HUNGER_PANGS = "饥肠辘辘!",
    ONE_BLOOD_WARRIOR = "一血战神!",
    MENTAL_BOOST = "精神!",
    FULL_STOMACH = "饱腹!",
    HEALTH_BOOST = "健康!",

    FULL_MOON_MYTH_FORMULA = "满月神话配方",
    CHARLIE_TEARS_FORMULA = "查理之泪配方",
    LAKE_BEAUTY_FORMULA = "湖中美人配方",
    OVERLORD_CROWN_FORMULA = "霸王桂冠配方",
    EARTHQUAKE_CAKE_FORMULA = "地震蛋糕配方",
    MUSOU_COOKIE_FORMULA = "无双曲奇配方",

    TALLBIRD_NEST_BLUEPRINT = "高脚鸟巢蓝图",
    HOUND_MOUND_BLUEPRINT = "猎犬丘蓝图",
    CAT_COONDEN_BLUEPRINT = "空心树桩蓝图",
    SLURTLE_HOLE_BLUEPRINT = "蛞蝓龟窝蓝图",
    WOBSTER_DEN_BLUEPRINT = "龙虾窝蓝图",
    MOONGLASS_WOBSTER_DEN_BLUEPRINT = "月光龙虾窝蓝图",
    MONKEY_BARREL_BLUEPRINT = "穴居猴桶蓝图",
    ROOT_TREASURE_CHEST_BLUEPRINT = "根箱蓝图",
    ANCIENT_ALTAR_BLUEPRINT = "远古伪科学站蓝图",
    OPAL_PRECIOUS_AMULET_BLUEPRINT = "彩虹护符蓝图",

    MOOSE_GOOSE = "麋鹿鹅",
    TWIN_OF_TERROR = "恐怖双子",
    INK_BLIGHT = "莫荒三基",
    STALKER_FOREST = "森林守护者",
    RABID_KLAUS = "狂暴克劳斯",
    SHADOW_TRIWIZARD = "暗影三基佬",
    ALTERGUARDIAN_PHASE1 = "天体英雄.一阶段",
    ALTERGUARDIAN_PHASE2 = "天体英雄.二阶段",
    ALTERGUARDIAN_PHASE3 = "天体英雄.三阶段",

}

STRINGS.SLOTMACHINE_OTHER_TEXT = {
    COUNT_COMMOND_PRETTY_NAME = "老虎机摇奖次数",
    COUNT_COMMOND_DESC = "揭晓你至今为止在老虎机上摇了多少次奖，看看你的手气有多旺！",
    COUNT_COMMOND_SAY1 = "哈哈，你已经在老虎机上摇了",
    COUNT_COMMOND_SAY2 = "次奖啦，真是摇奖小能手！",
    SLOTMACHINE_INSPECT_DESCRIPTION = "\n这台老虎机已经被虐待了 %.0f 次！看来它真是个‘幸运儿’呢~",
    DECAY_DESCRIPTION = "\n注意啦！这个宝贝还有%.0f秒就要消失啦~ 赶快行动吧！",
    DUBLOON_DROP_RATE = "\n掉金币概率：%s ！",
    CANNOT_DECONSTRUCT = "哎呀，我可不能对这玩意儿动手！它似乎比我还要倔强呢！"
}
