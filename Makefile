export TARGET := iphone:clang:latest
export ARCHS := armv7 #arm64
export THEOS_PACKAGE_DIR_NAME := packages

include theos/makefiles/common.mk

BUNDLE_NAME = AutoBrightnessFlipswitch
uroboro_SOURCES = sources
uroboro_FILES += $(wildcard $(uroboro_SOURCES)/*.c)
uroboro_FILES += $(wildcard $(uroboro_SOURCES)/*.cpp)
uroboro_FILES += $(wildcard $(uroboro_SOURCES)/*.m)
uroboro_FILES += $(wildcard $(uroboro_SOURCES)/*.mm)
uroboro_FILES += $(wildcard $(uroboro_SOURCES)/*.x)
uroboro_FILES += $(wildcard $(uroboro_SOURCES)/*.xm)
AutoBrightnessFlipswitch_FILES = $(uroboro_FILES)
AutoBrightnessFlipswitch_FRAMEWORKS = UIKit
AutoBrightnessFlipswitch_LIBRARIES = flipswitch
AutoBrightnessFlipswitch_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk
