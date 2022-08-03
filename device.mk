#
# Copyright (C) 2022 Project-QiMao
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Call proprietary blob setup
$(call inherit-product-if-exists, vendor/xiaomi/atom/atom-vendor.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# QiMao overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-qimao

# Runtime Overlays
PRODUCT_PACKAGES += \
   CarrierConfigOverlayAtom \
   FrameworksResOverlayAtom \
   SettingsOverlayAtom \
   SystemUIOverlayAtom \
   TelephonyOverlayAtom

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false 

# Camera
PRODUCT_PACKAGES += \
    CameraGo

PRODUCT_COPY_FILES += \
    hardware/interfaces/camera/provider/2.4/default/android.hardware.camera.provider@2.4-service_64.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init/android.hardware.camera.provider@2.4-service_64.rc

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi_mt6873

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder

# Init
PRODUCT_PACKAGES += \
	init.mt6873.rc \
	fstab.mt6873

# RcsService
PRODUCT_PACKAGES += \
    RcsService 

# MtkInCallService
PRODUCT_PACKAGES += \
    MtkInCallService

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml 

# Telephony
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# Shims
PRODUCT_PACKAGES += \
    ImsServiceBase \
    libshim_vtservice