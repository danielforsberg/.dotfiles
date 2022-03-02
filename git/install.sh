read -e -p "Enter your name: " NAME
read -e -p "Enter your email: " EMAIL
read -e -p "Enter your github username: " GITHUB_USERNAME

git config --global user.name "$NAME"
git config --global user.email $EMAIL
git config --global github.user $GITHUB_USERNAME

echo "Default git pull to rebase"
git config --global pull.rebase true

echo "Add git aliases"
git config --global alias.cm "commit --amend"
git config --global alias.ci "commit"
git config --global alias.co "checkout"
git config --global alias.st "status"
git config --global alias.br "branch"