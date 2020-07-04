# Arch Dotfiles

These dotfiles are for Arch Linux

- Personal scripts are in `~/.local/bin`
- Settings for:
  - [vim](https://github.com/jbh/dotfiles/blob/master/.vimrc) (text editor)
  - [bspwm](https://github.com/jbh/dotfiles/blob/master/.config/bspwm/bspwmrc) (window manager)
  - [polybar](https://github.com/jbh/dotfiles/blob/master/.config/polybar/config) (status bar)
  - [sxhkd](https://github.com/jbh/dotfiles/blob/master/.config/sxhkd/sxhkdrc) (hotkey manager)
  - [dunst](https://github.com/jbh/dotfiles/blob/master/.config/dunst/dunstrc) (notifier)
  - [picom](https://github.com/jbh/dotfiles/blob/master/.config/picom/picom.conf) (compositor)
  - [bash](https://github.com/jbh/dotfiles/blob/master/.bashrc) (shell)

### Source Control/Installation Methodology

See Anand Iyer's
[article](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html).

### Features

#### Polybar VPN Status/dmenu_vpns

- [dmenu_vpns](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_vpns)
- [vpninfo](https://github.com/jbh/dotfiles/blob/master/.local/bin/vpninfo)

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

#### dmenu_resblu

- [dmenu_resblu](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_resblu)
- [resblu](https://github.com/jbh/dotfiles#resblu)

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

> `resblu` is very buggy at the moment. Sometimes it doesn't wait
long enough for the device to be discovered, so it fails to connect.
Other times, it'll completely crash the bluetooth service, and
the bluetooth service will have to be manually restarted. Also,
I need to figure out how to know success/fail and use notify-send
to update the user.

#### dmenu_tmux

- [dmenu_tmux](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_tmux)

Opens a dmenu of existing tmux sessions. If you select a tmux
session **that exists and isn't open**, it will open it. If you
select a tmux session **that exists and is open**, it will focus
it. If you type a **new session name and press `shift+enter`**,
it will open a new tmux session.

#### dmenu_tizonia

- [dmenu_tizonia](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_tizonia)
- [example spotify playlists](https://github.com/jbh/dotfiles/blob/master/.config/tizonia/spotify.txt.example)
- [example google music playlists](https://github.com/jbh/dotfiles/blob/master/.config/tizonia/gmusic.txt.example)


If no instance of `st-tizonia` exists, present options for playlists
and open the selected playlist in tizonia with a window class of
`st-tizonia`. If `st-tizonia` already exists, present options to change
playlist or focus `st-tizonia`. If `focus`, simply focus the window
with class `st-tizonia`. If change, present options for playlists
and open the selected playlist in tizonia with a window class of
`st-tizonia`.

#### dmenu_ibmicmd

- [dmenu_ibmicmd](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_ibmicmd)
- [ibmicmd](https://github.com/jbh/dotfiles#ibmicmd)
- [example server](https://github.com/jbh/dotfiles/blob/master/.config/ibmicmd/example)

Opens a dmenu that lists files from `.config/ibmicmd`. These files have a certain
format. Please see [example server](https://github.com/jbh/dotfiles/blob/master/.config/ibmicmd/example).
When one is selected, dmenu will prompt the user for an IBM i command to run. Once a command
has been entered, [stprompt](https://github.com/jbh/dotfiles#stprompt)
will prompt the user for the IBM i password. It will then run `ibmicmd` with the proper options
to run the command on IBM i. A notification of success/failure will be sent with notify-send.

Example flow:

```
dmenu_ibmicmd # Or keyboard shortcut to call it
# Choose server in dmenu
# Enter "STRTCPSVR *SSHD"
# Enter IBM i password
# Wait for notify-send to show success/failure
```

#### dmenu_configs

- [dmenu_configs](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_configs)

The `dmenu_configs` script will open a menu that lists config files.
This menu is bound to `super + e`. The selected config file will be
opened in vim in an st terminal that has the class of
`st-config-dotfile` and a relevant title. The class is used in the
bspwmrc to send the terminal to the #8 desktop, CNF.

These menu items are made manually. You'll have to add the config
files you want to add to this menu by editing the script.

#### dmenu_phpstorm

- [dmenu_phpstorm](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_phpstorm)

The `dmenu_phpstorm` script will traverse through the `Sites`
directory, which is what I maintain as my PhpStorm project
directory. You can edit the script to fit your needs.

As you traverse the directories, you can open a directory, which
will open it in PhpStorm. If you select a file, it will open that
file in vim for quick editing.

> WARNING: This script was made on a whim and is probably buggy.
Will evolve.

#### dmenu_calcurse

- [dmenu_calcurse](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_calcurse)
- [calcurse configs](https://github.com/jbh/dotfiles/tree/master/.config/calcurse)

The `dmenu_calcurse` script will look in `~/.config/calcurse`
for individual calcurse configs. For example,
`~/.config/calcurse/personal` and `~/.config/calcurse/work`.
These config folders are then listed in dmenu.
This menu is bound to `super + alt + c`. If one is selected,
calcurse is launched with that configuration in an st terminal
with the class `st-calcurse`. This class is used in the bspwmrc
to send the terminal to the #3 desktop, TRM.

#### resblu

- [resblu](https://github.com/jbh/dotfiles/blob/master/.local/bin/resblu)

The `resblu` script uses `expect` to script remove/trust/pair/connect
with bluetoothctl. It accepts the MAC Address of a bluetooth device
as the option. It's mostly used in conjuction with `dmenu_resblu`.

#### cas

- [cas](https://github.com/jbh/dotfiles/blob/master/.local/bin/cas)

The `cas` script can be used to quickly change audio sources.
I use it to write keybindings that allow me to quickly switch
between bluetooth and analong speakers. For example,
`super + alt + 1` changes my audio output to analog speakers,
and `super + alt + 2` changes my audio output to bluetooth.

#### scs

- [scs](https://github.com/jbh/dotfiles/blob/master/.local/bin/scs)

The `scs` script simply outputs sxhkd hotkeys with their
comments to fzf, allowing for a quick fuzzy search of hotkeys.
It's basically a cheat sheet for sxhkd hotkeys. The main use
is for popping up a helpful, floating terminal window that can
used to search hotkeys and quickly closed by typing enter. This
is bound to `super + question` (?).

#### ibmicmd

- [ibmicmd](https://github.com/jbh/dotfiles/blob/master/.local/bin/ibmicmd)

> This requires Access Client Solutions be installed. RMTCMD must also be
enabled on IBM i for this to work.

My main career is one that makes me deal with IBM i servers most of the time.
I try to do as much work as I can through SSH and BASH instead of Telnet and
"Green Screen". These days, I mainly only open Green Screen to run trivial commands
like `STRTCPSVR *SSHD`, which will start SSH and allow me to work in my normal
workflow. It's tedious to open Green Screen simply to start SSH and exit.

This is the motivation behind `ibmicmd`, which is a simple script that can
run trivial commands on IBM i. For example:

```bash
ibmicmd -s <ibmi-ip> -u <username> -c "STRTCPSVR *SSHD"
```

It will prompt for a password, run the command, and exit.

#### stprompt

- [stprompt](https://github.com/jbh/dotfiles/blob/master/.local/bin/stprompt)

A simple script that opens a terminal to prompt with hidden text. This is
useful when asking for a user's password. See use in
[dmenu_ibmicmd](https://github.com/jbh/dotfiles/blob/master/.local/bin/dmenu_ibmicmd).
There's a rule in the `bspwmrc` to force this prompt to be floating.

