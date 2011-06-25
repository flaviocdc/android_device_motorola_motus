# Copyright 2005 The Android Open Source Project
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),motus)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	alarm.c \
	draw.c \
	events.c \
	hardware.c \
	screen.c \
	main.c

LOCAL_STATIC_LIBRARIES := libunz libcutils libc
#LOCAL_CFLAGS := -Ikernel/include

LOCAL_C_INCLUDES := external/zlib

ifeq ($(TARGET_PRODUCT),umts_ruth)
	LOCAL_CFLAGS += -I$(LOCAL_PATH)/ruth_assets
else
	LOCAL_CFLAGS := -I$(LOCAL_PATH)/assets
endif

LOCAL_MODULE := charge_only_mode
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/sbin
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)
endif
