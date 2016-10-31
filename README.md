# mtib dotfiles
## file mappings
| repository  | deployment     |
| :---------- | :------------- |
| i3/i3       | ~/.config/i3/config |
| i3/i3status | ~/.config/i3status/config |
| xinitrc     | ~/.xinitrc |
| xprofile    | ~/.xprofile |
| zprofile    | ~/.zprofile |

## files
### i3/i3
general i3 options

- $mod = Super Key
- workspace 2 -> Firefox
- workspace 8 -> Thunderbird
- workspace 9 -> Discord-Canary
- Mod+Shift+a -> Atom Editor
- Mod+Shift+f -> Firefox
- rofi instead of dmemu_run
- feh --bg ~/.lock.png

## i3/i3status
status bar configuration

- Font Awesome Icons ([fontawesome.io](http://fontawesome.io/))

## xinitrc
.xinitrc file, sources ~/.xprofile starts i3

## xprofile
changes keyboard layout, enables dpms (610s) and screen lock (10min = 600s)

## zprofile
`exec startx` when logged into zsh on /dev/tty1

## zsh.local
local zsh configuration (variables and shortcuts)

| var/func        | description |
| :-------------- | :------------- |
| GOPATH          | env |
| PATH += GOPATH  | env |
| gitaur          | git clone from aur.archlinux.org |

## other configuration
### cron
```crontab
# user: root
#m  h   day mon dow cmd
@reboot illum-d &

# user: mtib
#m  h   day mon dow cmd
```

#### illum-d
changes screen brightness

## todo
- [ ] script option to `ln` instead of `cp`
