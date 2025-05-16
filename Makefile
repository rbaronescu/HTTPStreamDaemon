ARCHS = armv7 arm64
TARGET = iphone:clang:latest:8.4
TOOL_NAME = HTTPStreamDaemon

THEOS_DEVICE_IP = # TODO

include $(THEOS)/makefiles/common.mk

HTTPStreamDaemon_FILES = main.m
HTTPStreamDaemon_FRAMEWORKS = Foundation AVFoundation

include $(THEOS_MAKE_PATH)/tool.mk
