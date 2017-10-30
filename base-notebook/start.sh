set -e

export JUPYTER_TOKEN="$1"

shift

jupyter notebook $*
