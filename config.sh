#!/bin/sh

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/pdamoune/config/master/config.sh)"

GITHUB="https://github.com/pdamoune"
CONFIG_REPO="$HOME/Documents/dev/config"
CONFIG_SRC="$GITHUB/dotfiles.git"
DATE=`date '+%Y_%m_%d'`
TIME=`date '+%H:%M:%S'`
BAK=$HOME/.backup/$DATE\_$TIME

###############################################################################
# Save old config                                                             #
# Create repository ~/Documents/dev                                           #
# Clone dotfiles repository into ~/Documents/dev/config                       #
# Link custom config from config folder                                       #
# Launch Oh-my-zsh                                                            #
###############################################################################

###############################################################################
#                                  BACKUP                                     #
###############################################################################
# Create Backup repository and backup the files
mkdir -p $BAK
# Save old .zshrc config
mv $HOME/.zshrc $BAK/.zshrc
# Save old Git config files
mv $HOME/.gitconfig $BAK/.gitconfig
mv $HOME/.gitexcludes $BAK/.gitexcludes
# Save old Vim config file
mv $HOME/.vimrc $BAK/.vimrc
# Create Atom Backup repository
mkdir -p $BAK/.atom
# Save old Atom config files
mv $HOME/.atom/config.cson $BAK/.atom/config.cson
mv $HOME/.atom/github.cson $BAK/.atom/github.cson
mv $HOME/.atom/init.coffee $BAK/.atom/init.coffee
mv $HOME/.atom/keymap.cson $BAK/.atom/keymap.cson
mv $HOME/.atom/package.list $BAK/.atom/package.list
mv $HOME/.atom/snippets.cson $BAK/.atom/snippets.cson
mv $HOME/.atom/styles.less $BAK/.atom/styles.less

# Create DEV repository
mkdir -p $HOME/Documents/dev
mkdir -p $HOME/Documents/dev/projects

# Clone config files or pull if it exist
if [ ! -d $CONFIG_REPO ]; then git clone $REPO_SRC $CONFIG_REPO
else git -C $CONFIG_REPO pull; fi

###############################################################################
#                                   ZSH                                       #
###############################################################################
# Link custom zsh config
ln -s $CONFIG_REPO/dotfiles/zshrc $HOME/.zshrc

###############################################################################
#                                   GIT                                       #
###############################################################################
# Link Git config files
ln -s $CONFIG_REPO/dotfiles/gitconfig $HOME/.gitconfig
ln -s $CONFIG_REPO/dotfiles/gitexcludes $HOME/.gitexcludes

###############################################################################
#                                   VIM                                       #
###############################################################################
# Link Vim config files
ln -s $CONFIG_REPO/dotfiles/vimrc $HOME/.vimrc

###############################################################################
#                                   ATOM                                      #
###############################################################################
# Link Atom config files
ln -s $CONFIG_REPO/dotfiles/atom/config.cson $HOME/.atom/config.cson
ln -s $CONFIG_REPO/dotfiles/atom/github.cson $HOME/.atom/github.cson
ln -s $CONFIG_REPO/dotfiles/atom/init.coffee $HOME/.atom/init.coffee
ln -s $CONFIG_REPO/dotfiles/atom/keymap.cson $HOME/.atom/keymap.cson
ln -s $CONFIG_REPO/dotfiles/atom/package.list $HOME/.atom/package.list
ln -s $CONFIG_REPO/dotfiles/atom/snippets.cson $HOME/.atom/snippets.cson
ln -s $CONFIG_REPO/dotfiles/atom/styles.less $HOME/.atom/styles.less
apm -v foo >/dev/null 2>&1 || { echo >&2 "Atom shell commands required\n\
Check /dotfiles/atom/package.list to install Atom packages \
manually"; exit 1; }
# apm install --packages-file $HOME/.atom/package.list
zsh
