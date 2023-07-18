# hash:sha256:e3eb9fdb76db4d2dacfcf37858c7830e074cd783876bf2519668284e09fd1599
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN conda install -y --channel=bioconda \
        ca-certificates==2022.12.7 \
        git==2.40.0 \
        sambamba==1.0 \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools==1.0.3
