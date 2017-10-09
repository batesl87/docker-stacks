# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Ubuntu 16.04 (xenial) from 2017-07-23
# https://github.com/docker-library/official-images/commit/0ea9b38b835ffb656c497783321632ec7f87b60c
FROM ubuntu@sha256:84c334414e2bfdcae99509a6add166bbb4fa4041dc3fa6af08046a66fed3005f

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -yq dist-upgrade \
 && apt-get install -yq --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
    curl \
    git \
    unixodbc-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
# apt-get and system utilities
RUN apt-get update && apt-get install -y \
    curl apt-utils apt-transport-https debconf-utils gcc build-essential g++-5\
    && rm -rf /var/lib/apt/lists/*

# adding custom MS repository
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

# install SQL Server drivers
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.10.0/tini && \
    echo "1361527f39190a7338a0b434bd8c88ff7233ce7b9a4876f3315c22fce7eca1b0 *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER=jovyan \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH \
    HOME=/home/$NB_USER

ADD fix-permissions /usr/local/bin/fix-permissions
# Create jovyan user with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    mkdir -p $CONDA_DIR && \
    chown $NB_USER:$NB_GID $CONDA_DIR && \
    fix-permissions $HOME && \
    fix-permissions $CONDA_DIR

USER $NB_USER

# Setup work directory for backward-compatibility
RUN mkdir /home/$NB_USER/work && \
    fix-permissions /home/$NB_USER

# Install conda as jovyan and check the md5 sum provided on the download site
ENV MINICONDA_VERSION 4.3.21
RUN cd /tmp && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    echo "c1c15d3baba15bf50293ae963abef853 *Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh" | md5sum -c - && \
    /bin/bash Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    $CONDA_DIR/bin/conda config --system --prepend channels conda-forge && \
    $CONDA_DIR/bin/conda config --system --set auto_update_conda false && \
    $CONDA_DIR/bin/conda config --system --set show_channel_urls true && \
    $CONDA_DIR/bin/conda update --all --quiet --yes && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR


RUN pip install git+git://github.com/batesl87/tornado.git@notebooks-iter2

RUN pip install jupyter \
    ipywidgets \
    numpy \
    pandas \
    plotly \
    pyodbc

USER root

# Julia dependencies
# install Julia packages in /opt/julia instead of $HOME
ENV JULIA_PKGDIR=/opt/julia

RUN . /etc/os-release && \
    echo "deb http://ppa.launchpad.net/staticfloat/juliareleases/ubuntu $VERSION_CODENAME main" > /etc/apt/sources.list.d/julia.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3D3D3ACC && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    julia && \
    unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    # Show Julia where conda libraries are \
    echo "push!(Libdl.DL_LOAD_PATH, \"$CONDA_DIR/lib\")" >> /usr/etc/julia/juliarc.jl && \
    # Create JULIA_PKGDIR \
    mkdir $JULIA_PKGDIR && \
    chown $NB_USER $JULIA_PKGDIR && \
    fix-permissions $JULIA_PKGDIR

USER $NB_USER

# Add Julia packages
# Install IJulia as jovyan and then move the kernelspec out
# to the system share location. Avoids problems with runtime UID change not
# taking effect properly on the .local folder in the jovyan home dir.
RUN julia -e 'Pkg.init()' && \
    julia -e 'Pkg.update()' && \
    julia -e 'Pkg.add("IJulia")' && \
    julia -e 'Pkg.add("JuMP")' && \
    julia -e 'Pkg.add("Cbc")' && \
    julia -e 'Pkg.add("PlotlyJS")' && \
    julia -e 'Pkg.add("DataFrames")' && \
    # Precompile Julia packages \
    julia -e 'using IJulia' && \
    julia -e 'using JuMP' && \
    julia -e 'using Cbc' && \
    julia -e 'using PlotlyJS' && \
    julia -e 'using DataFrames' && \
    # move kernelspec out of home \
    mv $HOME/.local/share/jupyter/kernels/julia* $CONDA_DIR/share/jupyter/kernels/ && \
    chmod -R go+rx $CONDA_DIR/share/jupyter && \
    rm -rf $HOME/.local && \
    fix-permissions $JULIA_PKGDIR $CONDA_DIR/share/jupyter

USER root

EXPOSE 8888
WORKDIR $HOME

# Configure container startup
ENTRYPOINT ["tini", "--"]
CMD ["start-notebook.sh"]

# Add local files as late as possible to avoid cache busting
COPY start.sh /usr/local/bin/
COPY start-notebook.sh /usr/local/bin/
COPY start-singleuser.sh /usr/local/bin/
COPY jupyter_notebook_config.py /etc/jupyter/
RUN fix-permissions /etc/jupyter/

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_USER
