include $(TOPDIR)/rules.mk

PKG_NAME:=commotion-dnsproxy
PKG_RELEASE:=1
PKG_VERSION=master

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/commotion-dnsproxy.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Utilities
  TITLE:=Commotion DNS Proxy
  MAINTAINER:=Open Technology Institute
  DEPENDS:=+libldns
  URL:=https://commotionwireless.net/
endef

define Package/$(PKG_NAME)/description
	Simple DNS proxy that allows captive portal on non-internet-connected networks.
endef

define Package/$(PKG_NAME)/conffiles
	/etc/config/dnsproxy
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dnsproxy $(1)/usr/sbin/dnsproxy
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./dnsproxy.init $(1)/etc/init.d/dnsproxy
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./dnsproxy.config $(1)/etc/config/dnsproxy
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
