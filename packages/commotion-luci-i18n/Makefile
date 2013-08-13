# Copyright (C) 2010 Commotion
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk

PKG_NAME:=commotion-luci-i18n
PKG_VERSION:=Feature_582
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/commotion-luci-i18n.git:
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/commotion-luci-i18n
  SECTION:=commotion
  CATEGORY:=Commotion
  TITLE:=Commotion LuCI Translation
  DEPENDS:=+luci-commotion +luci-theme-commotion
  URL:=https://commotionwireless.net
  MENU:=1
endef

define Build/Compile
endef

define Package/commotion-luci-i18n/config
	source "$(SOURCE)/Config.in"
endef

define Package/commotion-debug-helper/description
  Commotion tranlation installation manager.
endef

define Package/commotion-debug-helper/install
	for LANG in SPANISH FRENCH do
		ifeq ($(CONFIG_COMMOTION_LUCI_I18N_$$LANG),y)
			lang=`echo ${LANG:0:2} | tr [:upper:] [:lower:]`
			$(CP) $(PKG_BUILD_DIR)/lang/commotion-$$lang.lmo $(1)/usr/lib/lua/luci/i18n/ || true
		endif
	done
endef

$(eval $(call BuildPackage,commotion-luci-i18n))
