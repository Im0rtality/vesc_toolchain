# VESC development environment

This is [Docker](https://www.docker.com/) and [dev-containers](https://containers.dev/) based development environment to simplify vedderb/bldc, vedderb/vesc_tool and vedderb/vesc_pkg compilation.

Having this in separate repo is weird, but it's easiest way to achieve this, considering current possibilities.

## Prerequisites

1. Docker
2. Dev Containers compatible IDE/Editor (e.g. VS Code; [tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial))

## Usage

### Example: Compiling customized "float" package from a fork

Step 1: Open project in dev container. Docker image containing all tools is built while opening and takes ~10 minutes.

Step 2: Inside container:
```sh
git submodule add -f https://github.com/Im0rtality/vesc_pkg.git custom/vesc_pkg
make build/float.vescpkg VESC_PKG_PATH=custom/vesc_pkg
```

## Explanation

Dockerfile contains all dependencies and dev tools (ARM SDK, Qt5, etc.), meaning your dev-container based environment contains all of them. Some patches are applied to original build scripts (e.g. unhardcoding some paths).

Next, we are using git submodules to add your own fork into this environment via `custom/vesc_pkg` path. You should be able to manage it similarly to git repo. This method chosen, so your fork does not include any references to this dev environment - so you can keep your pull requests clean.

Lastly, we are using customized Makefile to trigger appropriate build scripts from various VESC Project repos, to auto-magically build all dependencies (e.g. you need vesc_tool to build pkg and you need built firmware to build vesc_tool). 