set -e

export NV_DOMAIN="$1"
export JUPYTER_TOKEN="$2"

shift 2

jupyter notebook $*
