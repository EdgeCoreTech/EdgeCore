FROM mcr.microsoft.com/devcontainers/base:debian

ENV DEBIAN_FRONTEND=noninteractive

RUN     apt-get update \
    &&  apt-get install -y --no-install-recommends \
        build-essential \
        llvm \
        clang \
        clangd \
        mold \
        cppcheck \
        cmake \
        ninja-build \
        lldb \
        clang-format \
    &&  rm -rf /var/lib/apt/lists/*

ARG USERNAME=vscode
USER $USERNAME
WORKDIR /workspaces/EdgeCore
