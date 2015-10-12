# Shortcut Stability
> Input consistency, on so many levels...

I love keyboard shortcuts, I use them all the time. What I don't love, **at all**, is the context switch between various environments with conflicting shortcuts. When shortcuts conflict between apps/OSes, my productivity goes down the drain. I fear that I'll use the wrong copy register and spend more time undoing things, I spend a few seconds pondering if I'm using the right clipboard, if the command will copy the string or terminate the process, and these seconds add up, they tax my brain. You are probably a victim of this too. For example:

- Did you recently switch to a Mac only to discover that all `Ctrl+*` shortcuts have changed to `⌘+*`?
- Did you accidentally use `Ctrl+C` in Linux terminal only to see that it terminates current process instead of copying?
- Do you fight with your shortcuts when switching between vim/sublime/atom? (even when using vim-mode)
- Do you get confused because your tiling WM shortcuts differ from tmux, which in turn differ from vim for doing conceptually the same action?
- Do you spend hours pondering which shortcuts in vim you haven't yet assigned to?
- Do you spend hours pondering which shortcut you assigned the action you really need now to?

This is my attempt to remedy that. This is pretty much a work in progress so use at your own risk, and feel free to 
add your own consistency shortcuts for other apps (i.e. emacs) to this repo. The requirement is that it must not 
conflict with the [Basic Choices](#basic-choices) and the [Manifest](#manifest) (which aims to capture the consistency of concepts).

I believe that part of the reason we are where we are today with keyboard shortcuts is because of lack of standards, and the
face that no one has sat down and asked themselves the same questions we ask ourselves everyday in programming:

- Does this pattern make sense in other uses?
- Does this pattern scale/stack well with other patterns?
- Is this meta-key/object use consistent with my previous use of this meta-key/object?
- Can I abstract this concept away for better reuse in the future?
- How does this affect my muscle memory?

This project is about accepting a new set of conventions to boost our productivity and consistency. It's about making a sacrifice and accepting something unconventional in exchange for better results in the future. It's about discarding old standards that were born out of coincidence and historical keyboard/terminal limitations (we have ways to work around them now, let's do that).


## Goals
- Consistent shortcuts for Linux, OSX, and Windows
- Consistent shortcuts/macros for apps (mostly IDEs and text editors)
- Consistent window management (especially for tiling WMs) that's intuitive


## Key Names
For brevity and consistency between OSes I will use key logos instead of their longer names. 
Symbols taken from [here](https://wincent.com/wiki/Unicode_representations_of_modifier_keys)

### Meta Keys
|⇪ - Caps Lock (Macro Key) - yes, I **AM** planning to use it, I will turn this nemesis into a savior
|⌘ - Windows/Command/Mod Key
|⌥ - Alt/Option Key
|⌃ - Control Key
|⇧ - Shift Key

**NOTE**: I'm still trying to decide between `Alt` and `Ctrl` keys, the difference is rather arbitrary, and I have considered promoting `Ctrl` key, since `Alt` means "alternative" and implies a different meaning to the same action, whereas `Ctrl` means the event will do something "advanced". However, `Ctrl` has been much more common in user interaction, and compatibility with terminal shells, which can actually detect it. Therefore, as far as your muscle memory is concerned, `Ctrl` is lower precedence (more common) than `Alt`.

I've ordered the keys (in my opinion) from highest to lowest precedence. Lower precedence means that the meta-behavior
should be similar to that without this meta key. Higher precedence means that we have more leeway with what we are
allowed to do with the given key combo (i.e. `⌘c` does not at all have to be related to pressing `c` by itself).
Higher precedence, however, has other implications. If I map `⌘⌥c` to an action, for example, `⌘⌥⌃c` must in some
way relate to that, since the presence of two meta-keys in that sequence makes this combination very significant to
our muscle memory, much more so than `c` by itself, whereas `^c` doesn't necessarily need to relate to `c`. Don't
use precedence unnecessarily, it's always easier to escalate it than to revert it.

### Existing Problems and Remedies

#### Problem 1: Converging Environments
Most keyboard shortcuts predate our century. They were chosen in a vacuum without thought (or need) of how they'd interact with shortcuts from other systems. Today, that environments have merged, and many of us find ourselves switching between them routinely, these interactions suddenly matter - both for our muscle memory's sake and our own memory's sake.

For example, `^C` (Ctrl+C) was used on Unix terminals to terminate existing command for decades. In a different world, on Windows, developers have decided to use the same shortcut to copy selection, a sane choice given its convenient location (along with Ctrl+V and Ctrl+X, which are right next to it). This worked wonderfully until we merged the GUI and terminal worlds together. OSX managed to bypass this problem by using `⌘C` instead. But that created a new problem, where we now have inconsistent ways to copy between Windows, OSX, and Linux (`^C` in Windows and Linux GUI, `^⇧C` in Linux terminal, and `⌘C` on OSX in GUI and terminal).

#### Problem 2: Use of Gaps
When a user wants to define a macro for themselves, it's natural to take a key combination he/she knows isn't used for anything else. In fact, this is exactly what happens with vim users everyday. This also happens with terminal/screen/tmux users (how were `^A` and `^B` combos chosen?). And more recently this trend also started happening with window managers and shortcut/macro tools for the GUI.

This is a sensible approach for a single individual, but it doesn't scale. Problems arise when the user realizes that this macro is impossible on a different OS/environment because of an existing limitation or conflict. Conflicts may also arise when user merges this config with that of another user or starts mapping more related functionality to other nearby keys, which may already be in use.

#### Problem 3: System Limitations
Some sequences may be part of the environment on such a low level that the user has no chance of modifying them. I assume such sequences are rare, especially thanks to low-level tools that can hook into system-level logic like `xbindkeys`, `xdotool`, `xte`, `Karabiner`, and `AutoHotKey`.

#### Problem 4: Apps Unable to Detect Keys
Most GUI apps can easily interact with just about all key sequences, and if not, apps like `AutoHotKey`, `xdotool` or `Karabiner` can often remedy that. With lower-level environments, like the terminal, this may be more of an issue. This can be partially remedied via smart terminals like `urxvt` and `iTerm2`, which can simulate any key sequence. I typically map the annoying sequence to unicode and use that in apps like vim instead. This is not, however, possible in tmux, yet, which doesn't support unicode binds.

#### Systematic Solution
I'll use what I'll coin as "The Dvorak Approach":

- Problem 3: these cases should be documented and we'll work around them
- Problem 4: these should also be worked around and documented, when possible we'll use the environment (i.e. the terminal) to fake a different event which we may be able to respond to better
- Problem 2: ignore personal preferences/bindings altogether, you'll have to relearn a new standard but will be rewarded with tremendous productivity gain as a result (like w/ Dvorak)
- Problem 1: take these preferences into consideration, but remap them if needed and/or if they conflict our system

Why do I call it "The Dvorak Approach"? Because it's not for everyone. Some will disagree with my reasons, some may disagree with my choices, and many others will consider remapping system defaults as sacrilege. Unfortunately the masses fall into this last group that refuses to to admit merit in new ideas until it's glaringly obvious that it's superior to the old methods. But if you're crazy enough not to accept the status quo, if you're crazy enough to realize there are huge productivity gains to standardizing your input system across your environments, if you're crazy enough not to follow the lemmings, then join me in this project and help me make tomorrow better than today. After all, that's how jQuery, Ruby on Rails, Python, lisp, and personal computers started, by challenging the status quo and ignoring assumptions of the masses.

#### Tools Available to Us
There are a number of tools that help us bring sanity to our environment and undo the damage already there, this list is a starting point to save time:

Environment | Tool | Description
------------|------|------------------
OSX | Karabiner | Low-level key remap (can differentiate left vs right ctrl, etc.)
OSX | Hammerspoon | GUI automation, higher level key remap for OS (lua scripting, compatible with AppleScript)
OSX Terminal | iTerm2 | Remap keys in user profile to send different (and unicode) sequences to your terminal
Linux | xbindkeys | Key simulation for Linux, I've had issues triggering this from Awesome WM
Linux | awesome | tiling window manager, GUI automation
Linux | xdotool | Key simulation for Linux, I've had issues triggering this from Awesome WM
Linux Terminal | urxvt | Remap keys in user profile to send different (and unicode) sequences to your terminal
Linux Terminal | xterm | Remap keys in user profile to send different (and unicode) sequences to your terminal
Windows | AutoHotKey | Remap keys for OS, allows low-level remapping too
Windows Terminal | [Putty-X](https://github.com/atsepkov/putty-X) | A putty fork that attempts to mimic urxvt and reads your Xresources file, trying to reproduce what it can, can be used as local cygwin terminal or remote
Chrome | [Shortkeys Extension](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck?hl=en) | Remap Chrome shortcuts
Terminal Shell | tmux | tiling shell-session manager, automator
Terminal Shell | tmuxinator | automation via tmux and config files


## Basic Choices
The choices we make can be arbitrary or well-reasoned. If that reason is not documented, however, that choice will seem arbitrary
to others or even yourself in the future. And if you no longer remember the reason, it's no better than an arbitrary choice.
And arbitrary choice should always give way to a well-reasoned choice unless the pain of switching is too high (which is in
itself a reason). This section attempts to remedy that by stating my reasons for each choice. This list will probably get
expanded in the future and perhaps even modified if I (or the community) decides that a certain reason is invalid. With that said,
here are the choices:

Index | Rule         | Reason
----- | -------------|--------
C1    | Use of Shift (⇧) |
C1.0  | For operations that have opposite operation, use `Shift` for the reverse operation | Easier to remember than a new shortcut, already consistent with `Ctrl+Z/Ctrl+Shift+Z`, `Ctrl+Tab/Ctrl+Shift+Tab`
C1.1  | When movement is involved, `Shift` should move the object of interest, lack of shift should move the user in relation to the object of interest | `Shift` is a synonym for move, and is often used this way in tiling WMs (awesome, Hammerspoon)
C1.2  | Any `Shift` action should in some way relate to the same action without holding `Shift` | `Shift` is a "weaker" metakey than others, user expects its effect to be subtle
C2    | Use of Ctrl (⌃) |
C3    | Use of Alt (⌘) |
C4    | Use of Mod (⌘) |


## Manifest
Here I define the rules that each shortcut must abide by, as well as how to approach each app/OS from consistency perspective.

### Movement
It's universal to accept arrow keys for movement. There are a few other movements typically a bit less universal but often just as widely used:

Keys | Action
-----|-------------
Arrows | Movement of user's viewport (cursor, focused window, focused object, etc.)
Home | Move user's viewport to the beginning of context
End | Move user's viewport to the end of context
PgUp | Move user's viewport one page up in the 'document', document is typically the grandparent context
PgDn | Move user's viewport one page down in the 'document', document is typically the grandparent context
Tab | Cycle through context-related options
Shift+Tab | Cycle through context-related options backwards
Numpad | 2-D object arrangement within context (note that some keyboards lack numpad, so your interface should be able to do without it)

### Object Manipulation
Most things on your desktop can be thought of as `object`s. A window on a desktop is an object. A word in a sentence is an object. A sentence in a paragraph is an object. A paragraph in a body of text is an object. Likewise, for each of those objects there is a corresponding `context`. In the above 5 examples, the contexts are desktop, sentence, paragraph, and text body.

When we think of everything in terms of objects, we can define consistent shortcuts and allow the user to easily discover those shortcuts simply by experimenting with the model they already know (in a new context). This section attempts to define that model. I will then follow this model in word management, sentence management, window management, and so on - stacking it with appropriate context modifiers.

For "object within context" manipulation, I propose the following rules, which some members of Hammerspoon and Awesome WM communities already follow:

Meta | Keys       | Result
---------|------------------
      | Arrow Keys | Move user's viewpoint around the context / Switch object of interest
Shift | Arrow Keys | Move object of interest within context
Ctrl  | Letters | Modifications to object or context in relation to given context

### Higher Precedence for Higher Level of Abstraction
Due to terminal shell's typical inability to see higher-order keys like `Windows` key, these higher precedence keys should be relied on less in these limited contexts, instead we should reserve them for the GUI. Here is a convention I propose:

Modifier | Context
---------|----------------
         | Lowest level / text entry
Shift    | Subtle modifier to existing combo or another meta key (perform related or reverse action)
Ctrl     | Modify focused object in relation to current context (still text entry)
Alt/Option | Alter context (typically modify context in relation to parent context as if it itself was now the object of interest) (this can be current tab or paragraph, we're typically approaching GUI land at this point - but not quite in GUI yet)
Windows/Command | Manipulate the GUI container (this modifier treats current window as `object` instead of the text inside of it)

Note that the above modifiers can (and probably will) stack. For example, `Shift+Left` will swap the word under cursor in vim with one to the left, while `Windows+Shift+Left` will swap the current window with one to the left of it (or push current window to the left half of the screen if you're not in tiling mode/WM). `Ctrl+Arrow` may jump to previous/next word, while `Windows+Ctrl+Arrow` may jump to different desktop.

Note that there are already several system-level violations to this:

- Ctrl+Tab is used to cycle through tabs in many apps, the more consistent combo would be Alt+Tab
- Alt+tab switches between current apps, the more consistent combo would be Windows+Alt+Tab
