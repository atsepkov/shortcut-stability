# Shortcut Stability
I love keyboard shortcuts, what I don't love is when they conflict between apps/OSes. You are probably a victim of this too. 
For example:

- Did you recently switch to a Mac only to discover that all `Ctrl+*` shortcuts have changed to `Mod+*`?
- Did you accidentally use `Ctrl+C` in Linux terminal only to see that it terminates current process instead of copying?
- Do you fight with your shortcuts when switching between vim/sublime/atom?
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


## Key Names
For brevity and consistency between OSes I will use key logos instead of their longer names. 
Symbols taken from [here](https://wincent.com/wiki/Unicode_representations_of_modifier_keys)

### Meta Keys
⌘ - Windows/Command/Mod Key
⌥ - Alt/Option Key
⌃ - Control Key
⇧ - Shift Key

I've ordered the keys (in my opinion) from highest to lowest precedence. Lower precedence means that the meta-behavior
should be similar to that without this meta key. Higher precedence means that we have more leeway with what we are
allowed to do with the given key combo (i.e. `Windows+c` does not at all have to be related to pressing `c` by itself).
Higher precedence, however, has other implications. If I map `⌘⌥c` to an action, for example, `⌘⌥⌃c` must in some
way relate to that, since the presence of two meta-keys in that sequence makes this combination very significant to
our muscle memory, much more so than `c` by itself, whereas `^c` doesn't necessarily need to relate to `c`. Don't
use precedence unnecessarily, it's always easier to escalate it than to revert it.


## Basic Choices
The choices we make can be arbitrary or well-reasoned. If that reason is not documented, however, that choice will seem arbitary
to others or even yourself in the future. And if you no longer remember the reason, it's no better than an arbutrary choice.
And arbitrary choice should always give way to a well-reasoned choice unless the pain of switching is too high (which is in
itself a reason). This section attempts to remedy that by stating my reasons for each choice. This list will probably get
expanded in the future and perhaps even modifed if I (or the community) decides that a certain reason is invalid. With that said,
here are the choices:

Index | Rule         | Reason
----- | -------------|--------
C0    | ^ vs ⌘  | -
C0.0  | Use ⌘ for text manipulation (`⌘[CVAX]` vs `^[CVAX]) | It doesn't conflict with ^C in Linux terminals, I find working w/ terminal on OSX much more enjoyable because of this
C1    | Use of Shift (⇧) |
C1.0  | For operations that have opposite operation, use `Shift` for the reverse operation | Easier to remember than a new shortcut, already consistent with `Ctrl+Z/Ctrl+Shift+Z`, `Ctrl+Tab/Ctrl+Shift+Tab`
C1.1  | When movement is involved, `Shift` should move the object of interest, lack of shift should move the user in relation to the object of interest | `Shift` is a synonym for move, and is often used this way in tiling WMs (awesome, Hammerspoon)
C1.2  | Any `Shift` action should in some way relate to the same action without holding `Shift` | `Shift` is a "weaker" metakey than others, user expects its effect to be subtle
C2    | Use of Ctrl (⌃) |
C3    | Use of Alt (⌘) |
C4    | Use of Mod (⌘) |


## Manifest
Here I define the rules that each shortcut must abide by, as well as how to approach each app/OS from consistency perspective.
