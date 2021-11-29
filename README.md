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

And add it to the ` ~/.config/fish/config.fish` file.

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


