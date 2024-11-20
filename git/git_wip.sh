#!/bin/bash
instructions=(
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


# Select a random instruction
random_index=$(( RANDOM % ${#instructions[@]} ))
message="${instructions[$random_index]}"

git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "$message"