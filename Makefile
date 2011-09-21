INSTALL_DIR := $(shell if [[ -d $(HOME)/Applications/Colloquy.app ]]; then echo $(HOME)/Applications; else echo /Applications; fi)
RELEASE_BUILD_DIR = build/Release
PRODUCT_NAME = Colloquy.app

CP = ditto --rsrc
RM = rm
ZIP = ditto -c -k --keepParent --sequesterRsrc
XCODEBUILD = xcodebuild

COMMON_XCODE_OPTIONS = -workspace Colloquy.xcworkspace
MAC_XCODE_SCHEME_OPTION = -scheme 'Colloquy (Mac)'
IOS_XCODE_SCHEME_OPTION = -scheme 'Colloquy (iOS)'
DEBUG_XCODE_CONFIG_OPTION = -configuration Debug
RELEASE_XCODE_CONFIG_OPTION = -configuration Release
CLEAN_XCODE_OPTION = clean

all release r:
	$(XCODEBUILD) $(COMMON_XCODE_OPTIONS) $(MAC_XCODE_SCHEME_OPTION) $(RELEASE_XCODE_CONFIG_OPTION)

debug d:
	$(XCODEBUILD) $(COMMON_XCODE_OPTIONS) $(MAC_XCODE_SCHEME_OPTION) $(DEBUG_XCODE_CONFIG_OPTION)

clean c:
	$(XCODEBUILD) $(COMMON_XCODE_OPTIONS) $(MAC_XCODE_SCHEME_OPTION) $(CLEAN_XCODE_OPTION)

clean-release cr:
	$(XCODEBUILD) $(COMMON_XCODE_OPTIONS) $(MAC_XCODE_SCHEME_OPTION) $(RELEASE_XCODE_CONFIG_OPTION) $(CLEAN_XCODE_OPTION)

clean-debug cd:
	$(XCODEBUILD) $(COMMON_XCODE_OPTIONS) $(MAC_XCODE_SCHEME_OPTION) $(DEBUG_XCODE_CONFIG_OPTION) $(CLEAN_XCODE_OPTION)

clean-all ca:
	$(XCODEBUILD) $(COMMON_XCODE_OPTIONS) $(MAC_XCODE_SCHEME_OPTION) $(RELEASE_XCODE_CONFIG_OPTION) $(CLEAN_XCODE_OPTION)
	$(XCODEBUILD) $(COMMON_XCODE_OPTIONS) $(MAC_XCODE_SCHEME_OPTION) $(DEBUG_XCODE_CONFIG_OPTION) $(CLEAN_XCODE_OPTION)

install i: release
	-$(RM) -rf $(INSTALL_DIR)/$(PRODUCT_NAME)
	$(CP) $(RELEASE_BUILD_DIR)/$(PRODUCT_NAME) $(INSTALL_DIR)/$(PRODUCT_NAME)

zip z: clean-release release
	$(ZIP) $(RELEASE_BUILD_DIR)/$(PRODUCT_NAME) $(RELEASE_BUILD_DIR)/$(PRODUCT_NAME).zip