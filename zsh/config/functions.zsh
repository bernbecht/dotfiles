# kill process by PID
die() {
    kill -9 "$1"
}
# find process running on a certain port
whoknocks() {
    lsof -i "$1"
}
# creates a folder with arg name
mk() {
    mkdir "$1"
}
# git hard reset to certain step behind
ggrh() {
  git reset --hard HEAD~"$1"
}
## Shopify
# creates new OSW spin instance
newosw() {
    spin up online-store-web --name "$1"
}

base() {
    local regex=/Shopify/(.+)/?
    local command="$1"
    local current_path=$(pwd) > /dev/null 2>&1
    if [[ $current_path =~ $regex ]]; then
      eval "${command} shopify--${match[1]}"
    else
      echo "Please run this script from a Shopify project"
    fi
}

start() {
  base "iso procs start"
}

stop() {
  base "iso procs stop"
}

restart() {
  base "iso procs restart"
}

update() {
  base "/usr/bin/update"
}
