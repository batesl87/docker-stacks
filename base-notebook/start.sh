set -e

export JUPYTER_TOKEN="$0"

shift

jupyter notebook $*
