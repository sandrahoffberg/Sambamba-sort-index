# hash:sha256:8c13423ef508b2540119d533851029b7214d686447c9d8e660f41a573fea012b
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
    code-ocean-aux-tools==1.1.3
