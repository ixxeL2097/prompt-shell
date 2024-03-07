# prompt-shell
General repo for prompt shell usage and tips
# 01 - Prompt

install `starhip`:
```bash
curl -sS https://starship.rs/install.sh | sh
```

install `oh-my-posh`:
```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

Fonts:

You will need `JetBrainsMono Nerd Font` for this setup:
- https://www.nerdfonts.com/font-downloads

To install it on linux, just create the directory `~/.fonts` and execute command:
```bash
fc-cache -fv
```

## Fish shell

For fish shell, add configuration in `~/.config/fish/config.fish` --> [link](./src/config.fish)

## Starship

Configuration for the prompte Starship `~/.config/starship.toml` --> [link](./src/starship.toml)

Improved profile --> [`link`](./src/starship2.toml)

## Oh my posh

Template for oh-my-posh `.mytheme.omp.json` --> [`link`](./src/oh-my-posh.json)

Adjust the Oh My Posh init line in `~/.config/fish/config.fish` by adding the `--config` flag with the location of your configuration.
```bash
oh-my-posh init fish --config ~/jandedobbeleer.omp.json | source
```

Exporting current theme :
```bash
oh-my-posh config export --output ~/.mytheme.omp.json
```

# 02 - Fish shell

## Install

Fish is a smart & user-friendly command line shell for Linux, macOS, and the rest of the family. You can download it and customize it looking at this link :

- https://fishshell.com/
- https://github.com/fish-shell/fish-shell

```bash
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
```

**Oh-my-fish** is sort of a plugin for fish shell to handle themes and others. Look at this link :

- https://github.com/oh-my-fish/oh-my-fish

install it :
```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

List theme with :
```bash
omf theme
```

You can then install themes using the `omf` command :

```bash
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
## Tools
### Eza
Eza : https://github.com/eza-community/eza

```
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
```

### Bat
Bat : https://github.com/sharkdp/bat


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

Eza function :

```bash
function ls --wraps ls
  eza --icons --group-directories-first $argv
end
```

```bash
function ll --wraps ll
  eza --icons --group-directories-first -l $argv
end
```

Bat functions:

```bash
function kat --wraps="kubectl get"
  kubectl get $argv -oyaml | kubectl neat | bat --color=always -l yaml
end
```

vcluster function:
```bash
function vk --wraps=vcluster
  vcluster $argv
end
```

kubernetes useful functions:
```bash
function keti --wraps="kubectl exec -it"
  kubectl exec -it $argv
end
```
```bash
function kd --wraps="kubectl describe"
  kubectl describe $argv
end
```
```bash
function kdel --wraps="kubectl delete"
  kubectl describe $argv
end
```

```bash
function kg --wraps="kubectl get"
  kubectl get $argv
end
```
```bash
function kimg --wraps="kubectl get"
  if test $argv[1] = "deploy"
    kubectl get $argv -ojson | jq '.spec.template.spec.initContainers[]?.image, .spec.template.spec.containers[].image'
  else
    kubectl get $argv -ojson | jq '.spec.initContainers[]?.image, .spec.containers[].image'
  end
end
```
```bash
function kga --wraps="kubectl get"
  kubectl get $argv -ojson | jq '.metadata.annotations'
end
```
```bash
function kgl --wraps="kubectl get"
  kubectl get $argv -ojson | jq '.metadata.labels'
end
```
```bash
function krr --wraps="kubectl rollout restart"
  kubectl rollout restart $argv
end
```
```bash
function kyn --wraps="kubectl get"
  kubectl get $argv -oyaml | kubectl neat | yq
end
```
```bash
function kvol --wraps="kubectl get"
  if test $argv[1] = "deploy"
    kubectl get $argv -ojson | jq '.spec.template.spec.volumes, .spec.template.spec.volumes'
  else
    kubectl get $argv -ojson | jq '.spec.volumes, .spec.volumes'
  end
end
```
```bash
function kown --wraps="kubectl get"
  kubectl get $argv -ojson | jq '.metadata.ownerReferences'
end
```
```bash
function kport --wraps="kubectl get"
  if test $argv[1] = "deploy"
    kubectl get $argv -ojson | jq '.spec.template.spec.initContainers[]?.ports, .spec.template.spec.containers[].ports'
  else
    kubectl get $argv -ojson | jq '.spec.initContainers[]?.ports, .spec.containers[].ports'
  end
end
```
```bash
function kmount --wraps="kubectl get"
  if test $argv[1] = "deploy"
    kubectl get $argv -ojson | jq '.spec.template.spec.initContainers[]?.volumeMounts, .spec.template.spec.containers[].volumeMounts'
  else
    kubectl get $argv -ojson | jq '.spec.initContainers[]?.volumeMounts, .spec.containers[].volumeMounts'
  end
end
```
```bash
function kgqos --wraps="kubectl get pods"
  kubectl get pods $argv -o custom-columns="NAME:.metadata.name, QOS:.status.qosClass, REQUESTS:.spec.containers[*].resources.requests, LIMITS:.spec.containers[*].resources.limits, PRIORITY_CLASS:.spec.priorityClassName"
end
```

## Plugin manager
### Fisher : fish plugin manager

To handle plugins, you can install `Fisher` :

```bash
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
```bash
kubectl krew
```

## Plugins

List of plugins :
- https://www.rockyourcode.com/fish-plugins-i-like/
- https://github.com/jorgebucaran/awsm.fish

### Fish ssh-agent

Utility functions to start your ssh agent when using fish shell. You will only need to run `ssh-add` and type your password once, after the running ssh_agent should do the work for you.

- https://github.com/danhper/fish-ssh-agent

```bash
fisher install danhper/fish-ssh-agent
```

Then you can directly use `ssh-add` :
```bash
ssh-add /home/fred/.ssh/wsl_github.pub
ssh-add /home/fred/.ssh/wsl_github
```

### Fuzzy Finder 

Fuzzy Finder or `fzf` is a general purpose command line tool to find anything faster, be it your files or the command history.

- https://github.com/jethrokuan/fzf#usage

```bash
fisher install jethrokuan/fzf
```

You may have to install `fzf` package as well:
```bash
apt install fzf
```

or :
```bash
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

```bash
fisher install evanlucas/fish-kubectl-completions
```

### Kubectx/Kubens

Kubextc and Kubens tools are very useful for managing kubernetes cluster :

- https://github.com/ahmetb/kubectx

`kubectx` is a tool to switch between contexts (clusters) on kubectl faster.

`kubens` is a tool to switch between Kubernetes namespaces (and configure them for kubectl) easily.

To install `kubens` and `kubectx` with `krew` plugin manager, just execute following commands :

```bash
kubectl krew install ctx
kubectl krew install ns
```

And then use following commands to use it :
```bash
kubectl ns
kubectl ctx
```

### Kubectl neat
Kubectl neat allows to avoid managed fields displaying:
- https://github.com/itaysk/kubectl-neat

Install with krew:
```bash
kubectl krew install neat
```

### Kubectl datree
This kubectl plugin extends the Datree CLI's capabilities to allow scanning resources within your cluster for misconfigurations.
- https://github.com/datreeio/kubectl-datree

Install with krew:
```bash
kubectl krew install datree
```

### Kubectl whoami
kubectl-whoami is a kubectl plugin that show the subject that's currently authenticated as.
- https://github.com/rajatjindal/kubectl-whoami

Install with krew:
```bash
kubectl krew install whoami
```

### Kubectl kubecm
Manage your kubeconfig more easily.
- https://github.com/sunny0826/kubecm

Install with krew:
```bash
kubectl krew install kc
```

### NVM fish
This tool helps you manage multiple active versions of Node on a single local environment. Quickly install and switch between runtimes without cluttering your home directory or breaking system-wide scripts.

- https://github.com/jorgebucaran/nvm.fish

Install with fisher:
```bash
fisher install jorgebucaran/nvm.fish
```

Install latest LTS node version and display:
```bash
nvm install lts
nvm list
nvm current
```

### GVM fish
```bash
fisher install JGAntunes/fish-gvm
fisher install edc/bass

sudo apt-get install bison
sudo apt install golang
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

use GVM :
```bash
gvm listall
gvm install go1.21.7
gvm use go1.21.7 --default
```

### Kubectl ktop
A top-like tool for your Kubernetes cluster
- https://github.com/vladimirvivien/ktop

Install with krew:
```bash
kubectl krew install ktop
```

### Kubectl view-allocation
kubectl plugin lists allocations for resources (cpu, memory, gpu,...) as defined into the manifest of nodes and running pods. It doesn't list usage like kubectl top. It can provide result grouped by namespaces, nodes, pods and filtered by resources'name.
- https://github.com/davidB/kubectl-view-allocations

Install with krew:
```bash
kubectl krew install view-allocations
```

### Kubectl spy

- https://github.com/huazhihao/kubespy

kubespy is a kubectl plugin to debug a running pod. It creates a short-lived spy container, using specified image containing all the required debugging tools, to "spy" the target container by joining its OS namespaces. So the original target container image can keep clean without sacrificing the convenience for debugging on demand.

Install with krew:
```bash
kubectl krew install spy
```

### Kubectl stern

- https://github.com/stern/stern

Install with krew:
```bash
kubectl krew install stern
```

### Kubectl kubepug

- https://github.com/kubepug/kubepug

Install with krew:
```bash
kubectl krew install deprecations
```

### Kubectl ketall

- https://github.com/corneliusweig/ketall

Install with krew:
```bash
kubectl krew install get-all
```

### Kubectl tree

- https://github.com/ahmetb/kubectl-tree

Install with krew:
```bash
kubectl krew install tree
```

### Kubectl outdated

- https://github.com/replicatedhq/outdated

Install with krew:
```bash
kubectl krew install outdated
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


