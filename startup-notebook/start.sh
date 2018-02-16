pip -e install git+https://github.com/SnowdenNeuroverse/NeuroPython.git@master --upgrade
julia -e 'Pkg.clone("https://github.com/SnowdenNeuroverse/NeuroJulia.git")'
julia -e 'using NeuroJulia'

. /usr/local/bin/start-jupyter.sh $*
