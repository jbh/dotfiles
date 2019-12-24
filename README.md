# Arch Dotfiles

These dotfiles are for Arch Linux

- Personal scripts are in `~/.local/bin`
- Settings for:
  - vim (text editor)
  - bspwm (window manager)
  - polybar (status bar)
  - sxhkd (hotkey manager)
  - dunst (notifier)
  - picom (compositor)
  - bash (shell)

### Features

**VPN Status/dmenu**

This feature only supports openfortivpn at the moment, because that's
all I currently use. More will be added as I use them.

The `dmenu_vpns` script looks at `.config/openfortivpn` for config
files and lists them as options. This menu is bound to `super + v`.
If you select one, it will connect to the VPN in an st terminal
with the class `st-vpn` and a relevant title. This class is used
in the bspwmrc to send the terminal to the #10 desktop, VPN.

The `vpninfo` script is used as a custom script by polybar to output
the currently connected VPNs to a polybar module. This is convenient.
These two combined have reduced the necessity of nm-applet for me, so
I no longer have nm-applet installed.

**Config dmenu**

The `dmenu_configs` script will open a menu that lists config files.
This menu is bound to `super + e`. The selected config file will be
opened in vim in an st terminal that has the class of
`st-config-dotfile` and a relevant title. The class is used in the
bspwmrc to send the terminal to the #8 desktop, CNF.

These menu items are made manually. You'll have to add the config
files you want to add to this menu by editing the script.

**PhpStorm dmenu**

The `dmenu_phpstorm` script will traverse through the `Sites`
directory, which is what I maintain as my PhpStorm project
directory. You can edit the script to fit your needs.

As you traverse the directories, you can open a directory, which
will open it in PhpStorm. If you select a file, it will open that
file in vim for quick editing.

> WARNING: This script was made on a whim and is probably buggy.
Will evolve.

**calcurse dmenu**

The `dmenu_calcurse` script will look in `~/.config` and grep
for `calcurse`. These config folders are then listed in dmenu.
This menu is bound to `super + alt + c`. If one is selected,
calcurse is launched with that configuration in an st terminal
with the class `st-calcurse`. This class is used in the bspwmrc
to send the terminal to the #3 desktop, TRM.

**cas**

The `cas` script can be used to quickly switch audio sources.
I use it to write keybindings that allow me to quickly switch
between bluetooth and analong speakers.

