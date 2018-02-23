set -e

#pip install git+https://github.com/SnowdenNeuroverse/NeuroPython.git@master --upgrade
#julia -e 'Pkg.clone("/home/jovyan/NeuroJulia")'
git clone git://github.com/SnowdenNeuroverse/NeuroJulia.git $JULIA_PKGDIR/v0.5/NeuroJulia
#julia -e 'Pkg.clone("git://github.com/SnowdenNeuroverse/NeuroJulia.git")'

. /usr/local/bin/start-jupyter.sh $*
