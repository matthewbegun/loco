# this is your /dev/env ... this is your /dev/env on moby...
# yes I know this is immoral and not what docker is for - thank you
#
#
# just leaving this here
# curl -fsSL https://starship.rs/install.sh | bash
# curl -fsSLO https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz
#
#
# $isodate = Get-Date -Format FileDateUniversal
# $targets = "os", "core", "data_science"
# foreach ($target in $targets) {
#     docker build --pull `
#         --tag loco/${target}:${isodate} `
#         --tag loco/${target}:latest `
#         --tag matthewbegun/loco:${target} `
#         --target ${target} `
#         .devcontainer
# }
# docker tag matthewbegun/loco:data_science matthewbegun/loco:latest
# docker tag matthewbegun/loco:data_science matthewbegun/loco:${isodate}
# foreach ($target in $targets) {
#     docker push matthewbegun/loco:${target}
# }
#
# TODO: add starship - see https://starship.rs/; and also
# RUN wget --no-hsts --quiet https://github.com/conda-forge/miniforge/releases/download/${MINIFORGE_VERSION}/Miniforge3-${MINIFORGE_VERSION}-Linux-x86_64.sh -O /tmp/miniforge.sh && \
    # /bin/bash /tmp/miniforge.sh -b -p ${CONDA_DIR} && \
    # rm /tmp/miniforge.sh && \
    # conda clean -tipsy && \
    # find ${CONDA_DIR} -follow -type f -name '*.a' -delete && \
    # find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete && \
    # conda clean -afy

FROM condaforge/miniforge3 as os

# Configure apt and install packages
RUN apt-get update  > /dev/null \
    # # not sure why these? (MS)
    # && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    # # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed (MS)
    # && apt-get -y install --no-install-recommends git openssh-client less iproute2 procps lsb-release \
    # fish
    && apt-get -y install --no-install-recommends software-properties-common \
    && apt-add-repository ppa:fish-shell/release-3 \
    && apt-get -y install fish \
    # clean up
    && rm -rf /var/lib/apt/lists/* \
    # starship
    # && curl -fsSL https://starship.rs/install.sh | bash \
    # update conda
    && conda update --all -y \
    && conda clean --all -y

FROM os as core

COPY environment-core.yml /tmp/conda-tmp/
# Update Python environment
RUN /opt/conda/bin/conda env update -n base -f /tmp/conda-tmp/environment-core.yml \
    && rm -rf /tmp/conda-tmp \
    && conda clean --all -f -y

FROM core as data_science

COPY environment-data_science.yml /tmp/conda-tmp/
# Update Python environment based on environment.yml (if present)
RUN /opt/conda/bin/conda env update -n base -f /tmp/conda-tmp/environment-data_science.yml \
    && rm -rf /tmp/conda-tmp \
    && ipython profile create \
    && ipython -c "from pyforest.auto_import import setup; setup()" \
    && conda clean --all -f -y

