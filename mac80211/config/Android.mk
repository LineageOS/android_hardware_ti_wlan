#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

########################

include $(CLEAR_VARS)
LOCAL_MODULE := wpa_supplicant_overlay.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/wifi
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

########################

include $(CLEAR_VARS)
LOCAL_MODULE := hostapd.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/wifi
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)


########################

include $(CLEAR_VARS)
LOCAL_MODULE := dhcpcd.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dhcpcd
LOCAL_SRC_FILES := android_dhcpcd.conf
include $(BUILD_PREBUILT)

########################

include $(CLEAR_VARS)
LOCAL_MODULE := wifical.sh
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := WLAN_Calibration_Script.sh
LOCAL_MODULE_CLASS := SCRIPT
include $(BUILD_PREBUILT)

########################

#
# wpa_supplicant.conf is now generated on the fly
#

WIFI_DRIVER_SOCKET_IFACE := wlan0
ifeq ($(strip $(WPA_SUPPLICANT_VERSION)),VER_0_8_X)
  include external/wpa_supplicant_8/wpa_supplicant/wpa_supplicant_conf.mk
else
ifeq ($(strip $(WPA_SUPPLICANT_VERSION)),VER_0_8_X_TI)
  # Since this is additional TI tree, make extra check
  ifneq ($(wildcard  external/wpa_supplicant_8_ti/wpa_supplicant/wpa_supplicant_conf.mk),)
    include external/wpa_supplicant_8_ti/wpa_supplicant/wpa_supplicant_conf.mk
  endif
else
ifeq ($(strip $(WPA_SUPPLICANT_VERSION)),VER_0_6_X)
  include external/wpa_supplicant_6/wpa_supplicant/wpa_supplicant_conf.mk
else
  include external/wpa_supplicant/wpa_supplicant_conf.mk
endif
endif
endif

########################
