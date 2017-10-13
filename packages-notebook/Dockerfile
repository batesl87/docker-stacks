FROM batesl87/jupyter-notebook-kernel-dev:v0.3

USER root

USER $NB_USER
#Python

RUN pip install numpy \
    pandas \
    plotly \
    pyodbc \
    scipy \
    matplotlib \
    --upgrade

#Julia
RUN julia -e 'Pkg.update()' && \
    julia -e 'Pkg.add("JuMP")' && \
    julia -e 'Pkg.add("Cbc")' && \
    julia -e 'Pkg.add("DataFrames")' && \
    # Precompile Julia packages \
    julia -e 'using JuMP' && \
    julia -e 'using Cbc' && \
    julia -e 'using DataFrames'
