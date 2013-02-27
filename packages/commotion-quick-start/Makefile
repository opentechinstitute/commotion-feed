# Copyright (C) 2013 Open Technology Institute
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk

PKG_NAME:=commotion-quick-start
PKG_RELEASE:=1
PKG_VERSION:=Version02

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:opentechinstitute/commotion-quick-start.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/commotion-quick-start
  SECTION:=commotion
  CATEGORY:=Commotion
  TITLE:=Commotion Quick Start Wizard
# Commotionbase will be superseded by daemon
#  DEPENDS:=+commotionbase
  URL:=https://commotionwireless.net
endef

define Build/Compile
endef

define Package/commotion-quick-start/description
  Commotion Quick Start Wizard is an easy interface for users to set up and customize their Commotion devices
endef

define Package/commotion-quick-start/install
	$(INSTALL_DIR) $(1)/
	$(CP) -a ./files/* $(1)/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,commotion-quick-start))
