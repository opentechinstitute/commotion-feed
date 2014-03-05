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
CO_BUILD_PACKAGES:=

include $(INCLUDE_DIR)/package.mk

define Build/Compile
endef

#Get and make the po2lmo po->lmo script
define Build/Prepare
	$(call Build/Prepare/Default,)
	$(SVN) co http://svn.luci.subsignal.org/luci/trunk/libs/web/ $(PKG_BUILD_DIR)/po2lmo/.
	$(MKDIR) $(PKG_BUILD_DIR)/lang
	$(MAKE_po2lmo)
endef

#Define Language Packages
define prep-package
  define Package/Commotion-$(1)
    SECTION:=commotion
    CATEGORY:=Commotion
    SUBMENU:=Translations
    DEPENDS:=+luci-i18n-$(2)
    URL:=https://commotionwireless.net/
    TITLE:=Commotion-$(1)
  endef

  define Package/Commotion-$(1)/description
    $(1) language tranlations for the Commotion Wireless Router user interfaces. You can contribute at www.transifex.com/projects/p/commotion-user-interface/.
  endef

  #Compile and move chosen language lmo files
  define Package/Commotion-$(1)/install
	$(PKG_BUILD_DIR)/po2lmo/src/po2lmo $(PKG_BUILD_DIR)/translations/commotion-luci-$(3).po $(PKG_BUILD_DIR)/lang/commotion-luci-$(3).lmo
	$(INSTALL_DIR) $$(1)/usr/lib/lua/luci/i18n/
	$(CP) $(PKG_BUILD_DIR)/lang/commotion-luci-$(3).lmo $$(1)/usr/lib/lua/luci/i18n/
  endef

  CO_BUILD_PACKAGES += Commotion-$(1)
endef

#languages to offer
#$(eval $(call prep-package,French,french,fr))
$(eval $(call prep-package,Spanish,spanish,es))

#actually build packages if added to the CO_BUILD_PACKAGES and checked in menuconfig
$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
