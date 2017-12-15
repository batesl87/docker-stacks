FROM batesl87/jupyter-notebook-packages-dev:v0.3

RUN wget  -O /home/$NB_USER/.jupyter/custom/custom.css "https://raw.githubusercontent.com/SnowdenNeuroverse/docker-stacks/master/themes/$(echo $NV_DOMAIN | cut -f3 -d/)/custom.css" && \
wget  -O /home/$NB_USER/.jupyter/custom/logo.png "https://raw.githubusercontent.com/SnowdenNeuroverse/docker-stacks/master/themes/$(echo $NV_DOMAIN | cut -f3 -d/)/logo.png"

USER $NB_USER
