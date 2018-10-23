![WeeChat Screenshot](http://192.99.68.133/2017-11-18-172934_1916x1036_scrot.png)


## Enable mouse support


    /mouse enable


## Encrypted password in sec.conf


    /secure passphrase <pass>
    /secure set bncaddrport <addr/port>
    /secure set bncpass <pass>
    /secure set relaypass <pass>
    /secure set hiddenbuffers <list of hidden buffers full name>
    

## Network


### Default settings on server creation


    /set irc.server_default.nicks r3m
    /set irc.server_default.ssl_verify off
    /set irc.server_default.capabilities "account-notify,away-notify,cap-notify,multi-prefix,server-time,znc.in/self-message"


the last line request some IRCv3 capabilities. Capabilities supported by WeeChat are: _account-notify, away-notify, cap-notify, extended-join, multi-prefix, server-time, userhost-in-names_. See [IRCv3 Specifications](http://ircv3.net/irc/ "IRCv3 Specifications") to learn more about IRCv3 capabilities.


### Network-specific settings

    /server add freenode ${sec.data.bncaddrport} -ssl -autoconnect
    /set irc.server.freenode.password r3m/freenode:${sec.data.bncpass}
    
    /server add oftc ${sec.data.bncaddrport} -ssl -autoconnect
    /set irc.server.oftc.password r3m/oftc:${sec.data.bncpass}
    
    /server add snoonet ${sec.data.bncaddrport} -ssl -autoconnect
    /set irc.server.snoonet.password r3m/snoonet:${sec.data.bncpass}

    /connect -all


## Extensions


### Plugins to load at startup


    /set weechat.plugin.autoload "*,!lua,!tcl,!ruby,!fifo,!xfer,!guile,!javascript"


this will load all module except lua, tcl, ruby, fifo, xfer, guile and javascript


### Aspell


    /set aspell.check.default_dict en
    /set aspell.check.suggestions 3
    /set aspell.color.suggestions *green
    /aspell enable


#### Set the dictionary based on the channel name


    /trigger add setdict signal *,irc_in2_join
    /trigger set setdict conditions "${nick} == ${info:irc_nick,${server}} && ${channel} =~ [.-](fr|it|es)$ && ${aspell.dict.irc.${server}.${channel}} =="
    /trigger set setdict regex "/.*[.-](fr|it|es)$/${re:1}/"
    /trigger set setdict command "/set aspell.dict.irc.${server}.${channel} ${tg_signal_data}"
    

This trigger will set the french dictionnary for channel ending in _.fr_ and _-fr_ Same for it and es.


Note: we will add the suggestions to the statusbar later.


### Relay


    /relay sslcertkey
    /relay add ssl.weechat <port>
    /set relay.network.password ${sec.data.relaypass}


If you want a trusted certificate, use [let's encrypt! with weechat relay](https://pthree.org/2016/05/20/weechat-relay-with-lets-encrypt-certificates/ "Weechat Relay With Let's Encrypt Certificates").

Note: Even if I use a bouncer (_ZNC_), this is quite useful to enable relay. Like this you have access to all IRC client (_ZNC_) and all weechat remote interface (_WeeChat Relay_). Of course, WeeChat can do both but ZNC is multi-user.


### Logger


    /set logger.level.irc 0
    /set logger.file.path /home/launch/.znc/users/r3m/moddata/log
    /set logger.mask.irc %Y/$server/$channel.%m-%d.log
    
    
Note: I do not log IRC conversation via _WeeChat_ (I log via _ZNC_). However, I use the script _grep.py_ and this script check the value of _logger.file.path_. If the module is not loaded, the value is not accessible. You could load _logger_, then set the correct path and run /logs to build the index and then disable _logger_ but I had an issue when I upgrade _WeeChat_. 


## Scripts


    /script install highmon.pl buffer_autoset.py perlexec.pl autosort.py grep.py text_item.py


### highmon.pl


    /set plugins.var.perl.highmon.alignment "nchannel"
    

### autosort.py


    /autosort replacements add ## #
    /autosort rules add irc.server.*.&* = 0
    /autosort rules add irc.server.*.#* = 1
    /autosort rules add irc.server.*.\*status = 2
    
    
channels (begin with & and #) will appears right below the server, private message from *status will follow and finally the rest.
    
    
## Conky


    /buffer_autoset add exec.exec.conky short_name conky


### exec conky at startup and right now


    /set weechat.startup.command_after_plugins "/exec -norc -noln -buffer conky conky"
    /exec -norc -noln -buffer conky conky
    

### change the title of the conky window


    /buffer_autoset add exec.exec.conky title Conky - the light-weight system monitor


It will change the title of the conky window from _Executed commands_ to _Conky - the light-weight system monitor_


### this trigger will beautify the output of conky and add a localvar with the value of load average and the buflist will retrieve it


    /trigger add conky_tag_color modifier weechat_print
    /trigger set conky_tag_color conditions ${tg_buffer} == exec.exec.conky
    /trigger set conky_tag_color regex /^ \t(Uptime|CPU|RAM|Swap|Networking|Up|Down):(.*)/ ${color:_31}${re:1}\t${color:reset}${re:2}/ /No swap/0/ /^ \tLoad Average.*// /^Load Average: (.*)/${re:1}/tg_message_nocolor
    /trigger set conky_tag_color command ${if:${tg_message}=~Load Average?/buffer set localvar_set_buflist ${tg_message_nocolor}}


### my .conkyrc


    background no
    cpu_avg_samples 2
    net_avg_samples 2
    no_buffers yes
    out_to_stderr no
    update_interval 1.0
    uppercase no
    use_spacer none

    TEXT
    Load Average: ${loadavg 1 2}
    Uptime: $uptime
    CPU: $cpu%
    RAM: $memperc%
    Swap: $swapperc%
    Up: ${upspeed venet0}
    Down: ${downspeed venet0}


Note: you need conky-cli package on _Debian_, same for _Arch Linux_


## Weather with wttr.in

    /buffer_autoset add exec.exec.weather short_name weather
    /set aspell.dict.exec.exec.weather fr
    /trigger add weather command weather
    /trigger set weather regex "/\s/_/tg_argv_eol1"
    /trigger set weather command "/exec -noflush -norc -noln -buffer weather curl -s http://wttr.in/${tg_argv_eol1}?lang=${aspell.dict.exec.exec.weather}"
     
I found something very similar on the [alias wiki page](https://github.com/weechat/weechat/wiki/Alias-examples) of WeeChat on GitHub. I adjust it for my own use. So when you type _/weather Montreal_, a new buffer will be created and will show the output of _curl -s http://wttr.in/Montreal_. (I created a trigger instead of an alias to replace space by _ in city name)

    /trigger add set_title_weather_buffer print ""
    /trigger set set_title_weather_buffer conditions "${buffer.full_name} == exec.exec.weather && ${tg_message_nocolor} !~ ^\W && ${tg_message_nocolor} !~ (wttr\.in|@igor_chubin)"
    /trigger set set_title_weather_buffer regex "/.*/${tg_message_nocolor}/ /[^:]+:(.*)/${re:1}/tg_message"
    /trigger set set_title_weather_buffer command "/buffer set title ${tg_message_nocolor};/buffer set localvar_set_buflist ${tg_message}"


I created this trigger to change the title of the buffer from _Executed commands_ to _Weather for City: Montreal, Canada_.


    /trigger add weather_shortcut modifier input_text_for_buffer
    /trigger set weather_shortcut conditions "${buffer[tg_modifier_data].full_name} == exec.exec.weather && ${tg_string_nocolor} !~ ^/"
    /trigger set weather_shortcut regex "==(.*)==/weather ${re:1}"


This trigger will allow you to enter only the city name (without /weather) in the weather buffer.


## Bars


### Bar buflist


#### unmerge servers buffers from core and indent


    /set irc.look.server_buffer independent
    

Note: show channels and privates buffers under their respective server instead of mixing them all.


    /set buflist.format.buffer "${format_number}${indent}${eval:${format_name}}${format_hotlist} ${color:31}${buffer.local_variables.filter}${buffer.local_variables.buflist}"
    /set buflist.format.buffer_current ${if:${type}==server?${color:*white,31}:${color:*white}}${hide:>,${buffer[last_gui_buffer].number}} ${indent}${if:${type}==server&&${info:irc_server_isupport_value,${name},NETWORK}?${info:irc_server_isupport_value,${name},NETWORK}:${name}} ${color:31}${buffer.local_variables.filter}${buffer.local_variables.buflist}
    /set buflist.format.hotlist " ${color:239}${hotlist}${color:239}"
    /set buflist.format.hotlist_highlight "${color:163}"
    /set buflist.format.hotlist_message "${color:229}"
    /set buflist.format.hotlist_private "${color:121}"
    /set buflist.format.name "${if:${type}==server?${color:white}:${color_hotlist}}${if:${type}==server||${type}==channel||${type}==private?${if:${cutscr:8,+,${name}}!=${name}?${cutscr:8,${color:${weechat.color.chat_prefix_more}}+,${if:${type}==server&&${info:irc_server_isupport_value,${name},NETWORK}?${info:irc_server_isupport_value,${name},NETWORK}:${name}}}:${cutscr:8, ,${if:${type}==server&&${info:irc_server_isupport_value,${name},NETWORK}?${info:irc_server_isupport_value,${name},NETWORK}                              :${name}                              }}}:${name}}"
    /set buflist.format.number "${if:${type}==server?${color:black,31}:${color:239}}${number}${if:${number_displayed}?.: }"
    /set weechat.bar.buflist.size 18
    /set weechat.bar.buflist.size_max 18


Different foreground and background colors for servers buffers. Display the real network name instead of the one you create in WeeChat. For example, if you add a server BNCFreenode, it will appears as freenode. Servers, channels and privates names that exceed 8 characters will be cut to 8 followed by a + sign. Those who have less than 8 characters will be filled with space to make them align their hotlist with those that exceed 8 characters. Here, I added 25 spaces even if my bar is only 18, if you're bar is more than 25 characters wide, add spaces. Finally, if you type /iset something, the *something* text will appears at the right of iset. The load average will appears at the right of conky and the current city will appears at the right of weather (if you type /weather <a city>)


### Bar active title


    /bar add activetitle window top 1 0 buffer_title
    /set weechat.bar.activetitle.priority 500
    /set weechat.bar.activetitle.conditions "${active}"
    /set weechat.bar.activetitle.color_fg white
    /set weechat.bar.activetitle.color_bg 31
    /set weechat.bar.activetitle.separator on


Note: This bar will be different from the already created one. I set the conditions to ${active} so this bar will be displayed on the active window only. The other one will be used for other windows.


### Bar title


    /set weechat.bar.title.conditions "${inactive}"
    /set weechat.bar.title.color_fg black
    /set weechat.bar.title.color_bg 31


### Bar status


    /bar add rootstatus root bottom 1 0 [time],[buffer_count],[buffer_plugin],buffer_number+:+buffer_name+(buffer_modes)+{buffer_nicklist_count}+buffer_filter,[bitlbee_typing_notice],[lag],[aspell_dict],[aspell_suggest],completion,scroll
    /set weechat.bar.rootstatus.color_fg 31
    /set weechat.bar.rootstatus.color_bg 234
    /set weechat.bar.rootstatus.separator on
    /set weechat.bar.rootstatus.priority 500
    /bar del status
    /bar set rootstatus name status


Note: the built-in status bar is of type window. I prefer a status bar of type root which means it will be outside any window. At this time, you can't change the type of a bar. So we delete the status bar and create a new one.


### Bar input


    /bar add rootinput root bottom 1 0 [buffer_name]+[input_prompt]+(away),[input_search],[input_paste],input_text
    /set weechat.bar.rootinput.color_bg black
    /set weechat.bar.rootinput.priority 1000
    /bar del input
    /bar set rootinput name input


Note: the built-in input bar is of type window. I prefer a input bar of type root which means it will be outside any window. At this time, you can't change the type of a bar. So we delete the status bar and create a new one.


### Bar Nicklist


    /set weechat.bar.nicklist.color_fg 229
    /set weechat.bar.nicklist.separator on
    /set weechat.bar.nicklist.conditions "${nicklist} && ${window.number} == 1 && ${buffer.full_name} !~ ^irc.freenode.(#newsbin|##news)$"
    /set weechat.bar.nicklist.size_max 14
    /set weechat.bar.nicklist.size 14
    
    
Note: I changed the conditions to display the nicklist only on buffer of type channels _${nicklist}_ and on the window number 1, which is my chat window (2 being my highlight window and 3 my conky window). In my case, I could remove _${window.numer} == 1_ because the _highmon_ and _exec_ buffer (conky) are not of type channels so ${nicklist} is enough.


### Bar ZNC (see [this dedicated gist](https://gist.github.com/pascalpoitras/ae1f147c7840dc191415a3ed6a23fa1b))

    /set plugins.var.python.text_item.znc_commands "private "

    /set plugins.var.znc_commands Version ListMods ListAvailMods ListNicks ListServers AddNetwork DelNetwork ListNetworks MoveNetwork JumpNetwork AddServer DelServer AddTrustedServerFingerprint DelTrustedServerFingerprint ListTrustedServerFingerprints EnableChan DisableChan Attach Detach Topics PlayBuffer ClearBuffer ClearAllChannelBuffers ClearAllQueryBuffers SetBuffer AddBindHost DelBindHost ListBindHosts SetBindHost SetUserBindHost ClearBindHost ClearUserBindHost ShowBindHost Jump Disconnect Connect Uptime LoadMod UnloadMod ReloadMod UpdateMod ShowMOTD SetMOTD AddMOTD ClearMOTD ListPorts AddPort DelPort Rehash SaveConfig ListUsers ListAllUserNetworks ListChans ListClients Traffic Broadcast Shutdown Restart
    
    /bar add znc_commands window right 14 1 znc_commands
    /set weechat.bar.znc_commands.conditions "${buffer.full_name} =~ \.*status$ && ${window.number} == 1"
    /set weechat.bar.znc_commands.size_max 14

    /trigger add hsignal_znc_commands hsignal znc_commands
    /trigger set hsignal_znc_commands command "/command -buffer ${buffer.full_name} * /quote znc help ${_bar_item_line};/command -buffer ${buffer.full_name} * /input delete_line;/command -buffer ${buffer.full_name} * /input insert ${_bar_item_line}\x20"

    /key bindctxt mouse @item(znc_commands):button1 hsignal:znc_commands  
    
    /eval /perlexec my $i = 0; foreach my $command (split / /, '${plugins.var.znc_commands}') { (my $command2 = $command) =~ s/.*?([A-Z][A-Z]+|[A-Z][a-z]+)$/$1/; $command2 =~ s/([^s])s$/$1/; weechat::command("", "/eval /mute set plugins.var.python.text_item.znc_commands \\${plugins.var.python.text_item.znc_commands}\\\\${color:\\${info:nick_color_name,$command2}}$command\\\\${\\n}"); weechat::command("", "/eval /mute set trigger.trigger.hsignal_znc_commands.regex \\${trigger.trigger.hsignal_znc_commands.regex} /^$i\\\\$/$command/_bar_item_line"); $i++; }


This bar will be exactly like a default nicklist bar. That is, right-positionned with vertical filling. But instead of nicknames, it will contains a znc command per line. If you click on a command, the input bar will be filled with the command name, then you add whatever you want or simply press enter. Futhermore, this will send _help command_ to znc.


## Layouts


### Layout highlight-or-news


    /perlexec my $total = weechat::hdata_integer(weechat::hdata_get("window"), weechat::current_window(), "win_height"); weechat::command($buffer, "/window splith " . int(8 / $total * 100));
    /buffer perl.highmon
    /window 1
    /layout store highlight-or-news
    
    
Note: Instead of having only one window, we split it to create another one that we will use to show all highlights.


### Layout highlight-or-news-and-conky


    /window 2
    /window splitv 85
    /buffer exec.conky
    /window 1
    /layout store highlight-or-news-and-conky
    
    
Note: split the highlight monitor window in 2 and show conky in the new one


## News

![WeeChat Screenshot](http://192.99.68.133/2017-11-03-192801_1188x272_scrot.png)

    /filter add news irc.freenode.##news !nick_newsly+!host_yano@unaffiliated/yano/bot/rssly,!irc_privmsg *
    /filter add news_interest irc.freenode.##news nick_newsly+irc_privmsg,host_yano@unaffiliated/yano/bot/rssly+irc_privmsg !^(\s|\[)(Reddit [-] /r/netsec|Wired|freenode|EFF Updates|erry's blog|techdirt|TorrentFreak|Science Daily|Hacker News|CNET|phoronix|Ars Technica|The Intercept|france24|Radio Canada|Canoe|Huffington Post [-] Weird News)( \-| | |\])

##news is a news channel on Freenode. The bot is named _newsly_ and you should create a filter to hide everything that is not from this bot. You should also create a filter to hide all the sites you don't mind about.

    /trigger add news_modifier modifier weechat_print
    /trigger set news_modifier conditions "${tg_tag_nick} == newsly && ${tg_tags} =~ ,irc_privmsg, && ${tg_buffer} == irc.freenode.##news"
    /trigger set news_modifier regex "/.*// ==https?://.*====tg_message ==.*(https?://\S+).*==${re:1}==tg_message_nocolor /\+/%2B/tg_message_nocolor /,/%2C/tg_message_nocolor /\!/%21/tg_message_nocolor /\*/%2A/tg_message_nocolor"
    /trigger set news_modifier command "/print -buffer ${tg_buffer} -tags ${tg_tags},url_${tg_message_nocolor} \t${tg_message}"
    
This trigger will remove the URL in the message and add it is a tag instead. Click on a message and the input bar will be fill with the URL, then click on the URL. If the URL is too long and is broken, press enter to echo it to ##news (nobody will see it because the channel is +m), go in bare mode (ALT+L) and click on the URL. You can also change this behavior to open the URL as soon as you click on the message. 
    
    /trigger set news_modifier regex "/.*// /.*/${tg_message_nocolor}/tg_message /^\[([^]]+)]/[${color:*${info:nick_color_name,${re:1}}}${re:1}${color:resetcolor}]/tg_message ==https?://.*====tg_message ==.*(https?://\S+).*==${re:1}==tg_message_nocolor /\+/%2B/tg_message_nocolor /,/%2C/tg_message_nocolor /\!/%21/tg_message_nocolor /\*/%2A/tg_message_nocolor"
    /trigger set news_modifier command "/print -buffer ${tg_buffer} -tags ${tg_tags},url_${tg_message_nocolor} \t${tg_message}"
    
This is the same trigger as above, we just changed the regex and command section to replace the color in the message with colors that figure in the option _weechat.color.chat_nick_colors_ instead.
    
    /trigger set news_modifier regex "/.*// /.*/${tg_message_nocolor}/tg_prefix /.*/${tg_message_nocolor}/tg_message /^\[[^]]+\]//tg_message /^\[([^]]+)\].*/${re:1}/tg_prefix /^([^\-]+)/${color:_black,${info:nick_color_name,${re:1}}} ${re:1}/tg_prefix / - / ${color:-underline} /tg_prefix /$/ ${color:!}/tg_prefix ==\(?https?://.*====tg_message ==.*(https?://\S+).*==${re:1}==tg_message_nocolor /\+/%2B/tg_message_nocolor /,/%2C/tg_message_nocolor /\!/%21/tg_message_nocolor /\*/%2A/tg_message_nocolor"
    /trigger set news_modifier command "/print -buffer ${tg_buffer} -tags ${tg_tags},url_${tg_message_nocolor} \t${tg_prefix}${color:reset}${tg_message}"
    
Again, the same trigger. But this time we use powerline symbols and the colors from _weechat.color.chat_nick_colors_. 

    /trigger set news_modifier command "/print -buffer ${tg_buffer} -tags ${tg_tags},url_${tg_message_nocolor} \t${tg_prefix}${tg_message}"
    
Same trigger (must be used with the regex above, from the powerline version) but color the whole message.

    /trigger add hsignal_news_click hsignal news_click
    /trigger set hsignal_news_click regex "/.*,url_([^,]+).*/${re:1}/_chat_line_tags"
    /trigger set hsignal_news_click command "/command -buffer ${buffer.full_name} core /input delete_line;/command -buffer ${buffer.full_name} core /input insert ${_chat_line_tags}"


## ptpb


    /alias add ptpburl /exec -sh -hsignal ptpburl $* 2>&1 | curl -sF c=@- https://ptpb.pw/?u=1
    /trigger add ptpburl hsignal ptpburl
    /trigger set ptpburl command "/command -buffer ${buffer.full_name} core /input delete_line;/command -buffer ${buffer.full_name} core /input insert ${out}"
    
    
This allow you to type _/ptpburl uptime_ for example, to send the output of the uptime command to ptpb. Your input bar content will be replaced by the url of the paste. This way you can visit the URL to see if there is sensitive information before giving the url to everyone. You may wonder why I didn't used something like:
_/exec -sh -pipe "/input delete_line;/input insert " $* 2>&1 | curl -sF c=@- https://ptpb.pw/?u=1._ 
Well If we use this, the input bar will be filled with the command and not the url. 


## Dev info

![WeeChat Screenshot](http://192.99.68.133/2017-11-17-231857_1547x91_scrot.png)

    /trigger add devinfofr hsignal devinfofr
    /trigger set devinfofr regex "/\n/ /out / (stable_number|git|git_scripts|next_stable|next_stable_number):\S+//out /^stable:(\S+)/La version stable de WeeChat est la ${re:1}./out / stable_date:(\S+)/ Elle est la version stable depuis le ${re:1}./out / devel:(\S+)/ La version devel de WeeChat est la ${re:1}./out / next_stable_date:(\S+)/ La prochaine stable devrait arriver aux alentour du ${re:1}./out /([0-9]{4})-01-([0-9]{2})/${re:2} Janvier ${re:1}/out /([0-9]{4})-02-([0-9]{2})/${re:2} Février ${re:1}/out /([0-9]{4})-03-([0-9]{2})/${re:2} Mars ${re:1}/out /([0-9]{4})-04-([0-9]{2})/${re:2} Avril ${re:1}/out /([0-9]{4})-05-([0-9]{2})/${re:2} Mai ${re:1}/out /([0-9]{4})-06-([0-9]{2})/${re:2} Juin ${re:1}/out /([0-9]{4})-07-([0-9]{2})/${re:2} Juillet ${re:1}/out /([0-9]{4})-08-([0-9]{2})/${re:2} Août ${re:1}/out /([0-9]{4})-09-([0-9]{2})/${re:2} Septembre ${re:1}/out /([0-9]{4})-10-([0-9]{2})/${re:2} Octobre ${re:1}/out /([0-9]{4})-11-([0-9]{2})/${re:2} Novembre ${re:1}/out /([0-9]{4})-12-([0-9]{2})/${re:2} Décembre ${re:1}/out"
    /trigger set devinfofr command "/command -buffer ${buffer.full_name} * /say ${out}"

    /trigger add devinfo hsignal devinfo
    /trigger set devinfo regex "/\n/ /out / (stable_number|git|git_scripts|next_stable|next_stable_number):\S+//out /^stable:(\S+)/The stable version of WeeChat is ${re:1}./out / stable_date:(\S+)/ It is the stable version since ${re:1}./out / devel:(\S+)/ The devel version of WeeChat is ${re:1}./out / next_stable_date:(\S+)/ The next stable should be release around ${re:1}./out /([0-9]{4})-01-([0-9]{2})/January ${re:2} ${re:1}/out /([0-9]{4})-02-([0-9]{2})/February ${re:2} ${re:1}/out /([0-9]{4})-03-([0-9]{2})/March ${re:2} ${re:1}/out /([0-9]{4})-04-([0-9]{2})/April ${re:2} ${re:1}/out /([0-9]{4})-05-([0-9]{2})/May ${re:2} ${re:1}/out /([0-9]{4})-06-([0-9]{2})/June ${re:2} ${re:1}/out /([0-9]{4})-07-([0-9]{2})/July ${re:2} ${re:1}/out /([0-9]{4})-08-([0-9]{2})/August ${re:2} ${re:1}/out /([0-9]{4})-09-([0-9]{2})/September ${re:2} ${re:1}/out /([0-9]{4})-10-([0-9]{2})/October ${re:2} ${re:1}/out /([0-9]{4})-11-([0-9]{2})/November ${re:2} ${re:1}/out /([0-9]{4})-12-([0-9]{2})/December ${re:2} ${re:1}/out"
    /trigger set devinfo command "/command -buffer ${buffer.full_name} * /say ${out}"

    /alias add devinfo /exec -norc -timeout 5 -hsignal devinfo url:https://weechat.org/dev/info/all/
    /alias add devinfofr /exec -norc -timeout 5 -hsignal devinfofr url:https://weechat.org/dev/info/all/
    

These alias send info about the current stable version of WeeChat and the next stable to the channel. The alias call exec and the output of exec is send as a hsignal. So the triggers handle the output.


## Highlight


    /set weechat.look.highlight *pascalpoitras*
    /buffer_autoset add irc.bitlbee.#twitter_pascalpoitras* highlight_words freenode,snoonet,*weechat*
    /buffer_autoset add irc.bitlbee.#LET highlight_regex .*
    /buffer_autoset add irc.bitlbee.#deals highlight_regex .*
    /buffer_autoset add irc.freenode.##reddit-hockey highlight_regex (^GOAL: MTL.*|^Le But: MTL.*)


## Triggers


    /trigger add upgrade_scripts signal day_changed
    /trigger set upgrade_scripts command "/script update;/wait 10s /script upgrade"
    
The trigger _upgrade_scripts_ will update the local script cache and then upgrade all the installed scripts at midnight. 
    
    /trigger add send_to_active_grep_log_nick command send_to_active_grep_log_nick
    /trigger set send_to_active_grep_log_nick conditions ${tg_argv_eol1} && ${type} =~ ^(private|channel)$
    /trigger set send_to_active_grep_log_nick regex /\\\$/\\\\/tg_argv1
    /trigger set send_to_active_grep_log_nick command /input delete_line;/input insert /exec -sh -norc -pipe "/input insert grep -hiP '^\[\d{2}:\d{2}:\d{2}\] (<|\* )\Q${tg_argv1}\E>? ${tg_argv_eol2} " grep -hiP '^\[\d{2}:\d{2}:\d{2}\] (<|\* )\Q${tg_argv1}\E>? ${tg_argv_eol2}' ~/.znc/users/r3m/moddata/log/`date "+%Y"`/'${server}'/'${buffer.short_name}'.* | shuf -n 1

The _send_to_active_grep_log_nick_ will search in log for something a user said before. Then it will send the output to IRC. I use the _grep.py_ when searching in log for myself but I created this trigger to return a random line from a user.

![WeeChat Screenshot](http://192.99.68.133/2017-11-12-210021_1190x48_scrot.png)
![WeeChat Screenshot](http://192.99.68.133/2017-11-12-210053_1194x49_scrot.png)

    /trigger add modifier_is_nick_valid modifier input_text_display 
    /trigger set modifier_is_nick_valid conditions "${tg_string_nocolor} =~ ^/nick .+ && ${buffer.plugin.name} == irc"
    /trigger set modifier_is_nick_valid regex "==/nick (.+)==${re:1}==tg_string_nocolor ===/nick (.+)===/nick ${if:${info:irc_is_nick,${tg_string_nocolor}}&&${cut:${info:irc_server_isupport_value,${server},NICKLEN},,${tg_string_nocolor}}==${tg_string_nocolor}?${color:*green}:${color:*red}}${re:1}      -- NICKLEN:${color:-bold} ${info:irc_server_isupport_value,${server},NICKLEN}  ${color:bold}Allowed Chars: ${color:-bold}${esc:a-zA-Z0-9_-\[]{}^`|}===tg_string"

The trigger modifier_is_nick_valid will give you hint about max nickname length and available character in nickname and will also tell you if the nick is valid (green) or not (red). Note that it doesn't works with -all option of the /nick command. 


## Keys


    /key bindctxt cursor @item(buffer_nicklist):v /window ${_window_number};/voice ${nick}
    /key bindctxt cursor @item(buffer_nicklist):o /window ${_window_number};/op ${nick}
    /key bindctxt cursor @item(buffer_nicklist):V /window ${_window_number};/devoice ${nick}
    /key bindctxt cursor @item(buffer_nicklist):O /window ${_window_number};/deop ${nick}
    /key bindctxt cursor @chat(*):s /window ${_window_number};/slap ${_chat_line_nick};/cursor stop
    /key bindctxt cursor @item(buffer_nicklist):s /window ${_window_number};/slap ${nick};/cursor stop
    /key bindctxt cursor @item(buflist):d /command -buffer ${full_name} irc /quote znc detach ${short_name};/cursor stop
    /key bindctxt cursor @item(buflist):h /command -buffer ${full_name} irc /allchan -current buffer hide;/command -buffer ${full_name} irc /allpv -current buffer hide;/cursor stop
    /key bindctxt cursor @item(buflist):H /command -buffer ${full_name} irc /allchan -current buffer unhide;/command -buffer ${full_name} irc /allpv -current buffer unhide;/cursor stop
    /key bindctxt cursor @chat(*):g /window ${_window_number};/customgrep ${_chat_line_nick};/cursor stop
    /key bindctxt cursor @item(buffer_nicklist):g /window ${_window_number};/customgrep ${nick};/cursor stop
    /key bindctxt cursor @chat(*):G /window ${_window_number};/input delete_line;/input insert /send_to_active_grep_log_nick ${_chat_line_nick}\x20;/cursor stop
    /key bindctxt cursor @item(buffer_nicklist):G /window ${_window_number};/input delete_line;/input insert /send_to_active_grep_log_nick ${nick}\x20;/cursor stop


I use _/buffer hide_ when I want to hide a buffer in the buffers bar but still want to be able to access it. I use _/znc detach_ on all channels that I have joined only for logging the discussion.

## Others Keyboard shortcuts


    /key bind meta-meta2-A /bar scroll nicklist * -100%
    /key bind meta-meta2-B /bar scroll nicklist * +100%
    /key bind meta2-A /input history_global_previous
    /key bind meta2-B /input history_global_next

    /key bind ctrl-V /eval ${if:${sec.data.hiddenbuffers} !~ \b${buffer_visited[last_gui_buffer_visited].buffer.full_name}\b?/mute /alias add temphiddenbuf /buffer cycle ${sec.data.hiddenbuffers} ${buffer_visited[last_gui_buffer_visited].buffer.full_name}};/temphiddenbuf
    
The last bind cycle through hidden buffers in ${sec.data.hiddenbuffers} and then goes back to the buffer were the first ctrl-v was pressed.
    
    

## Alias


    /alias add cq allpv /buffer close
    /alias add slap /me slaps $1 around a bit with a large trout
    /alias add customgrep /input delete_line;/input insert /grep log */$server/$channel.* -a ^\[\d{2}:\d{2}:\d{2}\] <%{escape $1}>\x20
    /alias add znc /quote znc
    /alias add multicomm /alias add temp $*;/temp
    
The last alias will allow you to type multi command like this /multicomm comm1;comm2


## Filters


    /set irc.look.smart_filter on
    /filter add irc_smart *,!irc.undernet.* irc_smart_filter *
    

## Custom join color


    /set weechat.color.chat_prefix_join 121
    /set weechat.color.chat_host 31
    /set irc.color.message_join 121
    
    
The _weechat.color.chat_host_ option will also set this color for part and quit. To have a different color, for example, a host in red for parts and quits and green for joins, see [this](https://github.com/weechat/weechat/wiki/Triggers#colors-for-joinpartquitnickmodedisconnect).


## Custom part and quit


    /set weechat.color.chat_prefix_quit 131
    /set irc.color.message_quit 131
    
    
## The remaining IRC options


    /set irc.server_default.away_check 5
    /set irc.server_default.away_check_max_nicks 25
    /set irc.color.nick_prefixes "q:lightred;a:lightcyan;o:121;h:lightmagenta;v:229;*:lightblue"
    /set irc.network.ban_mask_default "*!*@$host"
    /set irc.look.buffer_switch_autojoin off
    /set irc.look.buffer_switch_join off
    /set irc.look.color_nicks_in_nicklist on
    /set irc.look.part_closes_buffer on


## The remaining Weechat options


    /set weechat.look.bar_more_down "▼"
    /set weechat.look.bar_more_left "◀"
    /set weechat.look.bar_more_right "▶"
    /set weechat.look.bar_more_up "▲"
    /set weechat.look.buffer_time_format "${253}%H${245}%M"
    /set weechat.look.color_inactive_message off
    /set weechat.look.color_inactive_prefix off
    /set weechat.look.color_inactive_prefix_buffer off
    /set weechat.look.color_inactive_window off
    /set weechat.look.day_change_message_1date ▬▬▶ %a, %d %b %Y ◀▬▬
    /set weechat.look.day_change_message_2dates ▬▬▶ %%a, %%d %%b %%Y (%a, %d %b %Y) ◀▬▬
    /set weechat.look.item_buffer_filter "•"
    /set weechat.look.prefix_align_min 0
    /set weechat.look.prefix_align_max 10
    /set weechat.look.prefix_join "▬▬▶"
    /set weechat.look.prefix_quit "◀▬▬"
    /set weechat.look.prefix_suffix "│"
    /set weechat.look.read_marker_string "─"
    /set weechat.look.separator_horizontal "="


    /set weechat.color.bar_more 229
    /set weechat.color.chat_highlight lightred
    /set weechat.color.chat_highlight_bg default
    /set weechat.color.chat_nick_colors "cyan,magenta,green,brown,lightblue,lightcyan,lightmagenta,lightgreen,blue"
    /set weechat.color.chat_prefix_more 31
    /set weechat.color.chat_prefix_suffix 31
    /set weechat.color.chat_read_marker 31
    /set weechat.color.chat_time 239
    /set weechat.color.chat_delimiters 31
    /set weechat.color.separator 31
    /set weechat.color.status_data_highlight 163
    /set weechat.color.status_data_msg 229
    /set weechat.color.status_data_private 121
    /set weechat.color.status_more 229
    /set weechat.color.status_name 121
    /set weechat.color.status_name_ssl 121