local STRINGS = GLOBAL.STRINGS
local nm = STRINGS.NAMES
local rec = STRINGS.RECIPE_DESC
local gen_desc = STRINGS.CHARACTERS.GENERIC.DESCRIBE

-- Crafting Filters  
STRINGS.UI.CRAFTING_FILTERS.DUBLOONREFINE = "Slot Machine"
STRINGS.UI.CRAFTING_FILTERS.DUBLOONSHOP = "Dubloon Shop"

-- Slot Machine  
nm.SLOTMACHINE = "Mystical Slot Machine"
rec.SLOTMACHINE = "Nine out of ten things you can't go wrong with. This is the tenth."
gen_desc.SLOTMACHINE = "I think I can stay a while longer, or maybe two."

-- Dubloon  
nm.DUBLOON = "Dubloon"
rec.DUBLOON = "A necessity for gambling? Perhaps!"
gen_desc.DUBLOON = "Look at that Dubloon shining, it's hard to look away!"

-- 10x Coin  
nm.OHCOIN10 = "10x Coin"
rec.OHCOIN10 = "Tenfold rewards, accompanied by tenfold risks!"
gen_desc.OHCOIN10 = "High risk, high reward, that's the true art of gambling!"

-- Random Coin  
nm.OHCOINRANDOM = "Random Coin"
rec.OHCOINRANDOM = "Reward multiplier unknown, come try your luck!"
gen_desc.OHCOINRANDOM = "The right way to gamble? With this mysterious Random Coin, of course!"

-- Generating descriptions for stacks of Dubloons  
local dubloonrefine = require "dubloonrefinetable"
for _, data in ipairs(dubloonrefine) do
    if data.qty and data.qty > 1 then
        nm["DUBLOON_"..string.upper(data.item)] = "Dubloon Hill (x"..data.qty..")"
    end
end

-- Gold Nugget  
rec.GOLDNUGGET = "Gold! Shiny gold! Strike it rich!"

-- Non-craftable Item Descriptions  
rec.TRINKET_25 = "Three skulls from the slot machine? This is a bit eerie, use at your own risk!"
rec.TRINKET_26 = "Wow! Three gold nuggets from the slot machine! What luck!"
rec.TENTACLESPIKE = "Slimy and spiky? Definitely a sea monster's masterpiece!"
rec.TOWNPORTALTALISMAN = "Go wherever you want, this teleportation talisman fulfills all your travel dreams!"
rec.FIREFLIES = "Fairies of the darkness, they'll bring you light!"
rec.HONEYCOMB = "Buzz buzz, I'm a beehive full of sweet honey!"
rec.JELLYBEAN = "Sweet and chewy, satisfying your sweet tooth and replenishing your energy!"
rec.FOSSIL_PIECE = "Wow, fossil fragments! See if you can piece them together into a complete ancient creature!"
rec.SLURTLEHAT = "Top-notch shell protection! Wear this hat, and you're the coolest explorer around!"
rec.ARMORSNURTLESHELL = "Hide in your shell when faced with a problem? That's a clever solution!"
rec.OPALSTAFF = "Summon a little moon? This staff is truly magical!"
rec.HIVEHAT = "Wear this hat and feel like a queen! Just watch out for bee stings."
rec.SKELETONHAT = "Harness the power of nightmares? This hat is a bit scary indeed!"
rec.KRAMPUS_SACK = "How did this get here? Could it be Krampus' prank?"
rec.HALLOWEENPOTION_MOON = "Drink this potion, and feel something brewing inside you!"
rec.LIVINGTREE_ROOT = "This sapling looks a bit creepy, but perhaps it can grow into something magical!"
rec.HALLOWEENPOTION_HEALTH_SMALL = "A small bottle with big benefits for your heart! A secret to health."
rec.HALLOWEENPOTION_SANITY_SMALL = "Your mind needs comfort? This small potion is your soul soup!"
rec.HALLOWEENPOTION_HEALTH_LARGE = "A large bottle of health potion! Strengthen your heart!"
rec.HALLOWEENPOTION_SANITY_LARGE = "More comfort, more mind healing! This large potion will lift your spirits!"
rec.CUTLESS = "Don't judge by its appearance, it can come in handy when needed! If it works, it works!"
rec.OAR_MONKEY = "This oar is not just for rowing, but also for dealing with enemies! Truly versatile!"
rec.STASH_MAP = "Buried treasure? This map will help you find it! Embark on a treasure hunt!"
rec.PIG_COIN = "Heads or tails? This piggy coin is a symbol of good luck!"

-- IA Item Descriptions
if TUNING.SLOTMACHINE_MODCONFIGDATA["workshop-1467214795".."_enable"] then
    rec.NEEDLESPEAR = "Sharp and fragile, be careful not to hurt yourself when using it!"
    rec.BLOWDART_FLUP = "Aim for the eye! This blowdart is a hunter's best friend!"
    rec.BIOLUMINESCENCE = "Wow, what a beautiful light! This bioluminescence is truly amazing!"
    rec.IA_MESSAGEBOTTLE = "East? I thought you said West! The message in this bottle is really confusing!"
    rec.IA_TRIDENT = "Most effective in Poseidon's kingdom? This trident certainly looks like it belongs to a sea god!"
    rec.HARPOON = "Take down your biggest foes! This harpoon is a formidable weapon!"
    rec.SUNKEN_BOAT_TRINKET_4 = "I have so many sights to show you. This sunken treasure trove hides countless secrets!"
    rec.PIRATEPACK = "Trade your thoughts for a dubloon? This pirate backpack is a magical treasure indeed!"
    rec.DOYDOYEGG = "Back from extinction! This dodo egg is a precious life form!"
else
    -- When IA is not enabled
    STRINGS.CHARACTERS.WOODIE.DESCRIBE.DUBLOON = "I found gold!"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.DUBLOON = "Wolfgang's powerful jaws have left dents on it!"
    STRINGS.CHARACTERS.WARLY.DESCRIBE.DUBLOON = "Golden ham, golden honey, golden coin."
    STRINGS.CHARACTERS.WILLOW.DESCRIBE.DUBLOON = "Pirate money!"
    STRINGS.CHARACTERS.WAXWELL.DESCRIBE.DUBLOON = "The tinkling sound they make when they collide is satisfying."
    STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.DUBLOON = "Aha! The currency used by pirates."
    STRINGS.CHARACTERS.WX78.DESCRIBE.DUBLOON = "A currency no longer in use."
    STRINGS.CHARACTERS.WENDY.DESCRIBE.DUBLOON = "The currency of rogues."
    STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.DUBLOON = "The spoils left by our ancestors!"
    STRINGS.CHARACTERS.WORTOX.DESCRIBE.DUBLOON = "Even pirate money has no soul."
    STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.DUBLOON = "Something to eat? No."
    STRINGS.CHARACTERS.WANDA.DESCRIBE.DUBLOON = "I'll keep one in my pocket for good luck."
    STRINGS.CHARACTERS.WINONA.DESCRIBE.DUBLOON = "Not much, but at least I got paid."
    STRINGS.CHARACTERS.WALTER.DESCRIBE.DUBLOON = "Oh... I guess this isn't chocolate after all."
    STRINGS.CHARACTERS.WEBBER.DESCRIBE.DUBLOON = "Shiny gold coin!"
    STRINGS.CHARACTERS.WURT.DESCRIBE.DUBLOON = "Shiny coin!"

    STRINGS.CHARACTERS.GENERIC.DESCRIBE.OHCOIN10 = "10x Coin, tenfold luck, ready to strike!"
    STRINGS.CHARACTERS.WOODIE.DESCRIBE.OHCOIN10 = "Tenfold gold in hand, Woodie's wealth dreams come true!"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.OHCOIN10 = "Wolfgang's battle cry paired with a 10x Coin, unbeatable!"
    STRINGS.CHARACTERS.WARLY.DESCRIBE.OHCOIN10 = "Golden ham and a 10x Coin, Warly's lucky recipe!"
    STRINGS.CHARACTERS.WILLOW.DESCRIBE.OHCOIN10 = "Pirate Willow's treasure, the 10x Coin shines bright!"
    STRINGS.CHARACTERS.WAXWELL.DESCRIBE.OHCOIN10 = "The tinkling sound of the 10x Coin, Waxwell's lucky melody!"
    STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.OHCOIN10 = "The 10x Coin, Wickerbottom's key to unlocking luck!"
    STRINGS.CHARACTERS.WX78.DESCRIBE.OHCOIN10 = "Even in the ruins, the 10x Coin is WX-78's treasure!"
    STRINGS.CHARACTERS.WENDY.DESCRIBE.OHCOIN10 = "Lucky day for rogue Wendy, the 10x Coin turns things around!"
    STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.OHCOIN10 = "The spoils of our ancestors, the 10x Coin carries on the glory!"
    STRINGS.CHARACTERS.WORTOX.DESCRIBE.OHCOIN10 = "The 10x Coin, even pirate souls tremble at its sight!"
    STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.OHCOIN10 = "The 10x Coin, not food, but Wormwood can't resist it!"
    STRINGS.CHARACTERS.WANDA.DESCRIBE.OHCOIN10 = "Wanda's lucky pocket essential, the 10x Coin!"
    STRINGS.CHARACTERS.WINONA.DESCRIBE.OHCOIN10 = "Winona's payday upgrade, the 10x Coin brings a bountiful harvest!"
    STRINGS.CHARACTERS.WALTER.DESCRIBE.OHCOIN10 = "Oh! Not chocolate, but tenfold joy!"
    STRINGS.CHARACTERS.WEBBER.DESCRIBE.OHCOIN10 = "Shiny 10x Coin, Webber's treasure light!"
    STRINGS.CHARACTERS.WURT.DESCRIBE.OHCOIN10 = "Wurt's lucky coin, tenfold shine, unmatched!"

    STRINGS.CHARACTERS.GENERIC.DESCRIBE.OHCOINRANDOM = "OHCOINRANDOM, random multiplier, luck with no limits!"
    STRINGS.CHARACTERS.WOODIE.DESCRIBE.OHCOINRANDOM = "Random multiplier, every draw by Woodie is a surprise!"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.OHCOINRANDOM = "Wolfgang roars, the random multiplier brings endless challenges!"
    STRINGS.CHARACTERS.WARLY.DESCRIBE.OHCOINRANDOM = "Warly's lucky wheel, random multiplier coins galore!"
    STRINGS.CHARACTERS.WILLOW.DESCRIBE.OHCOINRANDOM = "Pirate Willow's random treasure, a new discovery every time!"
    STRINGS.CHARACTERS.WAXWELL.DESCRIBE.OHCOINRANDOM = "The tinkling sound of the random multiplier, Waxwell's lucky tune!"
    STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.OHCOINRANDOM = "Random multiplier coin, Wickerbottom's key to exploring the unknown!"
    STRINGS.CHARACTERS.WX78.DESCRIBE.OHCOINRANDOM = "A miracle in the ruins, WX-78's random multiplier treasure!"
    STRINGS.CHARACTERS.WENDY.DESCRIBE.OHCOINRANDOM = "Rogue Wendy's chance to turn things around, the random multiplier changes fate!"
    STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.OHCOINRANDOM = "The random spoils of our ancestors, glory and surprises coexist!"
    STRINGS.CHARACTERS.WORTOX.DESCRIBE.OHCOINRANDOM = "The random multiplier coin, even pirate souls dance to its tune!"
    STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.OHCOINRANDOM = "Random multiplier, not food, but Wormwood anticipates it eagerly!"
    STRINGS.CHARACTERS.WANDA.DESCRIBE.OHCOINRANDOM = "Wanda's lucky draw, the random multiplier brings endless possibilities!"
    STRINGS.CHARACTERS.WINONA.DESCRIBE.OHCOINRANDOM = "Winona's random payday, a new harvest every time!"
    STRINGS.CHARACTERS.WALTER.DESCRIBE.OHCOINRANDOM = "Oh! Not chocolate, but a random source of joy!"
    STRINGS.CHARACTERS.WEBBER.DESCRIBE.OHCOINRANDOM = "Shiny random multiplier coin, Webber's treasure adventure!"
    STRINGS.CHARACTERS.WURT.DESCRIBE.OHCOINRANDOM = "Wurt's lucky random coin, every shine is a surprise!"

    -- Slot Machine Descriptions
    STRINGS.CHARACTERS.WOODIE.DESCRIBE.SLOTMACHINE = "The spirit of the north guides my fate."
    STRINGS.CHARACTERS.WX78.DESCRIBE.SLOTMACHINE = "Metal dopamine dispenser"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SLOTMACHINE = "Wolfgang is a gambler!"
    STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SLOTMACHINE = "I'd wager the outcome is up to chance."
    STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SLOTMACHINE = "I cannot deny my penchant for toying with fate."
    STRINGS.CHARACTERS.WENDY.DESCRIBE.SLOTMACHINE = "Ah, this seems a reasonable test of fate."
    STRINGS.CHARACTERS.WARLY.DESCRIBE.SLOTMACHINE = "Perhaps I can win some tasty treats?"
    STRINGS.CHARACTERS.WILLOW.DESCRIBE.SLOTMACHINE = "This seems like a waste of time."
    STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SLOTMACHINE = "A machine that decides the joys and sorrows of fate."
    STRINGS.CHARACTERS.WEBBER.DESCRIBE.SLOTMACHINE = "I don't think I'm old enough for this."
    STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.SLOTMACHINE = "A box of luck"
    STRINGS.CHARACTERS.WINONA.DESCRIBE.SLOTMACHINE = "Hurry up, Momma needs a new pair of work gloves!"
    STRINGS.CHARACTERS.WANDA.DESCRIBE.SLOTMACHINE = "Would it be cheating if I rewind time every time I get something bad?"
    STRINGS.CHARACTERS.WORTOX.DESCRIBE.SLOTMACHINE = "Who can resist such a test of fate?"
    STRINGS.CHARACTERS.WALTER.DESCRIBE.SLOTMACHINE = "Yeah, I'm probably too young for this."
    STRINGS.CHARACTERS.WURT.DESCRIBE.SLOTMACHINE = "Can I win a fish?"
end

STRINGS.SLOTMACHINE_ANNOUNCE_TEXT = {
    -- General roll announcements
    USER_ROLLS = "Has rolled",
    USER_ACHIEVEMENT = "times on the slot machine! Truly a master of the spin, even Charlie would be impressed!",
    MACHINE_ROLLS = "Has spun the reels on this slot machine",
    MACHINE_ACHIEVEMENT = "times. Even survivors in the world of Don't Starve could learn from this dedication!",

    -- Specific roll count announcements
    USER_50 = "Just completed their 50th spin! How many more can they go? Food doesn't grow on trees in Don't Starve!",
    USER_100 = "Has hit the jackpot 100 times on the slot machine! They can't be addicted, can they? More like an explorer seeking treasure!",
    USER_200 = "Reached 200 spins! Someone might need to intervene! But in Don't Starve, this kind of persistence could lead to a feast!",
    USER_500 = "500 spins down! If you're still alive, blink twice! Even explorers in Don't Starve need rest!",
    USER_1000 = "Achieved 1000 spins, a legend in the world of slot spinning! Even the bosses of Don't Starve would congratulate them!",
    USER_2000 = "Reached 2000 spins, a superstar in the slot spinning world! Survivors in Don't Starve should learn from this perseverance!",
    USER_5000 = "5000 spins! This is not just persistence, but a deep love for the slot machine! Master of spins in Don't Starve!",
    USER_10000 = "10,000 spins! They and the slot machine share an unbreakable bond! The undisputed legend of spinning in Don't Starve!",
    USER_20000 = "20,000 spins! That's enough to circle the world of Don't Starve! Master Spinner, you have earned your title!",
    USER_50000 = "50,000 spins! This is not just dedication, but the ultimate pursuit of spinning! The God of Spins in Don't Starve!",
    USER_100000 = "Unbelievable! 100,000 spins! You are the stuff of legends in the world of Don't Starve slot spinning!",

    -- Slot machine-related texts
    SHOULD_CLEAN_UP = "Ugh, this place is getting messy! I better clean up before Charlie thinks I'm running a junkyard in Don't Starve!",
    GETTING_MESSY = "I need to be careful, don't want this slot machine area turning into a 'treasure hoard' in Don't Starve. Order is key!",
    REALLY_SHOULD_CLEAN = "Goodness, I must slow down and clean this up. Even slot machines prefer a tidy environment, don't they?",
    TOO_MANY_ITEMS = "Oh dear, too many things around the slot machine. I must clean up before it says, 'I'm full, can't eat any more'!",
    CAN_DO_BETTER = "Hmph, I can do better than this! I won't let this area become a 'clutter museum' in Don't Starve. I need order!",
    STILL_SOME_TO_CLEAN = "Oops, a few stragglers left. Better tidy them up before they start a rebellion!",

    SLOT_HUNGRY = "Hmm, the slot machine looks a bit 'hungry.' Should I feed it something?",
    CLEAN_FOR_LUCK = "I heard cleaning up around the slot machine brings good luck! I'll try this 'Don't Starve superstition'!",
    TOO_MANY_SNACKS = "Oh no, I've left too many 'snacks' around the slot machine! It's going to burst!",
    LUCKY_SPOT = "This place is truly a 'lucky spot'! Every time I clean up, good fortune follows. I must come often!",
    NOT_A_GARAGE = "Hey, I'm not running a junkyard in Don't Starve! Time to tidy up!",
    KEEP_IT_TIDY = "Keep it clean, and even the slot machine will give you a 'thumbs up'!",

    CLEANUP_NOT_ENABLED = "Oops! Cleanup mode isn't enabled. I'm no robot vacuum cleaner!",
    NEED_A_SWEEPER = "Ugh, I need an automated slot machine sweeper nearby or I'll wear myself out!",
    MATURE_SLOTMACHINE = "Haha, you're a grown-up slot machine now, learn to clean up after yourself!",
    CLEANUP_IN_PROGRESS = "Cleanup mode activated! Watch me sweep this place spotless!",

    NORMAL_BASE_TEMPLATE = "[%s] drew [%s] from the slot machine",
    WLDH_FORMULA_WIN_TEMPLATE = "Congratulations, [%s] has drawn the legendary [%s] recipe from the mysterious slot machine! Your adventure just got more mystical~",
    FG_BLUEPRINT_WIN_TEMPLATE = "Wow! [%s] obtained the precious [%s] blueprint from the slot machine's clunk! The path to becoming a master builder begins here!",
    DEBUFF_TRIGGERED_TEMPLATE = "Oops! [%s] triggered the [%s] effect while spinning! Luck, you're such a love-hate relationship~",
    BUFF_TRIGGERED_TEMPLATE = "Wowza! [%s] received Charlie's special blessing with [%s]! Truly enviable!",
    MAGNIFICATION_TEMPLATE = "[%dx]",

    MENTAL_STORM = "Mental Storm!",
    HUNGER_PANGS = "Hunger Pangs!",
    ONE_BLOOD_WARRIOR = "One-Blood Warrior!",
    MENTAL_BOOST = "Mental Boost!",
    FULL_STOMACH = "Full Stomach!",
    HEALTH_BOOST = "Health Boost!",

    FULL_MOON_MYTH_FORMULA = "Full Moon Myth Recipe",
    CHARLIE_TEARS_FORMULA = "Charlie's Tears Recipe",
    LAKE_BEAUTY_FORMULA = "Lake Beauty Recipe",
    OVERLORD_CROWN_FORMULA = "Overlord Crown Recipe",
    EARTHQUAKE_CAKE_FORMULA = "Earthquake Cake Recipe",
    MUSOU_COOKIE_FORMULA = "Musou Cookie Recipe",

    TALLBIRD_NEST_BLUEPRINT = "Tallbird Nest Blueprint",
    HOUND_MOUND_BLUEPRINT = "Hound Mound Blueprint",
    CAT_COONDEN_BLUEPRINT = "Catcoon Den Blueprint",
    SLURTLE_HOLE_BLUEPRINT = "Slurtle Hole Blueprint",
    WOBSTER_DEN_BLUEPRINT = "Wobster Den Blueprint",
    MOONGLASS_WOBSTER_DEN_BLUEPRINT = "Moonglass Wobster Den Blueprint",
    MONKEY_BARREL_BLUEPRINT = "Monkey Barrel Blueprint",
    ROOT_TREASURE_CHEST_BLUEPRINT = "Root Treasure Chest Blueprint",
    ANCIENT_ALTAR_BLUEPRINT = "Ancient Pseudoscience Station Blueprint",
    OPAL_PRECIOUS_AMULET_BLUEPRINT = "Opal Precious Amulet Blueprint",

    MOOSE_GOOSE = "Moose/Goose",
    TWIN_OF_TERROR = "Terror Twin",
    INK_BLIGHT = "Ink Blight",
    STALKER_FOREST = "Forest Guardian",
    RABID_KLAUS = "Rabid Klaus",
    SHADOW_TRIWIZARD = "Shadow Triwizard",
    ALTERGUARDIAN_PHASE1 = "Ancient Guardian - Phase 1",
    ALTERGUARDIAN_PHASE2 = "Ancient Guardian - Phase 2",
    ALTERGUARDIAN_PHASE3 = "Ancient Guardian - Phase 3",
}

STRINGS.SLOTMACHINE_OTHER_TEXT = {
    COUNT_COMMOND_PRETTY_NAME = "Slot Machine Spins",
    COUNT_COMMOND_DESC = "Reveal how many times you've spun the slot machine and see how lucky you've been!",
    COUNT_COMMOND_SAY1 = "Haha, you've already spun the slot machine",
    COUNT_COMMOND_SAY2 = "times! Truly a spinning pro!",
    SLOTMACHINE_INSPECT_DESCRIPTION = "\nThis slot machine has been abused %.0f times! It's a real 'lucky duck'~",
    DECAY_DESCRIPTION = "\nHeads up! This treasure will disappear in %.0f seconds. Act fast!",
    DUBLOON_DROP_RATE = "\nDubloon Drop Rate: %s!",
    CANNOT_DECONSTRUCT = "Alas, I can't lay a hand on this thing! It seems more stubborn than I am!"
}
