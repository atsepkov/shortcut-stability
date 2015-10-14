# Work in Progress
This document describes the work in progress. It's meant to help me document things to retrace steps easier without writing actual scripts yet. It's also a location to document GUI steps that I haven't figured out how to script yet. 

## Linux
Currently support ctrl+c through urxvt and vim, working on tmux support now. Setup requires the following:

- Source vim/keybaord.vim file from vim for vim integration
- Source shell/Xresources/urxvt-keys files from .Xresources for urxvt shortcuts
- Source shell/stty_setup.sh from .bashrc for terminal shell shortcuts

## OSX
First, let's bring Ctrl+C/V back. A few sources for info:

- http://apple.stackexchange.com/questions/66970/remap-ctrlc-ctrlv-and-ctrl-x-only
- http://blog.lazyhacker.com/2009/08/using-ctrl-cvx-on-osx-for-copypastecut.html
- http://osxnotes.net/keybindings.html
- https://github.com/ttscoff/KeyBindings
- https://github.com/jonshea/config-files/blob/master/DefaultKeyBinding.dict

Here is what I actually did for now, will see how this works in the future:

- cp OSX/Library/KeyBindings/* to ~/Library/KeyBindings/ (this works for some apps, doesn't scale as well as I hoped)
- Xcode: Xcode> Preferences > Key Bindings > "comment", change it to ^C, change conflicting "jump" binding to something else
- Settings > Keyboard > App Shortcuts > Add "Copy/Paste/Select All" manually (this seems to work better than #1)
- iTerm for now is piggybacking off of #3 above, but I want to use coroutines in the future to make it smarter

Next, user consistency with linux:

- source OSX/shell/gnu_aliases.sh in .bashrc

## Windows
To be completed later
