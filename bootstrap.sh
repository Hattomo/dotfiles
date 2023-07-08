# variable setup
dotfiles_dir=~/dotfiles

if "$CODESPACES" == "true"; then
    rm .bash_logout
else
    cat ssh-agent.sh >> .bashrc
    sh git-setup.sh
fi

# remove files
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.bash_profile > /dev/null 2>&1
sudo rm -rf ~/.bash_logout > /dev/null 2>&1

# set symlinks
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/.bash_profile ~/.bash_profile
ln -sf $dotfiles_dir/.bash_logout ~/.bash_logout
ln -sf $dotfiles_dir/.gitconfig ~/.gitconfig
