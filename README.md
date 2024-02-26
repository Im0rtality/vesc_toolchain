# VESC development toolchain

This is [Docker](https://www.docker.com/)/[devcontainers](https://containers.dev/) based development environment to simplify vedderb/bldc, vedderb/vesc_tool and vedderb/vesc_pkg compilation.

Having this in separate repo is weird, but it's easiest way to achieve this, considering community chose different path.

## Prerequisites

1. Docker
2. Dev Containers compatible IDE/Editor (e.g. VS Code; [tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial))

## Usage

### Example: Compiling VESC package from modified code

1. Fork this repo
2. Pre-build Docker images: `cd .docker; make`
3. Add your forked code as git submodule (e.g. `git submodule add -f https://github.com/Im0rtality/vesc_pkg.git custom/vesc_pkg`)
4. Start devcontainer and and switch into it.
5. Compile customized "float" package, including all prerequisites: `make build/float.vescpkg VESC_PKG_PATH=custom/vesc_pkg`
    - This compiles firmware to produce `res/firmwares/res_fw.qrc` (via `build_cp_fw`) required to build vesc_tool
    - Then compiles vesc_tool (via `build_lin_only_original`), required to compile VESC package
    - Then compiles "float" package
6. Compiled package is available in `build/float.vescpkg`

> NOTE: You can build any package via `make build/<package>.vescpkg VESC_PKG_PATH=<relative-path-to-vesc_pkg_source-code>`. Omitting `VESC_PKG_PATH=` bulids from 
 
## How it works?

Docker images are papared, containing GCC, ARM SDK, QT and whatever else required. See `.docker/` for details.

> DISCLAIMER: This is not set up according to Docker best pratices - focus is to get it running. Contributions appreciated.

Dev Containers allow moving entire dev environment to run inside Docker image mentioned above. This way, we have predictable versions, paths and dependencies. 

On Dev Container startup, orignal repos are cloned into dev env and some build script fixes are applied (e.g. unhardcoding file system paths).