set -e

pip install git+https://github.com/SnowdenNeuroverse/NeuroPython.git@master --upgrade
julia -e 'Pkg.update("NeuroJulia")'

. /usr/local/bin/start-jupyter.sh $*
