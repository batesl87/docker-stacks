set -e

pip install git+https://github.com/SnowdenNeuroverse/NeuroPython.git@master --upgrade
julia 'Pkg.clone("https://github.com/SnowdenNeuroverse/NeuroJulia.git")'
julia 'using NeuroJulia'

. /usr/local/bin/start-jupyter.sh $*
