#!/bin/bash

source .devcontainer/common.sh

# Clone the VESC firmware and tool repositories
mkdir $ROOT_PATH
cd $ROOT_PATH
git clone https://github.com/vedderb/bldc.git $VESC_FW_PATH
git clone https://github.com/vedderb/vesc_tool.git $VESC_TOOL_PATH
git clone https://github.com/vedderb/vesc_pkg.git $VESC_PKG_PATH
