FROM batesl87/jupyter-notebook-setup-dev:v0.3

ENV JUPYTER_CONFIG_DIR=/home/$NB_USER/.jupyter

RUN mkdir /home/$NB_USER/.jupyter && \
    mkdir /home/$NB_USER/.jupyter/custom
ADD https://github.com/dunovank/jupyter-themes/blob/master/jupyterthemes/styles/compiled/onedork.css /home/$NB_USER/.jupyter/custom/custom.css

USER $NB_USER
