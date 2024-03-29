from barpyrus import hlwm
from barpyrus import widgets as W
from barpyrus.core import Theme
from barpyrus import lemonbar
from barpyrus import conky
import sys
import os
import socket


is_hidpi = socket.gethostname() == 'x1'
# Copy this config to ~/.config/barpyrus/config.py

# set up a connection to herbstluftwm in order to get events
# and in order to call herbstclient commands
hc = hlwm.connect()

# get the geometry of the monitor
monitor = sys.argv[1] if len(sys.argv) >= 2 else 0
(x, monitor_y, monitor_w, monitor_h) = hc.monitor_rect(monitor)
height = 18  # height of the panel
if is_hidpi:
    height = 28

width = monitor_w  # width of the panel
#gap = int(hc(['get', 'frame_gap'])) if 0 == int(hc(['get', 'smart_frame_surroundings'])) else 0
gap = 0
x += gap
width -= 2 * gap
top = True
if top:
    y = monitor_y + gap
    hc(['pad', str(monitor), str(height + gap)])  # get space for the panel
else:
    y = monitor_y + monitor_h - gap - height
    # get space for the panel
    hc(['pad', str(monitor), "", "", str(height + gap)])

network_devices = os.listdir('/sys/class/net/')
network_devices = [n for n in network_devices if n != "lo"]

cg = conky.ConkyGenerator(lemonbar.textpainter())
with cg.temp_fg('#B7CE42'):
    cg.symbol(0xe026)
cg += ' '
cg.var('cpu')
cg += '% '
with cg.temp_fg('#6F99B4'):
    cg.symbol(0xe021)
cg += ' '
cg.var('memperc')
cg += '% '

for net in network_devices:
    wireless_icons = [0xe218, 0xe219, 0xe21a]
    wireless_delta = 100 / len(wireless_icons)
    with cg.if_('up %s' % net):
        cg.fg('#FEA63C')
        if net[0] == 'w':
            with cg.cases():
                for i, wicon in enumerate(wireless_icons[:-1]):
                    cg.case('match ${wireless_link_qual_perc %s} < %d' % (
                        net, (i+1)*wireless_delta))
                    cg.symbol(wicon)
                cg.else_()
                cg.symbol(wireless_icons[-1])  # icon for 100 percent
        else:
            cg.symbol(0xe197)  # normal wired icon
        cg.fg('#D81860')
        cg.symbol(0xe13c)
        cg.fg('#CDCDCD')
        cg.var('downspeed %s' % net)
        cg.fg('#D81860')
        cg.symbol(0xe13b)
        cg.fg('#CDCDCD')
        cg.var('upspeed %s' % net)
cg.drawRaw('%{F-}%{B-}')


# An example conky-section:
# icons
bat_icons = [
    0xe242, 0xe243, 0xe244, 0xe245, 0xe246,
    0xe247, 0xe248, 0xe249, 0xe24a, 0xe24b,
]

# first icon: 0 percent
# last icon: 100 percent
bat_delta = 100 / len(bat_icons)

# conky_sep = '%{T2}  %{T-}%{F\\#FEA63C}|%{T2} %{T-}'
conky_sep = '%{T3}%{F\\#FEA63C}\ue1b1%{T-}'
# conky_sep = '%{T3}%{F\\#878787}\ue1ac%{T2} %{T-}'
if is_hidpi:
    conky_sep = '%{T3}%{F\\#878787} / %{T2} %{T-}'
conky_text = ""
conky_text += "${if_existing /sys/class/power_supply/BAT0}"
conky_text += conky_sep
conky_text += "%{T2}"
conky_text += "${if_match \"$battery\" == \"discharging $battery_percent%\"}"
conky_text += "%{F\\#FFC726}"
conky_text += "$else"
conky_text += "%{F\\#9fbc00}"
conky_text += "$endif"
for i, icon in enumerate(bat_icons[:-1]):
    conky_text += "${if_match $battery_percent < %d}" % ((i+1)*bat_delta)
    conky_text += chr(icon)
    conky_text += "${else}"
conky_text += chr(bat_icons[-1])  # icon for 100 percent
for _ in bat_icons[:-1]:
    conky_text += "${endif}"
conky_text += "%{T-}"
conky_text += "${if_match $battery_percent < 8}%{B\\#57000F}%{F\\#FF7F27}${else}"
conky_text += "${if_match $battery_percent < 15}%{F\\#FF7F27}${else}"
conky_text += "%{F\\#CDCDCD}${endif}${endif}"
conky_text += " $battery_percent% "
conky_text += "${endif}"  # endif: if BAT0 exists
conky_text += "%{B-}%{F-}"
conky_text += conky_sep
conky_text += '%{F\\#CDCDCD}${time %B %d }'
#conky_text += conky_sep
conky_text += '%{F\\#CDCDCD}'

# example options for the hlwm.HLWMLayoutSwitcher widget
xkblayouts = [
    'us us -option compose:ralt -variant altgr-intl us'.split(' '),
    'de de de'.split(' '),
]
setxkbmap = 'setxkbmap -option -option compose:menu -option ctrl:nocaps'
setxkbmap += ' -option compose:rctrl'


def simple_tag_renderer(self, painter):  # self is a HLWMTagInfo object
    self.activecolor = '#86AB5F'
    if self.empty:
        return
    # painter.ol('#ffffff' if self.focused else None)
    painter.set_flag(painter.underline, True if self.visible else False)
    painter.fg('#a0a0a0' if self.occupied else '#909090')
    if self.urgent:
        painter.ol('#FF7F27')
        painter.fg('#FF7F27')
        painter.set_flag(painter.underline, True)
        painter.bg('#57000F')
    elif self.here:
        painter.fg('#ffffff')
        painter.ol(self.activecolor if self.focused else '#ffffff')
        painter.bg(self.emphbg)
    else:
        painter.ol('#454545')
    painter.space(1)
    painter += self.name
    painter.space(1)
    painter.bg()
    painter.ol()
    painter.set_flag(painter.underline, False)
    painter.space(1)


# you can define custom themes
grey_frame = Theme(fg='#dedede', bg='#454545', padding=(4, 4))
if is_hidpi:
    def identity(x):
        return x
    grey_frame = identity


def tab_renderer(self, painter):
    painter.symbol(0xe12f)
    painter.fg('#CDCDCD')
    painter.space(3)


def zip_renderer(self, painter):
    painter.fg('#989898')
    if self.label == '0':
        painter.symbol(0xe26f)
        painter.space(2)
    else:
        painter.bg('#303030')
        painter.fg('#86AB5F')
        painter.space(2)
        painter.symbol(0xe26f)
        painter.space(2)


conky_widget = conky.ConkyWidget(str(cg))

# barpyrus/windowframe.py
#xwin = windowframe.WindowFrame((x,y+20,width,height), 1);
# xwin.loop()

# Widget configuration:
lemonbar_options = {
    'geometry': (x, y, width, height),
    'foreground': '#CDCDCD',
    'background': '#FF101010',
 #   'background': '#00101010',  # This enables complete transparency
}

lemonbar_options['font'] = 'misc nexus'
lemonbar_options['symbol_font'] = 'Wuncon Siji'

if is_hidpi:
    lemonbar_options['font'] = 'Bitstream Vera Sans:size=8'
    lemonbar_options['symbol_font'] = \
        '-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1'
    tag_renderer = simple_tag_renderer
else:
    tag_renderer = hlwm.underlined_tags
    tag_renderer.activecolor = 'red'

bar = lemonbar.Lemonbar(**lemonbar_options)

bar.widget = W.ListLayout([
    W.RawLabel('%{l}'),
    hlwm.HLWMTags(hc, monitor, tag_renderer=tag_renderer),
    W.TabbedLayout(list(enumerate([
        W.ListLayout([W.RawLabel('%{c}'),
                      hlwm.HLWMMonitorFocusLayout(hc, monitor,
                                                  # this widget is shown on the focused monitor:
                                                  grey_frame(
                                                      hlwm.HLWMWindowTitle(hc, maxlen=70)),
                                                  # this widget is shown on all unfocused monitors:
                                                  conky_widget,
                                                  )]),
        W.ListLayout([W.RawLabel('%{c}'), conky_widget]),
    ])), tab_renderer=tab_renderer),
    W.RawLabel('%{r}'),
    # something like a tabbed widget with the tab labels '>' and '<'
    W.TabbedLayout([
        ('0', W.RawLabel('')),
        ('1', hlwm.HLWMLayoutSwitcher(hc, xkblayouts, command=setxkbmap.split(' '))),
    ], tab_renderer=zip_renderer),
    conky.ConkyWidget(text=conky_text),
    W.DateTime('%I:%M %p'),
])
