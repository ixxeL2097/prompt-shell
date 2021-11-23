# prompt-shell
General repo for prompt shell usage and tips

# 01 - Fish shell

## Install

Fish is a smart & user-friendly command line shell for Linux, macOS, and the rest of the family. You can download it and customize it looking at this link :

- https://fishshell.com/

**Oh-my-fish** is sort of a plugin for fish shell to handle themes and others. Look at this link :

- https://github.com/oh-my-fish/oh-my-fish

install it :
```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
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


