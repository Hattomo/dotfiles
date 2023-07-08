# variable setup
dotfiles_dir=~/dotfiles

if "$CODESPACES" == "true"; then
    rm .bash_logout
else
    cat ssh-agent.sh >> .bashrc
    sh git-setup.sh
fi

# set symlinks
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/.bash_profile ~/.bash_profile
ln -sf $dotfiles_dir/.bash_logout ~/.bash_logout
ln -sf $dotfiles_dir/.gitconfig ~/.gitconfig
