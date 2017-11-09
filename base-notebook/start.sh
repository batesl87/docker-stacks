set -e

export NV_DOMAIN="$1"

shift

export JUPYTER_TOKEN="$2"

shift

jupyter notebook $*
