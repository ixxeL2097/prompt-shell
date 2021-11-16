# prompt-shell
General repo for prompt shell usage and tips

# 01 - Fish shell

## Install

Fish shell is very useful and friendly. You can download it and customize it looking at this link :

- https://fishshell.com/

**Oh-my-fish** is sort of a plugin for fish shell to handle themes and others. Look at this link :

- https://github.com/oh-my-fish/oh-my-fish

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

## Plugins

To handle plugins, you can install `Fisher` :

```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

- https://github.com/jorgebucaran/fisher

Useful plugin is the kubectl completion that you can find here :

- https://github.com/evanlucas/fish-kubectl-completions

```
fisher install evanlucas/fish-kubectl-completions
```

## Kubectx/Kubens

Kubextc and Kubens tools are very useful for managing kubernetes cluster :

- https://github.com/ahmetb/kubectx

`kubectx` is a tool to switch between contexts (clusters) on kubectl faster.
`kubens` is a tool to switch between Kubernetes namespaces (and configure them for kubectl) easily.


