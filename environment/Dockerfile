# hash:sha256:34bc556b789feb6a3b9da95730b6e1b2893361ca7d951f536becbbbad69999fd
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
