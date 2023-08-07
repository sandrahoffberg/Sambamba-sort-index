# hash:sha256:dff93f8143b9394f9931fa6e2aef0d2cfd71f09b26f4b73669c7c6d7ad7cc8f7
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN conda install -y --channel=bioconda \
        ca-certificates==2023.7.22 \
        git==2.41.0 \
        sambamba==1.0 \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools==1.0.8
