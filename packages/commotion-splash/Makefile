include $(TOPDIR)/rules.mk

MODULE_NAME:=commotion-splash
MODULE_TITLE:=Commotion-Splash

THEME_NAME:=commotion
THEME_TITLE:=Commotion

PKG_NAME:=$(MODULE_NAME)
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/danstaples/commotion-splash.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=commotion
  CATEGORY:=Commotion
  DEPENDS:=+nodogsplash
  TITLE:=Commotion Captive Portal
  URL:=https://commotionwireless.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
  Provides a LuCI interface for the Nodogsplash captive portal software
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/
	$(INSTALL_DIR) $(1)/usr/share/commotion/files
	$(CP) $(PKG_BUILD_DIR)/files/usr/share/commotion/files/splash.html $(1)/usr/share/commotion/files/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/etc/uci-defaults/commotion-splash $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/www/luci-static/commotion
	$(CP) $(PKG_BUILD_DIR)/htdocs/commotion/* $(1)/www/luci-static/commotion/
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
        ( . /etc/uci-defaults/$(PKG_NAME) ) && rm -f /etc/uci-defaults/$(PKG_NAME)
}
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
