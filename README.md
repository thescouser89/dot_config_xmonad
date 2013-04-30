Welcome to Dustin's xmonad configuration!
==========================================

Configuration used:
* bashrc
* xinitrc
* Xresources
* xmonad

Programs used:
* xmonad
* dmenu
* dzen2
* custom scripts for dzen2
* redshift
* wicd
* dropbox
* xfce4-power-manager
* okular
* terminator
* firefox

Setup
-----
Create symbolic links for all of the configs provided:

    cd ~
    git clone git://github.com/thescouser89/dot_config_xmonad.git
    ln -s dot_config_xmonad/bashrc .bashrc
    ln -s dot_config_xmonad/xinitrc .xinitrc
    ln -s dot_config_xmonad/Xresources .Xresources
    ln -s dot_config_xmonad/xmonad .xmonad

Running the `startx` command should start everything.
