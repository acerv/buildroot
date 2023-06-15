################################################################################
#
# ltx
#
################################################################################

LTX_VERSION = 0.1
LTX_SITE = https://github.com/acerv/ltx.git
LTX_SITE_METHOD = git
LTX_LICENSE = GPL-2.0, GPL-2.0+
LTX_LICENSE_FILES = COPYING

ifeq ($(BR2_PACKAGE_LTX_LIB),y)
define LTX_BUILD_CMDS
	$(MAKE) shared CC="$(TARGET_CC)" -C $(@D)
endef

define LTX_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libltx.so  $(TARGET_DIR)/lib
endef
else
define LTX_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
endef

define LTX_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/ltx  $(TARGET_DIR)/bin
endef
endif

$(eval $(generic-package))
