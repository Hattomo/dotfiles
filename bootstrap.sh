echo "hello"

# variable setup
dotfiles_dir=~/dotfiles

# remove files
sudo rm -rf ~/.bashrc
sudo rm -rf ~/.tmux.conf
sudo rm -rf ~/.gitconfig
sudo rm -rf ~/.bash_profile
sudo rm -rf ~/.bash_logout


# set symlinks
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/.bash_profile ~/.bash_profile
ln -sf $dotfiles_dir/.bash_logout ~/.bash_logout
ln -sf $dotfiles_dir/.gitconfig ~/.gitconfig

# Codespaces environment check
if [ "$CODESPACES" = "true" ]; then
    echo "Codespaces detected"
else
    cat ssh-agent.sh >> .bashrc
    sh git-setup.sh
fi
