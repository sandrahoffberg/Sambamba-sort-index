# hash:sha256:174de7cb7005f46f39bd45227357ce3f7f443bd1b2e35f8af413511c5f3a0b29
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
    code-ocean-aux-tools==1.0.8
