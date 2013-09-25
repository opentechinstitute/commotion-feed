include $(TOPDIR)/rules.mk

MODULE_NAME:=commotion-bigboard-send
MODULE_TITLE:=Commotion-Bigboard-Send

THEME_NAME:=commotion
THEME_TITLE:=Commotion

PKG_NAME:=$(MODULE_NAME)
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/commotion-bigboard-send.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=commotion
	CATEGORY:=Commotion
  SUBMENU:=Utilities
	DEPENDS:=+curl
	TITLE:=Commotion Bigboard Sender
	URL:=https://commotionwireless.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
	Provides a transport mechanism to a remote Commotion Bigboard
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/bin/commotion-bigboard-send $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config/
	$(CP) $(PKG_BUILD_DIR)/config/commotion-dash $(1)/etc/config/
	$(INSTALL_DIR) $(1)/etc/uci-defaults/
	$(CP) $(PKG_BUILD_DIR)/bin/commotion-bigboard-send-install-cron.sh $(1)/etc/uci-defaults/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
