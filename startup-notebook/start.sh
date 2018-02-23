set -e

#pip install git+https://github.com/SnowdenNeuroverse/NeuroPython.git@master --upgrade
#julia -e 'Pkg.clone("/home/jovyan/NeuroJulia")'
julia -e 'Pkg.clone("git://github.com/SnowdenNeuroverse/NeuroJulia.git")'

. /usr/local/bin/start-jupyter.sh $*
