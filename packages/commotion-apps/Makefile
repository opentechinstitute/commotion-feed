include $(TOPDIR)/rules.mk

MODULE_NAME:=commotion-apps
MODULE_TITLE:=Commotion-Apps

THEME_NAME:=commotion
THEME_TITLE:=Commotion

PKG_NAME:=$(MODULE_NAME)
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/commotion-apps.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=commotion
  CATEGORY:=Commotion
  DEPENDS:=+luci-commotion +luci-theme-commotion +netcat
  TITLE:=Commotion Application Portal
  URL:=https://commotionwireless.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
  Provides a discovery mechanism and LuCI interface for local applications on a Commotion mesh network
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/uci-defaults/commotion-apps $(1)/etc/uci-defaults/commotion-apps || true
	$(INSTALL_DIR) $(1)/www/luci-static/$(THEME_NAME)
	$(CP) $(PKG_BUILD_DIR)/luci-static/$(THEME_NAME)/* $(1)/www/luci-static/$(THEME_NAME)/ || true
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_BUILD_DIR)/lua/* $(1)/usr/lib/lua/ || true
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/commotion-service-parser $(1)/usr/sbin/ || true
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
        ( . /etc/uci-defaults/commotion-apps ) && rm -f /etc/uci-defaults/commotion-apps
}
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
