FROM batesl87/jupyter-notebook-setup-dev:v0.3

USER root

ENV JUPYTER_CONFIG_DIR /home/$NB_USER/.jupyter

RUN mkdir $JUPYTER_CONFIG_DIR && \
    mkdir $JUPYTER_CONFIG_DIR/custom
ADD https://github.com/dunovank/jupyter-themes/blob/master/jupyterthemes/styles/compiled/onedork.css $JUPYTER_CONFIG_DIR/custom/custom.css

USER $NB_USER
