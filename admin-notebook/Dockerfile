FROM batesl87/jupyter-notebook-config-dev:v0.3

USER root

RUN echo "$NB_USER ALL=NOPASSWD: /usr/bin/apt-get" > /etc/sudoers.d/$NB_USER && \
    chmod 0440 /etc/sudoers.d/$NB_USER

USER $NB_USER
