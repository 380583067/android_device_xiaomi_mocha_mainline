#
# Copyright (C) 2014 The CyanogenMod Project
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

DEV_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

PRODUCT_AAPT_CONFIG += xlarge large
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536
TARGET_TEGRA_VERSION := t124

$(call inherit-product-if-exists, vendor/nvidia/shield/mocha.mk)

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_F2FS := true
PRODUCT_CHARACTERISTICS := tablet

BUILD_FINGERPRING := test

# HIDL HALs
$(call inherit-product, $(DEV_DIR)/hidl.mk)

PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/drm.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/drm.rc

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck fsck.f2fs mkfs.f2fs

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.tn8 \
	ueventd.tn8.rc

BOARD_USES_LIBDRM := true
USE_DRM_HWCOMPOSER := true

ENABLE_LIBDRM := true
BOARD_GPU_DRIVERS ?= tegra nouveau
PRODUCT_PACKAGES += \
    hwcomposer.drm \
    gralloc.gbm \
    libdrm \
    libGLES_mesa
