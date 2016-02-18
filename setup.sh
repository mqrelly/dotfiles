#!/bin/bash

SETUP_FILE=`pwd`/$0
DOTFILES_DIR=$(dirname "$SETUP_FILE")

pushd ~

ln --symbolic --force "$DOTFILES_DIR/hg/hgrc" .hgrc
ln --symbolic --force "$DOTFILES_DIR/git/gitconfig" .gitconfig

ln --symbolic --force "$DOTFILES_DIR/vim/vimrc" .vimrc
rm --force .vim
ln --symbolic "$DOTFILES_DIR/vim/" .vim

rm --force .nvimrc
rm --force .nvim
rm --force .config/nvim
ln --symbolic "$DOTFILES_DIR/nvim/" .config/nvim

ln --symbolic --force "$DOTFILES_DIR/tmux/tmux.conf" .tmux.conf

rm --force .bash
ln --symbolic --force "$DOTFILES_DIR/bash/" .bash
ln --symbolic --force "$DOTFILES_DIR/gemrc" .gemrc

echo "source \"$HOME/.bash/general_config.sh\"" >> .bashrc

popd
