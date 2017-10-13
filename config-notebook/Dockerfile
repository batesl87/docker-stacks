FROM 393680aab28a

RUN pip install jupyterthemes \
    --upgrade && \
    jt -t onedork -T -N -cellw 80%

USER $NB_USER
