if "$CODESPACES" == "true"; then
    rm .bash_logout
else
    cat ssh-agent.sh >> .bashrc
    sh git-setup.sh
fi
