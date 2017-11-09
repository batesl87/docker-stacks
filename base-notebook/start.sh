set -e

export NV_ENV="$1"

shift

export JUPYTER_TOKEN="$2"

shift

jupyter notebook $*
