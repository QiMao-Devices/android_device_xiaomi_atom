#
# Copyright (C) 2022 Project-QiMao
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30 31

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false 

# Init
PRODUCT_PACKAGES += \
	init.mt6873.rc \
	fstab.mt6873 \
	perf_profile.sh

# XiaomiParts
PRODUCT_PACKAGES += \
    XiaomiParts