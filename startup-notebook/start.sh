set -e

export NV_DOMAIN="$1"
export JUPYTER_TOKEN="$2"

#pip install git+https://github.com/SnowdenNeuroverse/NeuroPython.git@master --upgrade
#julia -e 'Pkg.clone("/home/jovyan/NeuroJulia")'
git clone git://github.com/SnowdenNeuroverse/NeuroJulia.git $JULIA_PKGDIR/v0.5/NeuroJulia
julia -e 'using NeuroJulia'
#julia -e 'Pkg.clone("git://github.com/SnowdenNeuroverse/NeuroJulia.git")'

shift 2

echo 'create dir'
mkdir -p /home/$NB_USER/.jupyter/custom/

echo 'download css'
wget  -O /home/$NB_USER/.jupyter/custom/custom.css "https://raw.githubusercontent.com/SnowdenNeuroverse/docker-stacks/master/themes/$(echo $NV_DOMAIN | cut -f3 -d/)/custom.css"
echo 'download logo'
wget  -O /home/$NB_USER/.jupyter/custom/logo.png "https://raw.githubusercontent.com/SnowdenNeuroverse/docker-stacks/master/themes/$(echo $NV_DOMAIN | cut -f3 -d/)/logo.png"

jupyter notebook $*
