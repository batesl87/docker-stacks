FROM batesl87/jupyter-notebook-startup-dev:v0.3

USER root

RUN echo "$NB_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$NB_USER && \
    chmod 0440 /etc/sudoers.d/$NB_USER

USER $NB_USER
