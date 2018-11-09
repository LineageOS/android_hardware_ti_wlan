local_target_dir := $(TARGET_OUT_VENDOR)/firmware/ti-connectivity
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := wl127x-fw-4-sr.bin
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(local_target_dir)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FIRMWARE
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := wl127x-fw-4-mr.bin
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(local_target_dir)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FIRMWARE
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := wl127x-fw-4-plt.bin
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(local_target_dir)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FIRMWARE
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := wl1271-nvs_127x.bin
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(local_target_dir)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FIRMWARE
include $(BUILD_PREBUILT)

# create a symlink from /vendor/firmware/ti-connectivity/wl127x-nvs.bin to 
# /data/misc/wifi/wl127x-nvs.bin
# where the NVS file can be modified by startup init code to insert a valid MAC address.
SYMLINKS := \
	$(TARGET_OUT_VENDOR)/firmware/ti-connectivity/wl127x-nvs.bin

$(SYMLINKS): INIT_BINARY := $(LOCAL_MODULE)
$(SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> /data/misc/wifi/wl127x-nvs.bin"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/wifi/wl127x-nvs.bin $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)

# We need this so that the installed files could be picked up based on the
# local module name
ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
    $(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(SYMLINKS)
