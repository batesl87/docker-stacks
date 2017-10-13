FROM batesl87/jupyter-notebook-setup-dev:v0.3

USER root

ENV JUPYTER_CONFIG_DIR /home/$NB_USER/.jupyter

RUN mkdir $JUPYTER_CONFIG_DIR && \
    mkdir $JUPYTER_CONFIG_DIR/custom
ADD https://github.com/batesl87/docker-stacks/blob/jupyter-notebook-devv0.3/themes/custom.css $JUPYTER_CONFIG_DIR/custom/custom.css

USER $NB_USER
