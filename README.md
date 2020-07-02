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

### Source Control/Installation Methodology

See Anand Iyer's
[article](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html).

### Features

**Polybar VPN Status/dmenu_vpns**

This feature only supports openfortivpn at the moment, because that's
all I currently use. More will be added as I use them.

The `dmenu_vpns` script looks at `.config/openfortivpn` and
`.config/openconnect` for config files and lists them as options.
This menu is bound to `super + v`. If you select one, it will
connect to the VPN in an st terminal with the class `st-vpn` and
a relevant title. This class is used in the bspwmrc to send the
terminal to the #10 desktop, VPN.

The `vpninfo` script is used as a custom script by polybar to output
the currently connected VPNs to a polybar module. This is convenient.
These two combined have reduced the necessity of nm-applet for me, so
I no longer have nm-applet installed.

> When creating normal openconnect config files, passwd and host
are not options. However, for my scripts to work properly, they
require passwd and host options. These options are read then
used for openconnect.

**dmenu_resblu**

This menu uses the resblu script to reset bluetooth devices. The
motivation for this script and its dmenu arose from issues due
to dual booting Windows and Arch Linux. For some reason, when I
return to Arch Linux from Windows, my bluetooth devices no longer
connect, and I have to remove/trust/pair/connect them each time.

`dmenu_resblu` requires that `~/.config/bluetooth/addresses.txt`
be defined. See the example in this repo. The `<device-id>`
is the MAC Address of the bluetooth device found in bluetoothctl
during scan. `dmenu_resblu` parses this file, presents each
bluetooth device as an option in dmenu, and will run resblu
for the one you select. `resblu` will then reset that bluetooth
device. Be sure the bluetooth device is ready to pair before
trying to reset.

**dmenu_tmux**

Opens a dmenu of existing tmux sessions. If you select a tmux
session **that exists and isn't open**, it will open it. If you
select a tmux session **that exists and is open**, it will focus
it. If you type a **new session name and press `shift+enter`**,
it will open a new tmux session.

**dmenu_tizonia**

If tizonia from this menu already exists, focus it. Otherwise,
open a dmenu with manually defined playlists, and open
the selected playlist in tizonia.

**dmenu_configs**

The `dmenu_configs` script will open a menu that lists config files.
This menu is bound to `super + e`. The selected config file will be
opened in vim in an st terminal that has the class of
`st-config-dotfile` and a relevant title. The class is used in the
bspwmrc to send the terminal to the #8 desktop, CNF.

These menu items are made manually. You'll have to add the config
files you want to add to this menu by editing the script.

**dmenu_phpstorm**

The `dmenu_phpstorm` script will traverse through the `Sites`
directory, which is what I maintain as my PhpStorm project
directory. You can edit the script to fit your needs.

As you traverse the directories, you can open a directory, which
will open it in PhpStorm. If you select a file, it will open that
file in vim for quick editing.

> WARNING: This script was made on a whim and is probably buggy.
Will evolve.

**dmenu_calcurse**

The `dmenu_calcurse` script will look in `~/.config/calcurse`
for individual calcurse configs. For example,
`~/.config/calcurse/personal` and `~/.config/calcurse/work`.
These config folders are then listed in dmenu.
This menu is bound to `super + alt + c`. If one is selected,
calcurse is launched with that configuration in an st terminal
with the class `st-calcurse`. This class is used in the bspwmrc
to send the terminal to the #3 desktop, TRM.

**cas**

The `cas` script can be used to quickly change audio sources.
I use it to write keybindings that allow me to quickly switch
between bluetooth and analong speakers. For example,
`super + alt + 1` changes my audio output to analog speakers,
and `super + alt + 2` changes my audio output to bluetooth.

**scs**

The `scs` script simply outputs sxhkd hotkeys with their
comments to fzf, allowing for a quick fuzzy search of hotkeys.
It's basically a cheat sheet for sxhkd hotkeys. The main use
is for popping up a helpful, floating terminal window that can
used to search hotkeys and quickly closed by typing enter. This
is bound to `super + question` (?).

