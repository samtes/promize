# Set git user and email
git config --global user.name $GIT_USER
git config --global user.email $GIT_EMAIL

# add id_rsa.pub
mkdir "$HOME/.ssh"
touch "$HOME/.ssh/id_rsa.pub"

# add key to id_rsa.pub
echo "$SSH_KEY" > "$HOME/.ssh/id_rsa.pub"

# release and publish
npm run release
npm run publish
