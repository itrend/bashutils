if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -r "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

