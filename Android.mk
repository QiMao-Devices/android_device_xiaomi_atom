#
# Copyright (C) 2022 Project-QiMao
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),atom)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

MEDIATEK_MT6873_SYMLINKS := $(TARGET_OUT_VENDOR)/lib
$(MEDIATEK_MT6873_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Link mt6873 lib: $@"
	$(hide) ln -sf /vendor/lib/mt6873/libneuron_platform.vpu.so $@/libneuron_platform.vpu.so
	$(hide) ln -sf /vendor/lib/mt6873/libmtk_drvb.so $@/libmtk_drvb.so
	$(hide) ln -sf /vendor/lib/mt6873/libaiselector.so $@/ibaiselector.so
	$(hide) ln -sf /vendor/lib/mt6873/libdpframework.so $@/libdpframework.so
	$(hide) ln -sf /vendor/lib/mt6873/libnir_neon_driver.so $@/libnir_neon_driver.so
	$(hide) ln -sf /vendor/lib/mt6873/libpq_prot.so $@/libpq_prot.so

MEDIATEK_MT6873_64_SYMLINKS := $(TARGET_OUT_VENDOR)/lib64
$(MEDIATEK_MT6873_64_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Link mt6873 lib64: $@"
	$(hide) ln -sf /vendor/lib64/mt6873/libneuron_platform.vpu.so $@/libneuron_platform.vpu.so
	$(hide) ln -sf /vendor/lib64/mt6873/libneuron_runtime.5.so $@/libneuron_runtime.5.so
	$(hide) ln -sf /vendor/lib64/mt6873/libneuron_runtime.so $@/libneuron_runtime.so
	$(hide) ln -sf /vendor/lib64/mt6873/libmtk_drvb.so $@/libmtk_drvb.so
	$(hide) ln -sf /vendor/lib64/mt6873/libdpframework.so $@/libdpframework.so
	$(hide) ln -sf /vendor/lib64/mt6873/libnir_neon_driver.so $@/libnir_neon_driver.so
	$(hide) ln -sf /vendor/lib64/mt6873/libpq_prot.so $@/libpq_prot.so
	$(hide) ln -sf /vendor/lib64/mt6873/libmdia_ut.so $@/libmdia_ut.so
	$(hide) ln -sf /vendor/lib64/mt6873/libaiselector.so $@/ibaiselector.so

ALL_DEFAULT_INSTALLED_MODULES += $(MEDIATEK_MT6873_SYMLINKS) $(MEDIATEK_MT6873_64_SYMLINKS)

endif