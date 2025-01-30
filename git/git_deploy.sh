seasonal_deploy=(
"Deploy ❄️"
"Deploy ⛄"
"Deploy 🌨️"
"Deploy 🛷"
"Deploy 🔥"
"Deploy 🕯️"
"Deploy 🍵"
"Deploy 🌌"
"Deploy 🐾"
"Deploy 🎶"
"Deploy 🍬"
"Deploy 🌱"
"Deploy 📜"
"Deploy 🌟"
"Deploy 💫"
)

# Select a random instruction
random_index=$(( RANDOM % ${#seasonal_deploy[@]} ))
title="${seasonal_deploy[$random_index]}"

gh pr create --base master --title "$title"