#!/bin/bash
primitive_instructions=(
"🔨 Hammer the nail and turn the crank"
"🪚 Saw the plank"
"🛠️ Grease the wheel and chop the wood"
"⚙️ Pull the lever"
"🪢 Tie the knot and stack the bricks"
"🔥 Light the fire"
"🧰 Fix the hinge and dig the hole"
"🛞 Roll the barrel"
"🧹 Sweep the floor"
"⚒️ Stoke the furnace and grind the stone"
"🧱 Bend the rod"
"🪣 Haul the sack and patch the roof"
"🧵 Stitch the seam"
"🌾 Gather the hay and shape the clay"
"🎻 Tune the strings"
"⚒️ Forge the blade and stack the logs"
"🎨 Paint the wall"
"📏 Measure the plank and carve the handle"
"🌱 Plow the field"
"🛢️ Seal the barrel and sharpen the axe"
)

holiday_instructions=(
"🎅 Pack the sleigh and tighten the reins"
"🎁 Wrap the gift and tie the bow"
"🌟 Hang the star and trim the tree"
"❄️ Shape the snowman and fluff the scarf"
"🛷 Wax the sled and smooth the hill"
"🔔 Ring the bells and shine the lights"
"🕯️ Light the candle and hang the wreath"
"🍪 Bake the cookies and pour the milk"
"🌌 Check the list and chart the skies"
"🦌 Feed the reindeer and polish the sleigh"
"🔨 Build the workshop and oil the gears"
"🎶 Sing the carols and tune the harp"
"🍷 Mull the wine and stir the cocoa"
"🍬 Fill the stockings and seal the chimney"
"🎄 String the lights and place the ornaments"
"❄️ Catch the snowflakes and bundle the scarves"
"🎅 Adjust the suit and fluff the beard"
"🍴 Carve the turkey and pass the gravy"
"📜 Check it twice and sign the scroll"
"⛄ Roll the snow and stick the arms"
)

unholiday_instructions=(
"🎒 Unpack the sleigh and loosen the reins"
"⭐ Take down the star and store the tree"
"🧣 Melt the snowman and fold the scarf"
"🛤️ Dismantle the sled and clear the hill"
"🍽️ Eat the cookies and rinse the milk glass"
"🐾 Rest the reindeer and park the sleigh"
"🛠️ Close the workshop and lock the gears"
"🎼 Stop the carols and pack the harp"
"🍷 Finish the wine and clean the mugs"
"🧦 Empty the stockings and seal the chimney"
"📤 Unstring the lights and box the ornaments"
"❌ Break the snowman and store the decorations"
)

# Select a random instruction
random_index=$(( RANDOM % ${#unholiday_instructions[@]} ))
message="${unholiday_instructions[$random_index]}"

git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "$message"