from barpyrus import hlwm
from barpyrus import widgets as W
from barpyrus.core import Theme
from barpyrus import lemonbar
from barpyrus import conky
from barpyrus import colors
from barpyrus import trayer

import sys

class Gruv:

    BG0_H = '#1d2021'
    BG0_S = '#32302f'
    BG0 = '#282828'
    BG1 = '#3c3836'
    BG2 = '#504945'
    BG3 = '#665c54'
    BG4 = '#7c6f64'
    FG0 = '#fbf1c7'
    FG1 = '#ebdbb2'
    FG2 = '#d5c4a1'
    FG3 = '#bdae93'
    FG4 = '#a89984'
    FG = FG1
    BG = BG0_H
    RED_DARK = '#cc241d'
    GREEN_DARK = '#98971a'
    YELLOW_DARK = '#d79921'
    BLUE_DARK ='#458588'
    PURPLE_DARK = '#b16286'
    AQUA_DARK = '#689d6a'
    GRAY_DARK = '#a89984'
    ORANGE_DARK = '#d65d0e'
    RED_LIGHT = '#fb4934'
    GREEN_LIGHT = '#b8bb26'
    YELLOW_LIGHT = '#fabd2f'
    BLUE_LIGHT = '#83a598'
    PURPLE_LIGHT = '#d3869b'
    AQUA_LIGHT = '#8ec07c'
    GRAY_LIGHT = '#928374'
    ORANGE_LIGHT = '#fe8019'

ACCENT_COLOR = Gruv.ORANGE_DARK


def main ():
    # set up a connection to herbstluftwm in order to get events
    # and in order to call herbstclient commands
    hc = hlwm.connect()

    trayer_config = {
        'tint' : Gruv.BG.replace('#', '0x'),
        'iconspacing' : '5',
        'padding' : '5',
        'monitor' : 'primary'
    }

    # get the geometry of the monitor
    monitor = sys.argv[1] if len(sys.argv) >= 2 else 0
    (x, y, monitor_w, monitor_h) = hc.monitor_rect(monitor)
    height = 18 # height of the panel
    width = monitor_w # width of the panel
    hc(['pad', str(monitor), str(height)]) # get space for the panel

    # An example conky-section:
    conky_text = '%{F\\#9fbc00}%{T2}\ue026%{T-}%{F\\#989898}${cpu}% '
    conky_text += '%{F\\#9fbc00}%{T2}\ue021%{T-}%{F\\#989898}${memperc}% '
    conky_text += '%{F\\#9fbc00}%{T2}\ue13c%{T-}%{F\\#989898}${downspeedf}K '
    conky_text += '%{F\\#9fbc00}%{T2}\ue13b%{T-}%{F\\#989898}${upspeedf}K '
    conky_text += "${if_existing /sys/class/power_supply/BAT0}"
    conky_text += "%{T2}"
    conky_text += "%{F\\#FFC726}"
    conky_text += "$else"
    conky_text += "%{F\\#9fbc00}"
    conky_text += "$endif"

    # you can define custom themes
    grey_frame = Theme(bg = '#303030', fg = '#EFEFEF', padding = (3,3))

    # Widget configuration:
    bar = lemonbar.Lemonbar(geometry = (x,y,width,height))
    bar.widget = W.ListLayout([
        W.RawLabel('%{l}'),
        hlwm.HLWMTags(hc, monitor, tag_renderer = hlwm.underlined_tags),
        W.RawLabel('%{c}'),
        hlwm.HLWMMonitorFocusLayout(hc, monitor,
           # this widget is shown on the focused monitor:
           grey_frame(hlwm.HLWMWindowTitle(hc)),
           # this widget is shown on all unfocused monitors:
           conky.ConkyWidget('df /home: ${fs_used_perc /home}%')
                                    ),
        W.RawLabel('%{r}'),
            conky.ConkyWidget(text= conky_text),
            grey_frame(W.DateTime('%B %d | %I %M %p')),
        trayer.TrayerWidget(args=trayer_config),
    ])
    return bar


bar = main()

