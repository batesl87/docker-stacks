FROM batesl87/jupyter-notebook-kernel-dev:v0.3

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
    julia -e 'Pkg.add("Plotly")' && \
    # Precompile Julia packages \
    julia -e 'using JuMP' && \
    julia -e 'using Cbc' && \
    julia -e 'using DataFrames' && \
    julia -e 'using Plotly'

#Rename start.sh and create a new one
RUN mv /usr/local/bin/start.sh /usr/local/bin/start-jupyter.sh
COPY start.sh /usr/local/bin/
