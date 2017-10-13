FROM batesl87/jupyter-notebook-setup-dev:v0.3

ENV JUPYTER_CONFIG_DIR=/HOME/jovyan/.jupyter

RUN mkdir /HOME/jovyan/.jupyter
ADD https://github.com/dunovank/jupyter-themes/blob/master/jupyterthemes/styles/compiled/onedork.css /HOME/jovyan/.jupyter/custom.css

USER $NB_USER
