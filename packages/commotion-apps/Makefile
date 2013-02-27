include $(TOPDIR)/rules.mk

MODULE_NAME:=commotion-apps
MODULE_TITLE:=Commotion-Apps

THEME_NAME:=commotion
THEME_TITLE:=Commotion

PKG_NAME:=$(MODULE_NAME)
PKG_VERSION:=1.0
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
  DEPENDS:=+commotionbase +luci-commotion +luci-theme-commotion
  TITLE:=Commotion Application Portal
  URL:=http://commotionwireless.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
  Provides a discovery mechanism and LuCI interface for local applications on a Commotion mesh network
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/www/luci-static/commotion
	$(CP) -a ./luci-static/commotion/* $(1)/www/luci-static/commotion/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) -a ./lua/* $(1)/usr/lib/lua/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) -a ./commotion-service-parser $(1)/usr/sbin/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
