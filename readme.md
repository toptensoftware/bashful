# Bashful

Setting up a nice Bash prompt in Windows.

![Screen Shot](screenshot@2x.png)



## Background

Recently I decide to switch to using bash on windows.  After years of mixing, Windows
with cmd.exe and Linux with bash, I decided to settle on one and stick with it... and
of course bash was the obvious choice.

This repo is mainly so I can reproduce this setup on new machines, but feel free to
copy or suggest other improvements.



## Windows Terminal

Window Terminal is the way to go.  If you don't have, [get it](https://learn.microsoft.com/en-us/windows/terminal/install).



## Git Bash

At first I was going to use bash that comes with Windows, but I think Git Bash is better
configured out of the box.  Here's the changes I made.

1. Run Windows Terminal and choose the "Git Bash" prompt profile (it should appear
   automagically).

2. With text editor (code, vi, whatever...) open `~/.bashrc` and add the following to get a more concise
   prompt (just path and git status) and make `ls` list all files, in long form, with human
   readable file sizes.

    ```bash
    export PS1='\[\033]0;bash $PWD\007\]\n\[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]$ '

    alias ls='ls -alh'
    ```

   Or, copy the file from this repository.

3. With text editor, open `~/.inputrc` and add.  This stops the super annoying window flash
   and/or bell, enables case insensitive tab completion and makes tab completion similar to 
   how cmd.exe tab completion works (which I prefer).

    ```
    set bell-style none
    set completion-ignore-case On
    TAB: menu-complete
    "\e[Z": menu-complete-backward
    ```

   Or, copy the file from this repository


4. Restart Windows Terminal for changes to take effect.



## Make it Look Better

Now, let's make it look nicer:

1. Start Windows Terminal.
2. Bring up Settings (Ctrl+,) and then Click Open JSON File.  (Or just press Ctrl+Shift+,)
3. Make the changes below

In the root settings section, usually at end of the file before the last closing brace add this:

```json    
"centerOnLaunch": true,
```

(Without this Windows Terminal sometimes loads partially offscreen).

In the section `{ "profiles": { "list": [ ] } } `, replace the existing
Git Bash entry with the following (adjust starting directory as appropriate).

The 128x128.png is [available here](https://github.com/odb/official-bash-logo) or copy it from this repository.

```json
"list": 
[
    {
        "colorScheme": "Campbell on Green",
        "commandline": "C:\\Program Files\\Git\\bin\\bash.exe",
        "guid": "{4e6ab04a-722b-4a51-962f-e0d099e44d51}",
        "hidden": false,
        "icon": "C:\\Program Files\\Git\\128x128.png",
        "name": "Bash",
        "opacity": 90,
        "startingDirectory": "C:\\Users\\Brad\\Projects",
        "tabColor": "#0b6008",
        "useAcrylic": false
    },
]
```

In the section `{ "schemes": [ ] } `, section add the following. (This is the default Campbell 
color scheme but with a dark green background).

```json
{
    "background": "#002000",
    "black": "#0C0C0C",
    "blue": "#0037DA",
    "brightBlack": "#767676",
    "brightBlue": "#3B78FF",
    "brightCyan": "#61D6D6",
    "brightGreen": "#16C60C",
    "brightPurple": "#B4009E",
    "brightRed": "#E74856",
    "brightWhite": "#F2F2F2",
    "brightYellow": "#F9F1A5",
    "cursorColor": "#FFFFFF",
    "cyan": "#3A96DD",
    "foreground": "#CCCCCC",
    "green": "#13A10E",
    "name": "Campbell on Green",
    "purple": "#881798",
    "red": "#C50F1F",
    "selectionBackground": "#FFFFFF",
    "white": "#CCCCCC",
    "yellow": "#C19C00"
}
```

Finally, replace the `"defaultProfile"` setting to set the default profile:

```json
"defaultProfile": "{4e6ab04a-722b-4a51-962f-e0d099e44d51}",
```

See `settings.json` in this repo for full file example (but you probably don't want
to just overwrite your file as it likely has other profiles configured that you 
might want to keep).


