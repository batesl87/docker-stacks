FROM batesl87/jupyter-notebook-packages-dev:v0.3

USER root

#Rename start.sh and create a new one
RUN mv /usr/local/bin/start.sh /usr/local/bin/start-jupyter.sh
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start-jupyter.sh
RUN chmod +x /usr/local/bin/start.sh

USER $NB_USER
