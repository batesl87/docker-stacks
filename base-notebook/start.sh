set -e

export NV_DOMAIN="$1"
export JUPYTER_TOKEN="$2"

shift 2

$(echo $NV_DOMAIN | cut -f3 -d/)

wget  -O /home/$NB_USER/.jupyter/custom/ "https://github.com/SnowdenNeuroverse/docker-stacks/tree/master/themes/$(echo $NV_DOMAIN | cut -f3 -d/)/custom.css"
wget  -O /home/$NB_USER/.jupyter/custom/ "https://github.com/SnowdenNeuroverse/docker-stacks/tree/master/themes/$(echo $NV_DOMAIN | cut -f3 -d/)/logo.png"

jupyter notebook $*
