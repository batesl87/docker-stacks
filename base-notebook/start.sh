set -e

export NV_DOMAIN="$1"
export JUPYTER_TOKEN="$2"

shift 2

echo 'create dir'
mkdir -p /home/$NB_USER/.jupyter/custom/

echo 'download css'
wget  -O /home/$NB_USER/.jupyter/custom/custom.css "https://raw.githubusercontent.com/SnowdenNeuroverse/docker-stacks/master/themes/$(echo $NV_DOMAIN | cut -f3 -d/)/custom.css"
echo 'download logo'
wget  -O /home/$NB_USER/.jupyter/custom/logo.png "https://raw.githubusercontent.com/SnowdenNeuroverse/docker-stacks/master/themes/$(echo $NV_DOMAIN | cut -f3 -d/)/logo.png"

jupyter notebook $*
