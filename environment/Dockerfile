# hash:sha256:17b96b8eb29fe3169543f2a53f451bc39ed0bee2bb7b756baeb711dec4514cb3
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN conda install -y --channel=bioconda \
        ca-certificates \
        git \
        sambamba \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools
