set -e

#pip install git+https://github.com/SnowdenNeuroverse/NeuroPython.git@master --upgrade
julia -e 'Pkg.clone("/home/jovyan/NeuroJulia")'

. /usr/local/bin/start-jupyter.sh $*
