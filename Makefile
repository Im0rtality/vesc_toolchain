VESC_FW_PATH ?= /vedderb/bldc
VESC_TOOL_PATH ?= /vedderb/vesc_tool
VESC_PKG_PATH ?= /vedderb/vesc_pkg

export PATH := $(PATH):$(shell pwd)/build

$(shell mkdir -p build)

build/vesc_tool: build/res_fw.qrc
	cd $(VESC_TOOL_PATH); ./build_lin_original_only
	# Create a build checkpoint
	rm -f build/vesc_tool; cp $(VESC_TOOL_PATH)/build/lin/vesc_tool_6.05 build/vesc_tool

build/res_fw.qrc:
	cd $(VESC_TOOL_PATH); ./build_cp_fw

	# Create a build checkpoint
	cp $(VESC_TOOL_PATH)/res/firmwares/res_fw.qrc build/res_fw.qrc

packages: vesc_tool
	cd $(VESC_PKG_PATH) && make

build/%.vescpkg: build/vesc_tool
	cd $(VESC_PKG_PATH)/$(basename $(notdir $@)); make -j4
	cp $(VESC_PKG_PATH)/$(basename $(notdir $@))/$(notdir $@) $@

clean: clean_packages clean_tool clean_fw

clean_packages:
	cd $(VESC_PKG_PATH) && make clean
	rm -f build/*.vescpkg

clean_tool:
	cd $(VESC_TOOL_PATH); make clean
	rm -f build/vesc_tool

clean_fw:
	cd $(VESC_FW_PATH); make clean
	rm -f build/res_fw.qrc
