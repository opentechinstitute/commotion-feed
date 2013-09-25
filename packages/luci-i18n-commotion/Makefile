# Copyright (C) 2010 Commotion
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-i18n-commotion
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/luci-i18n-commotion.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

SVN = svn
MAKE = make
MAKE_po2lmo = $(MAKE) -C $(PKG_BUILD_DIR)/po2lmo/
MKDIR = mkdir

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=User Interface
  TITLE:=Commotion LuCI Translation
  DEPENDS:=+luci-commotion +luci-theme-commotion
  URL:=https://commotionwireless.net
  MENU:=1
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/config
	source "$(SOURCE)/Config.in"
endef

define Package/$(PKG_NAME)/description
  Commotion tranlation installation manager.
endef

#TODO add the language code for future compatability with standard country codes germany:de then modify parsing in build/prepare
languages := french spanish

ifdef ERROR_DEP
$(error Missing Lua Dev package. This is a build dependency. Please install liblua5.1-dev))
endif

define Build/Prepare
	$(call Build/Prepare/Default,)
	$(SVN) co http://svn.luci.subsignal.org/luci/trunk/libs/web/ $(PKG_BUILD_DIR)/po2lmo/.
	$(MKDIR) $(PKG_BUILD_DIR)/lang
	$(MAKE_po2lmo) || ("Missing Lua Dev package. This is a build dependency. Please install liblua5.1-dev" && false)
	#!/bin/bash
	IFS='  '; \
	for i in $(foreach lang, $(languages), $(lang):$(CONFIG_commotion-luci-i18n-$(lang))); do \
	  lang=`echo $$$$i |sed s/:.*//`; \
	  lg=`echo $$$$lang |cut -c1-2`;\
	  bool=`echo $$$$i |sed s/^.*://`; \
	  if [ "$$$$bool" = "y" ]; then \
		$(PKG_BUILD_DIR)/po2lmo/src/po2lmo $(PKG_BUILD_DIR)/translations/commotion-luci-$$$$lg.po $(PKG_BUILD_DIR)/lang/commotion-luci.$$$$lg.lmo; \
	  fi ; \
	done; 
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n/
	$(CP) $(PKG_BUILD_DIR)/lang/* $(1)/usr/lib/lua/luci/i18n/ || true
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
