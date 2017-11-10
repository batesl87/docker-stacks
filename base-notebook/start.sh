set -e

export NV_DOMAIN="$1"
export JUPYTER_TOKEN="$2"

shift
shift

jupyter notebook $*
