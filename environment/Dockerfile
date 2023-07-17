# hash:sha256:fcd2db66e1c7369ea6a3b12d8cee8deb9947d0c6317cbe50bc258f5c14856c6b
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

COPY postInstall /
RUN /postInstall
