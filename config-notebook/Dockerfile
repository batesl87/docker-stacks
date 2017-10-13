FROM batesl87/jupyter-notebook-setup-dev:v0.3

RUN pip install jupyterthemes \
    --upgrade && \
    jt -t onedork -T -N -cellw 80%

USER $NB_USER
