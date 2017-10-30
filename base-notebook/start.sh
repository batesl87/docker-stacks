set -e

export JUPYTER_TOKEN=$0

jupyter notebook ${@:1}
