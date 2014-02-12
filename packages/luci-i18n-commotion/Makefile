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

define Package/Translation-Build-Options
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Translations
  URL:=https://commotionwireless.net/
  TITLE:=Translation-Build-Options
  HIDDEN:=True
  MENU:=1
endef

define Package/Translation-Build-Options/config
	source "$(SOURCE)/Config.in"
endef

CO_BUILD_PACKAGES += Translation-Build-Options

#Get and make the po2lmo po->lmo script
define Build/Prepare
	$(call Build/Prepare/Default,)
	$(SVN) co http://svn.luci.subsignal.org/luci/trunk/libs/web/ $(PKG_BUILD_DIR)/po2lmo/.
	$(MKDIR) $(PKG_BUILD_DIR)/lang
	$(MAKE_po2lmo)
  ifeq ($(CONFIG_BUNDLE_I18N),y)
	  $(SVN) co http://svn.luci.subsignal.org/luci/trunk/po $(PKG_BUILD_DIR)/.
  endif
endef

#Define Language Packages
define prep-package
  define Package/Commotion-$(1)
    SECTION:=commotion
    CATEGORY:=Commotion
    SUBMENU:=Translations
    #if not bundled require the luci-translation pack for this language
    ifneq ($(CONFIG_BUNDLE_I18N),y)
      DEPENDS:=+luci-i18n-$(2)
    endif
    URL:=https://commotionwireless.net/
    TITLE:=Commotion-$(1)
  endef

  define Package/Commotion-$(1)/description
    $(1) language tranlations for the Commotion Wireless Router user interfaces. You can contribute at www.transifex.com/projects/p/commotion-user-interface/.
  endef

  #Compile and move chosen language lmo files
  define Package/Commotion-$(1)/install
	$(PKG_BUILD_DIR)/po2lmo/src/po2lmo $(PKG_BUILD_DIR)/translations/commotion-luci-$(3).po $(PKG_BUILD_DIR)/lang/commotion-luci-$(3).lmo
  #get other po files from luci if bundling
    ifeq ($(CONFIG_BUNDLE_I18N),y)
	  for file in $(PKG_BUILD_DIR)/po/$(3)/*.po; do \
	    $(PKG_BUILD_DIR)/po2lmo/src/po2lmo $$file.po $(PKG_BUILD_DIR)/lang/$$file.lmo \
	  done
    endif
	$(INSTALL_DIR) $$(1)/usr/lib/lua/luci/i18n/
	$(CP) $(PKG_BUILD_DIR)/lang/* $$(1)/usr/lib/lua/luci/i18n/
    ifeq ($(CONFIG_BUNDLE_I18N),y)
	  $(CP) $(PKG_BUILD_DIR)/scripts/uci-defaults/luci-i18n-$$(2) $$(1)/etc/uci-defaults/
    endif
  endef

  #If bundled with luci files then prepare the language as luci would
  ifeq ($(CONFIG_BUNDLE_I18N),y)
    #After install run the uci-defaults file so it works without rebooting.
    define Package/Commotion-$(1)/postinst
    #!/bin/sh
    # check if we are on real system
    if [ -z "$${IPKG_INSTROOT}" ]; then
          ( . /etc/uci-defaults/luci-i18n-$$(2) ) &&	rm -f /etc/uci-defaults/luci-i18n-$$(2)
          echo "Adding $$(1) to available translations."
    fi
    exit 0
    endef

    #before removing package on uninstall
    define Package/Commotion-$(1)/prerm
    #!/bin/sh
    #remove language from luci translation options
    if [ -z "$${IPKG_INSTROOT}" ]; then
          uci delete luci.languages.$$(3)
          uci commit luci
    fi
    exit 0
    endef
  endif
  CO_BUILD_PACKAGES += Commotion-$(1)
endef

#languages to offer
$(eval $(call prep-package,French,french,fr))
$(eval $(call prep-package,Spanish,spanish,es))

#actually build packages if added to the CO_BUILD_PACKAGES and checked in menuconfig
$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
