function try_source() {
  if [[ -f "$1" ]]; then
    source "$1"
  fi
}

source <(/opt/homebrew/bin/brew shellenv)
try_source ~/.orbstack/shell/init.zsh

path=(
  /opt/homebrew/opt/uutils-coreutils/libexec/uubin
  $path
)
