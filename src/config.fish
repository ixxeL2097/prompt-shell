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
kubectl completion fish | source
k completion fish | source
#starship init fish | source
oh-my-posh init fish --config ~/.mytheme.omp.json | source
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH $HOME/.local/bin

set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/Homebrew"
fish_add_path -gP "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin";
! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH;
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH;
zoxide init fish | source