ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

LABEL maintainer="HofmannHe"

WORKDIR /root
COPY files/.condarc .

# Install Tensorflow
RUN pip install --quiet --no-cache-dir \
    'tensorflow-gpu' && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
