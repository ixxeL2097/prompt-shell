# prompt-shell
General repo for prompt shell usage and tips

# 01 - Fish shell

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

# 02 - Git

To visualize git more efficiently, you can use some plugins. Like git-graph for example:
- https://github.com/mlange-42/git-graph

```console
[root@workstation ~ ]$ git-graph --style round --model simple                                                    
         ???      77b981c (HEAD -> release/4.0, origin/release/4.0) new docker img build pipeline
         ???      411baf3 updated precommit
         ???      10e9700 maj from 12july
         ???      dc1bcea using env dedicated app name
       ??? ???      75760c6 (origin/release/3.1) using env dedicated app name
       ?????????
         ???      b197e62 going back to release ref
         ???      1901446 [v3.1.0] prepare main merge
     ???<??? ???      95fad7e (main, origin/main) Merge branch 'release/3.1' into 'main'
     ??? ??? ???      f1df601 prepare main merge
     ??? ?????????
     ??? ???<???      cbc151d Merge branch 'release/3.0' into 'main'
     ??? ??? ??? ???    06f47e0 (origin/release/3.0) added new build pipeline
     ???<????????? ???    da16367 Merge branch 'release/3.0' into 'main'
     ????????? ??? ???
     ???   ??? ???    67057d7 added new build pipeline
```


