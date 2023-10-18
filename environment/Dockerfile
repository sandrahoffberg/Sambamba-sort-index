# hash:sha256:70db1570f5349c8bc2e0063f83cd93133a3286ab29f90e1db41a89d9e89d3c7a
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN mamba install -y --channel=bioconda \
        ca-certificates==2023.7.22 \
        git==2.41.0 \
        sambamba==1.0 \
    && mamba clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools
