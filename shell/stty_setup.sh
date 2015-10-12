
# remap Ctrl+K to kill app instead of Ctrl+C, this stacks with another hack from urxvt to send Ctrl+Q as Ctrl+K
# the end result is Ctrl+Q quits out of current process, consistent with Windows+Q that quits the GUI app for me
stty intr \^K
