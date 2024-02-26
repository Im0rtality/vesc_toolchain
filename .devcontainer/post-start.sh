#!/bin/bash

source .devcontainer/common.sh

# Update the VESC firmware and tool repositories
cd $VESC_FW_PATH; git pull origin
cd $VESC_TOOL_PATH; git pull origin
cd $VESC_PKG_PATH; git pull origin

# Fix: ./build_cp_fw: line 10: cd: ../../ARM/STM_Eclipse/BLDC_4_ChibiOS/: No such file or directory
echo "Fixing original build scripts:"
cd $VESC_TOOL_PATH
echo "Fixing harcoded FWPATH in vesc_tool/build_cp_fw"
sed -i 's|FWPATH="../../ARM/STM_Eclipse/BLDC_4_ChibiOS/"|FWPATH="'"$VESC_FW_PATH"'"|' $VESC_TOOL_PATH/build_cp_fw
