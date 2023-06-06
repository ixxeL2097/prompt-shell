# prompt-shell
General repo for prompt shell usage and tips
# 01 - Starship prompt

install:
```bash
curl -sS https://starship.rs/install.sh | sh
```

You will need `JetBrainsMono Nerd Font` for this setup:
- https://www.nerdfonts.com/font-downloads

To install it on linux, just create the directory `~/.fonts` and execute command:
```bash
fc-cache -fv
```

For fish shell, add configuration in `~/.config/fish/config.fish`:
```bash
set distro (awk '/^ID=/' /etc/*-release | awk -F '=' '{print tolower($2)}')
switch $distro
  case '*alpine*'
    set ICON " "
  case '*arch*'
    set ICON " "
  case '*centos*'
    set ICON " "
  case '*debian*'
    set ICON " "
  case '*fedora*'
    set ICON " "
  case '*gentoo*'
    set ICON " "
  case '*manjaro*'
    set ICON " "
  case '*linuxmint*'
    set ICON " "
  case '*opensuse*'
    set ICON " "
  case '*raspbian*'
    set ICON " "
  case '*rhel*'
    set ICON " "
  case '*ubuntu*'
    set ICON " "
  case '*'
    set ICON " "
end

set -gx STARSHIP_DISTRO $ICON
set -gx PATH $PATH $HOME/.krew/bin

kubectl completion fish | source
starship init fish | source
```

Configuration for the prompte Starship `~/.config/starship.toml`:
```toml
# ~/.config/starship.toml

# Inserts a blank line between shell prompts
add_newline = false

# Change the default prompt format
format = """\
[╭╴](238)$env_var\
$all[╰─](238)$character"""

# Change the default prompt characters
[character]
success_symbol = "[](238)"
error_symbol = "[](238)"

# Shows an icon that should be included by zshrc script based on the distribution or os
[env_var.STARSHIP_DISTRO]
format = '[$env_value](bold white)'  # removed space between distro and rest for pwsh
variable = "STARSHIP_DISTRO"
disabled = false

# Shows the hostname
[hostname]
ssh_only = false
format = '[$ssh_symbol$hostname]($style) '
style = 'bold blue'
disabled = false
ssh_symbol = '🔐'

# Shows the username
[username]
style_user = "green bold"
style_root = "red bold"
format = "[$user]($style)@"
disabled = false  # disable in powershell
show_always = true

[directory]
truncation_length = 3
truncation_symbol = "…/"
home_symbol = " ~"
read_only_style = "197"
read_only = "  "
format = "at [ $path]($style)[$read_only]($read_only_style) "

[git_branch]
symbol = " "
format = "on [$symbol$branch]($style) "
truncation_length = 4
truncation_symbol = "…/"
style = "bold green"

[git_status]
format = '[\($all_status$ahead_behind\)]($style) '
style = "bold green"
conflicted = "🏳"
up_to_date = " "
untracked = " "
ahead = "⇡${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
behind = "⇣${count}"
stashed = " "
modified = " "
staged = '[++\($count\)](green)'
renamed = "襁 "
deleted = " "

[terraform]
format = "via[🚀terraform $version]($style) 壟 [$workspace]($style) "

[vagrant]
format = "via[🚀vagrant $version]($style) "

[docker_context]
format = "via[ $context](bold blue) "

[helm]
format = "via[☸️$version](bold purple) "

[package]
format = 'is [$symbol$version]($style) '
symbol = '📦'
style = '208 bold'
display_private = false
disabled = false
version_format = 'v${raw}'

[python]
symbol = " "
python_binary = "python3"

[nodejs]
format = "via[ $version](bold green) "
disabled = true

[ruby]
format = "via[ $version]($style) "

[kubernetes]
format = 'on[⚓️$context](bold purple)[\[$namespace\]](bold red) '
disabled = false
[kubernetes.context_aliases]
"kubernetes-admin@kubernetes" = "k8s-fredcorp"
"clcreative-k8s-production" = "cl-k8s-prod"

# OS symbols
[os.symbols]
Alpine = " "
Amazon = " "
Android = " "
Arch = " "
CentOS = " "
Debian = " "
DragonFly = " "
Emscripten = " "
EndeavourOS = " "
Fedora = " "
FreeBSD = " "
Garuda = "﯑ "
Gentoo = " "
HardenedBSD = "ﲊ "
Illumos = " "
Linux = " "
Macos = " "
Manjaro = " "
Mariner = " "
MidnightBSD = " "
Mint = " "
NetBSD = " "
NixOS = " "
OpenBSD = " "
openSUSE = " "
OracleLinux = " "
Pop = " "
Raspbian = " "
Redhat = " "
RedHatEnterprise = " "
Redox = " "
Solus = "ﴱ "
SUSE = " "
Ubuntu = " "
Unknown = " "
Windows = " "
```

improved profile:
```toml
# ~/.config/starship.toml

# Inserts a blank line between shell prompts
add_newline = false
scan_timeout = 30
command_timeout = 500

format = """\
[](fg:yellow)\
$os\
$username\
$kubernetes\
$helm\
$directory\
${custom.git_server}\
${custom.git_last_commit}\
$git_branch\
$git_state\
$git_status\
$package\
$hg_branch\
$c\
$elixir\
$elm\
$golang\
$gradle\
$haskell\
$java\
$julia\
$nodejs\
$nim\
$rust\
$scala\
$docker_context\
$aws\
$gcloud\
$azure\
$time\
$line_break\
$character"""

# Set 'foo' as custom color palette
palette = 'ixxel'

# Define custom colors
[palettes.ixxel]
# Overwrite existing color
black = '#000000'
white = '#E0DEF4'
yellow = '#F3AE35'
yellow-gcp = '#F4B400'
flash = '#ebcc34'
orange = '#F07623'
grey = '#262B44'
blue = '#4B95E9'
calmblue = '#2f52a4'
niceblue = '#0077c2'
green = '82'
pine = '#01796F'
red = '#D81E5B'
purple = '#A020F0'
violet = '92'
magenta = '#ff00ff'
cyan = '#00FFFF'
ferrari = '#ff2800'
antracite = '#353C40'
electric = '#0892d0'
navy = '#000080'
teal = '#008081'
none = '#FFFFFF00'

[os]
style = "fg:ferrari bg:yellow"
disabled = false

[username]
style_user = "fg:black bg:yellow"
style_root = "fg:red bg:yellow"
format = '[$user]($style)'
disabled = false
show_always = true

# Shows the hostname
[hostname]
ssh_only = false
format = '[|$ssh_symbol$hostname ]($style)'
style = "fg:black bg:yellow"
disabled = false
ssh_symbol = '🔐'

[directory]
style = "fg:black bg:antracite"
truncation_length = 1
truncation_symbol = "…/"
home_symbol = " ~"
read_only_style = "197"
read_only = "  "
format = "[](bg:antracite fg:black)[  $path ]($style)[$read_only]($read_only_style)[](fg:antracite)"

[git_branch]
format = "[](bg:electric fg:ferrari)[ $symbol$branch ]($style)"
symbol = " "
style = "bg:ferrari fg:black"
truncation_length = 16
truncation_symbol = "…/"

[git_state]
format = '\( [$state( $progress_current/$progress_total)]($style)\)'
style = "bold purple"

[git_status]
style = ""
#format = '(->\[[$all_status$ahead_behind]($style)\])'
format = '([](bg:ferrari fg:grey)[$all_status$ahead_behind]($style)[](fg:grey))'
up_to_date = '[ ](fg:green bg:grey)'
conflicted = '[  ](fg:red bg:grey)[$count ](fg:white bg:grey)'
ahead = '[ ﯁ ](fg:green bg:grey)[$count ](fg:white bg:grey)'
behind = '[ ﮾ ](fg:orange bg:grey)[$count ](fg:white bg:grey)'
diverged = '[  ](fg:purple bg:grey)[ ﯁ ](fg:green bg:grey)[$ahead_count](bg:white bg:grey)[ ﮾ ](fg:orange bg:grey)[$behind_count](bg:white bg:grey)'
untracked = '[ ](fg:purple bg:grey)[$count ](fg:white bg:grey)'
stashed = '[ ](fg:yellow bg:grey) [$count ](fg:white bg:grey)'
modified = '[  ](fg:orange bg:grey)[$count ](fg:white bg:grey)'
#modified = '\[[ ](bright-yellow)[$count](bright-white bold)\]'
staged = '[  ](fg:green bg:grey)[$count ](fg:white bg:grey)'
renamed = '[  ](fg:cyan bg:grey) [$count ](fg:white bg:grey)'
deleted = '[ ](fg:ferrari bg:grey)[$count ](fg:white bg:grey)'

[gcloud]
style = 'fg:black bg:131'
symbol2 = '🇬️ '
symbol = ' '
format = '[](fg:131)[$symbol$account(@$domain)(\($project\))]($style)[](fg:131)'

################################################################################
## Custom Commands
################################################################################

[custom.git_server]
command = """
URL=$(command git ls-remote --get-url 2> /dev/null)
if [[ "$URL" =~ "github" ]]; then
    ICON=" "
elif [[ "$URL" =~ "gitlab" ]]; then
    ICON=" "
elif [[ "$URL" =~ "bitbucket" ]];then
    ICON=" "
elif [[ "$URL" =~ "kernel" ]];then
    ICON=" "
elif [[ "$URL" =~ "archlinux" ]];then
    ICON=" "
elif [[ "$URL" =~ "gnu" ]];then
    ICON=" "
elif [[ "$URL" =~ "git" ]];then
    ICON=" "
else
    ICON=" "
    URL="localhost"
fi
for PATTERN in "https" "http" "git" "://" "@"; do
    [[ "$URL" == "$PATTERN"* ]] && URL="${URL##$PATTERN}"
done
for PATTERN in "/" ".git"; do
    [[ "$URL" == *"$PATTERN" ]] && URL="${URL%%$PATTERN}"
done
URL=${URL#*:}
#printf "%s%s" "$ICON" "$URL"
printf "%s" "$ICON"
"""
directories = [".git"]
when = 'git rev-parse --is-inside-work-tree 2> /dev/null'
shell = ["bash","--norc","--noprofile"]
style = "bg:black fg:white"
format = "[](fg:black)[$output ]($style)[](bg:black fg:black)"

[custom.git_last_commit]
disabled = false
description = "Display last commit hash and message"
command = "git show -s --format=' %h'"
directories = [".git"]
when = 'git rev-parse --is-inside-work-tree 2> /dev/null'
shell = ["bash","--norc","--noprofile"]
style = "bg:electric fg:black"
format = "[](bg:black fg:electric)[$output ]($style)"

[character] # The name of the module we are configuring is 'character'
#success_symbol = '[](fg:pine)'
#error_symbol = "[](fg:red)"
success_symbol = '[λ](fg:pine)'
error_symbol = "[λ](fg:red)"

[terraform]
format = "via[ terraform $version]($style) 壟 [$workspace]($style) "
symbol = ' '
[vagrant]
format = "via[🚀vagrant $version]($style) "

[docker_context]
format = "via[ $context](bold blue) "

[helm]
format = "[](bg:violet fg:black)[ $version](bg:violet fg:black)[](bg:black fg:violet)"
symbol = '☸️  '

[package]
format = '[](fg:teal)[  $version]($style)[](fg:teal)'
symbol = '📦'
style = 'bg:teal fg:black'
display_private = true
disabled = false
version_format = 'v${raw}'

[python]
symbol = " "
python_binary = "python3"

[nodejs]
format = "via[ $version](bold green) "
disabled = true

[ruby]
format = "via[ $version]($style) "

[kubernetes]
format = "[](bg:orange fg:yellow)[󰠳 $context](bg:orange fg:black)[ 󰀽 $namespace](bg:orange fg:black)[](bg:black fg:orange)"
disabled = false
symbol = '⚓ 󱃾 󰠳  '
[kubernetes.context_aliases]
"kubernetes-admin@kubernetes" = "k8s-fredcorp"
"clcreative-k8s-production" = "cl-k8s-prod"

# OS symbols
[os.symbols]
Alpine = " "
Amazon = " "
Android = " "
Arch = " "
CentOS = " "
Debian = " "
DragonFly = " "
Emscripten = " "
EndeavourOS = " "
Fedora = " "
FreeBSD = " "
Garuda = "﯑ "
Gentoo = " "
HardenedBSD = "ﲊ "
Illumos = " "
Linux = " "
Macos = " "
Manjaro = " "
Mariner = " "
MidnightBSD = " "
Mint = " "
NetBSD = " "
NixOS = " "
OpenBSD = " "
openSUSE = " "
OracleLinux = " "
Pop = " "
Raspbian = " "
Redhat = " "
RedHatEnterprise = " "
Redox = " "
Solus = "ﴱ "
SUSE = " "
Ubuntu = " "
Unknown = " "
Windows = " "
```

Template for `oh-my-posh`:
```json
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "version": 2,
  "final_space": true,
  "console_title_template": "{{ .Shell }} in {{ .Folder }}",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
	{
	  "type": "shell",
	  "style": "powerline",
	  "powerline_symbol": "",
	  "foreground": "#ffffff",
	  "background": "#0077c2",
	  "properties": {
	    "mapped_shell_names": {
	      "pwsh": "PS"
	    }
	  }
	},	      
	{
	  "type": "os",
	  "style": "powerline",
	  "powerline_symbol": "",
	  "foreground": "#26C6DA",
	  "background": "#546E7A",
	  "template": " {{ if .WSL }}WSL  {{ end }}{{.Icon}} ",
	  "properties": {
	    "macos": "mac"
	  }
	},
	{
	  "type": "dotnet",
	  "style": "powerline",
	  "powerline_symbol": "",
	  "foreground": "#000000",
	  "background": "#00ffff",
	  "template": "  {{ .Full }} "
	},
	{
	  "type": "docker",
	  "style": "powerline",
	  "powerline_symbol": "",
	  "foreground": "#000000",
	  "background": "#0B59E7",
	  "template": "  {{ .Context }} "
	},
	{
	  "type": "kubectl",
	  "style": "powerline",
	  "powerline_symbol": "",
	  "foreground": "#000000",
	  "background": "#ebcc34",
	  "template": " 󰠳 {{.Context}}{{if .Namespace}} 󰀽 {{.Namespace}}{{end}} "
	},
        {
          "type": "command",
          "style": "powerline",
          "powerline_symbol": "",
          "background": "#ebcc34",
          "foreground": "#000000",
          "template": "󰒋 {{ .Output }}",
          "properties": {
            "shell": "bash",
            "command": "kubectl version --short | grep Server | awk -F: '{print $NF}' | sed 's/ //'"
          }
        },
	{
	  "type": "command",
          "style": "powerline",
          "powerline_symbol": "",
	  "background": "#9866C7",
          "foreground": "#000000",
	  "template": " {{ .Output }}",
          "properties": {
            "shell": "bash",
            "command": "helm version --short | awk -F+ '{print $1}'"
          }
        },
        {
          "type": "session",
          "style": "diamond",
          "foreground": "#000000",
          "background": "p:yellow",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "\ue0b0",
          "template": " {{ if .SSHSession }}\ueba9 {{ end }}{{ .UserName }} "
        },
        {
          "type": "path",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "#000000",
          "background": "p:orange",
          "template": " \uea83 {{ path .Path .Location }} ",
          "properties": {
            "style": "folder"
          }
        },
	{
	  "type": "git",
	  "style": "powerline",
	  "powerline_symbol": "",
	  "foreground": "#000000",
	  "background": "p:green",
	  "branch_icon": "\ue725",
	  "background_templates": [
	    "{{ if or (.Working.Changed) (.Staging.Changed) }}p:yellow{{ end }}",
	    "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#FFCC80{{ end }}",
	    "{{ if gt .Ahead 0 }}#B388FF{{ end }}",
	    "{{ if gt .Behind 0 }}#B388FB{{ end }}"
	  ],
	  "template": " {{ .UpstreamIcon }} {{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }}  {{ .StashCount }}{{ end }}",
	  "properties": {
	    "fetch_status": true,
	    "fetch_stash_count": true,
	    "fetch_upstream_icon": true,
	    "untracked_modes": {
	      "/Users/user/Projects/oh-my-posh/": "no"
	    }
	  }
	},
	{
	  "type": "gcp",
	  "style": "powerline",
	  "powerline_symbol": "",
	  "foreground": "#000000",
	  "background": "#47888d",
	  "template": " {{.Project}} {{.Account}} "
	},
        {
          "type": "root",
          "style": "powerline",
          "powerline_symbol": "\ue0b0",
          "foreground": "p:white",
          "background": "p:yellow",
          "template": " \uf0e7 "
        },
        {
          "type": "exit",
          "style": "diamond",
          "foreground": "p:white",
          "background": "p:blue",
          "background_templates": [
            "{{ if gt .Code 0 }}p:red{{ end }}"
          ],
          "leading_diamond": "<transparent,background>\ue0b0</>",
          "trailing_diamond": "\ue0b4",
          "template": " {{ if gt .Code 0 }}\uf00d{{ else }}\uf00c{{ end }} ",
          "properties": {
            "always_enabled": true
          }
        },
	{
	  "type": "battery",
	  "style": "powerline",
	  "powerline_symbol": "",
	  "foreground": "#193549",
	  "background": "#ffeb3b",
	  "background_templates": [
	    "{{if eq \"Charging\" .State.String}}#40c4ff{{end}}",
	    "{{if eq \"Discharging\" .State.String}}#ff5722{{end}}",
	    "{{if eq \"Full\" .State.String}}#4caf50{{end}}"
	  ],
	  "template": " {{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }} ",
	  "properties": {
	    "discharging_icon": " ",
	    "charging_icon": " ",
	    "charged_icon": " "
	  }
	},
	{
	  "type": "text",
	  "style": "diamond",
	  "template": "\n λ"
	}
      ]
    },
    {
      "type": "rprompt",
      "segments": [
        {
          "type": "node",
          "style": "plain",
          "foreground": "p:green",
          "background": "transparent",
          "template": "\ue718 ",
          "properties": {
            "display_mode": "files",
            "fetch_package_manager": false,
            "home_enabled": false
          }
        },
        {
          "type": "go",
          "style": "plain",
          "foreground": "p:blue",
          "background": "transparent",
          "template": "\ue626 ",
          "properties": {
            "fetch_version": false
          }
        },
        {
          "type": "python",
          "style": "plain",
          "foreground": "p:yellow",
          "background": "transparent",
          "template": "\ue235 ",
          "properties": {
            "display_mode": "files",
            "fetch_version": false,
            "fetch_virtual_env": false
          }
        },
        {
          "type": "time",
          "style": "plain",
          "foreground": "p:white",
          "background": "transparent",
          "template": "at <p:blue><b>{{ .CurrentDate | date \"15:04:05\" }}</b></>"
        }
      ]
    }
  ],
  "tooltips": [
    {
      "type": "aws",
      "tips": [
        "aws"
      ],
      "style": "diamond",
      "foreground": "p:white",
      "background": "p:orange",
      "leading_diamond": "\ue0b0",
      "trailing_diamond": "\ue0b4",
      "template": " \ue7ad {{ .Profile }}{{ if .Region }}@{{ .Region }}{{ end }} ",
      "properties": {
        "display_default": true
      }
    },
    {
      "type": "az",
      "tips": [
        "az"
      ],
      "style": "diamond",
      "foreground": "p:white",
      "background": "p:blue",
      "leading_diamond": "\ue0b0",
      "trailing_diamond": "\ue0b4",
      "template": " \ufd03 {{ .Name }} ",
      "properties": {
        "display_default": true
      }
    }
  ],
  "transient_prompt": {
    "foreground": "p:black",
    "background": "transparent",
    "template": "<p:yellow,transparent>\ue0b6</><,p:yellow> {{ .Folder }} </><p:yellow,transparent>\ue0b0</> "
  },
  "secondary_prompt": {
    "foreground": "p:black",
    "background": "transparent",
    "template": "<p:yellow,transparent>\ue0b6</><,p:yellow> > </><p:yellow,transparent>\ue0b0</> "
  },
  "palette": {
    "black": "#262B44",
    "blue": "#4B95E9",
    "green": "#59C9A5",
    "orange": "#F07623",
    "red": "#D81E5B",
    "white": "#E0DEF4",
    "yellow": "#F3AE35"
  }
}
```

# 02 - Fish shell

## Install

Fish is a smart & user-friendly command line shell for Linux, macOS, and the rest of the family. You can download it and customize it looking at this link :

- https://fishshell.com/
- https://github.com/fish-shell/fish-shell

```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
```

**Oh-my-fish** is sort of a plugin for fish shell to handle themes and others. Look at this link :

- https://github.com/oh-my-fish/oh-my-fish

install it :
```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

List theme with :
```
omf theme
```

You can then install themes using the `omf` command :

```
omf install shellder
```

If you choose `bobthefish` as a fish theme, you need to install nerd-fonts (https://github.com/ryanoasis/nerd-fonts), and here is the `~/.config/fish/config.fish` file:
```
set -gx PATH $PATH $HOME/.krew/bin
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace yes
set -g theme_display_user yes
set -g theme_display_sudo_user yes
set -g theme_show_exit_status yes
set -g theme_display_git_default_branch yes
```

if you need to override colours with `bobthefish` theme, then add the following snippet to the `~/.config/fish/functions/bobthefish_colors.fish` file :
```bash
function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'

  # Optionally include a base color scheme
  __bobthefish_colors default

  set orange d65d0e
  set brorange fe8019
  set bg2 504945
  set bg3 665c54
  set bg4 7c6f64
  # Then override everything you want!
  # Note that these must be defined with `set -x`
  #set -x color_initial_segment_exit     white red --bold
  #set -x color_initial_segment_su       white green --bold
  #set -x color_initial_segment_jobs     white blue --bold

  set -x color_path                     black white
  set -x color_path_basename            black white
  #set -x color_path_nowrite             magenta black
  #set -x color_path_nowrite_basename    magenta black --bold

  #set -x color_repo                     brgreen black --bold
  #set -x color_repo_work_tree           black black --bold
  #set -x color_repo_dirty               brred black
  #set -x color_repo_staged              yellow black

  #set -x color_vi_mode_default          brblue black --bold
  #set -x color_vi_mode_insert           brgreen black --bold
  #set -x color_vi_mode_visual           bryellow black --bold

  #set -x color_vagrant                  brcyan black
  set -x color_k8s                      brred black
  set -x color_username                 blue white --bold
  #set -x color_hostname                 white black
  #set -x color_rvm                      brmagenta black --bold
  #set -x color_virtualfish              brblue black --bold
  #set -x color_virtualgo                brblue black --bold
  #set -x color_desk                     brblue black --bold
end
```

## VScode integration

VSCode will probably not display fonts correctly. To fix this, just open the settings JSON by pressing `F1` then typing `Open Settings (JSON)` and then populate the json file with followings:

```json
{
    "workbench.colorTheme": "Default Dark+",
    "terminal.integrated.fontFamily": "MesloLGL Nerd Font" ,
    "terminal.integrated.rendererType": "canvas"
}
```

```json
{
    "workbench.colorTheme": "Default Dark+",
    "terminal.integrated.fontFamily": "JetBrainsMono Nerd Font",
    "workbench.colorCustomizations": {
        "list.errorForeground": "#b3e5ec",
        "list.warningForeground": "#00d9ff",
        "gitDecoration.modifiedResourceForeground": "#00ffb3",
        "gitDecoration.untrackedResourceForeground": "#f7aeae"
    },
    "explorer.decorations.badges": true,
    "explorer.decorations.colors": true,
    "explorer.confirmDragAndDrop": false
}
```

## Functions

To create functions execute following commands :

```bash
function k --wraps kubectl
  kubectl $argv
end
```

then :

```bash
funcsave k
```

functions will be saved as file in `~/.config/fish/functions` directory.

If you want to delete function, you can use following cmd :

```
functions --erase k
```

To create alias execute following commands:
```bash
function bat
  command bat --paging=never $argv
end
```

then :
```bash
funcsave bat
```
vcluster function:
```
function vk --wraps=vcluster
  vcluster $argv
end
```

kubernetes useful functions:
```
function keti --wraps=kubectl-exec-it
  kubectl exec -it $argv
end
```
```
function kd --wraps=kubectl-describe
  kubectl describe $argv
end
```
```
function kg --wraps=kubectl-get
  kubectl get $argv
end
```

## Plugin manager
### Fisher : fish plugin manager

To handle plugins, you can install `Fisher` :

```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

- https://github.com/jorgebucaran/fisher


### Krew : kubectl plugin manager

Krew is the package manager for kubectl plugins.

- https://github.com/kubernetes-sigs/krew/

Quickstart:
- https://krew.sigs.k8s.io/docs/user-guide/quickstart/

Install:
- https://krew.sigs.k8s.io/docs/user-guide/setup/install/

List of plugins: 
- https://krew.sigs.k8s.io/plugins/


For fish, use these steps to install.
  - Run this command in your terminal to download and install krew:
```bash
begin
  set -x; set temp_dir (mktemp -d); cd "$temp_dir" &&
  set OS (uname | tr '[:upper:]' '[:lower:]') &&
  set ARCH (uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/') &&
  set KREW krew-$OS"_"$ARCH &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/$KREW.tar.gz" &&
  tar zxvf $KREW.tar.gz &&
  ./$KREW install krew &&
  set -e KREW; set -e temp_dir
end
```
  - Add the $HOME/.krew/bin directory to your PATH environment variable. To do this, update your config.fish file and append the following line:
```bash
set -gx PATH $PATH $HOME/.krew/bin
```

And add it to the ` ~/.config/fish/config.fish` file:
```bash
echo 'set -gx PATH $PATH $HOME/.krew/bin' >> ~/.config/fish/config.fish
```

  - Test your command :
```
kubectl krew
```

## Plugins

List of plugins :
- https://www.rockyourcode.com/fish-plugins-i-like/
- https://github.com/jorgebucaran/awsm.fish

### Fish ssh-agent

Utility functions to start your ssh agent when using fish shell. You will only need to run `ssh-add` and type your password once, after the running ssh_agent should do the work for you.

- https://github.com/danhper/fish-ssh-agent

```
fisher install danhper/fish-ssh-agent
```

Then you can directly use `ssh-add` :
```
ssh-add /home/fred/.ssh/wsl_github.pub
ssh-add /home/fred/.ssh/wsl_github
```

### Fuzzy Finder 

Fuzzy Finder or `fzf` is a general purpose command line tool to find anything faster, be it your files or the command history.

- https://github.com/jethrokuan/fzf#usage

```
fisher install jethrokuan/fzf
```

You may have to install `fzf` package as well:
```
apt install fzf
```

or :
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Shortcut:
| Legacy      | New Keybindings | Remarks                                         |
| ----------- | --------------- | ----------------------------------------------- |
| Ctrl-t      | Ctrl-o          | Find a file.                                    |
| Ctrl-r      | Ctrl-r          | Search through command history.                 |
| Alt-c       | Alt-c           | cd into sub-directories (recursively searched). |
| Alt-Shift-c | Alt-Shift-c     | cd into sub-directories, including hidden ones. |
| Ctrl-o      | Alt-o           | Open a file/dir using default editor ($EDITOR)  |
| Ctrl-g      | Alt-Shift-o     | Open a file/dir using xdg-open or open command  |


### Kubectl auto-completion

Useful plugin is the kubectl completion that you can find here :

- https://github.com/evanlucas/fish-kubectl-completions

```
fisher install evanlucas/fish-kubectl-completions
```

### Kubectx/Kubens

Kubextc and Kubens tools are very useful for managing kubernetes cluster :

- https://github.com/ahmetb/kubectx

`kubectx` is a tool to switch between contexts (clusters) on kubectl faster.

`kubens` is a tool to switch between Kubernetes namespaces (and configure them for kubectl) easily.

To install `kubens` and `kubectx` with `krew` plugin manager, just execute following commands :

```
kubectl krew install ctx
kubectl krew install ns
```

And then use following commands to use it :
```
kubectl ns
kubectl ctx
```

### Kubectl neat
Kubectl neat allows to avoid managed fields displaying:
- https://github.com/itaysk/kubectl-neat

Install with krew:
```
kubectl krew install neat
```

### Kubectl datree
This kubectl plugin extends the Datree CLI's capabilities to allow scanning resources within your cluster for misconfigurations.
- https://github.com/datreeio/kubectl-datree

Install with krew:
```
kubectl krew install datree
```

### Kubectl whoami
kubectl-whoami is a kubectl plugin that show the subject that's currently authenticated as.
- https://github.com/rajatjindal/kubectl-whoami

Install with krew:
```
kubectl krew install whoami
```

### Kubectl kubecm
Manage your kubeconfig more easily.
- https://github.com/sunny0826/kubecm

Install with krew:
```
kubectl krew install kc
```

### NVM fish
This tool helps you manage multiple active versions of Node on a single local environment. Quickly install and switch between runtimes without cluttering your home directory or breaking system-wide scripts.

- https://github.com/jorgebucaran/nvm.fish

Install with fisher:
```
fisher install jorgebucaran/nvm.fish
```

Install latest LTS node version and display:
```
nvm install lts
nvm list
nvm current
```

### Kubectl ktop
A top-like tool for your Kubernetes cluster
- https://github.com/vladimirvivien/ktop

Install with krew:
```
kubectl krew install ktop
```

### Kubectl view-allocation
kubectl plugin lists allocations for resources (cpu, memory, gpu,...) as defined into the manifest of nodes and running pods. It doesn't list usage like kubectl top. It can provide result grouped by namespaces, nodes, pods and filtered by resources'name.
- https://github.com/davidB/kubectl-view-allocations

Install with krew:
```
kubectl krew install view-allocations
```

### Kubectl spy

- https://github.com/huazhihao/kubespy

kubespy is a kubectl plugin to debug a running pod. It creates a short-lived spy container, using specified image containing all the required debugging tools, to "spy" the target container by joining its OS namespaces. So the original target container image can keep clean without sacrificing the convenience for debugging on demand.

Install with krew:
```
kubectl krew install spy
```

# 02 - Git

To visualize git more efficiently, you can use some plugins. Like git-graph for example:
- https://github.com/mlange-42/git-graph

```console
[root@workstation ~ ]$ git-graph --style round --model simple                                                    
         ●      77b981c (HEAD -> release/4.0, origin/release/4.0) new docker img build pipeline
         ●      411baf3 updated precommit
         ●      10e9700 maj from 12july
         ●      dc1bcea using env dedicated app name
       ● │      75760c6 (origin/release/3.1) using env dedicated app name
       ╰─┤
         ●      b197e62 going back to release ref
         ●      1901446 [v3.1.0] prepare main merge
     ○<╮ │      95fad7e (main, origin/main) Merge branch 'release/3.1' into 'main'
     │ ● │      f1df601 prepare main merge
     │ ├─╯
     │ ○<╮      cbc151d Merge branch 'release/3.0' into 'main'
     │ │ │ ●    06f47e0 (origin/release/3.0) added new build pipeline
     ○<┼─┤ │    da16367 Merge branch 'release/3.0' into 'main'
     ├─╯ │ │
     │   ● │    67057d7 added new build pipeline
```


