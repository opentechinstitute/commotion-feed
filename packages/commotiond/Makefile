include $(TOPDIR)/rules.mk

MODULE_NAME:=commotion-daemon-bundle
MODULE_TITLE:=Commotion Daemon Bundle

PKG_NAME:=commotion-daemon-bundle
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/commotiond.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS+=-DDEBUG:Bool=Off -DOPENWRT:Bool=On

define Package/libcommotion
  SECTION:=commotion
  CATEGORY:=Commotion
  TITLE:=libcommotion
  URL:=https://commotionwireless.net/
endef

define Package/libcommotion/description
  An embedded embedded library and API for managing mesh networks.
endef

define Package/libcommotion/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libcommotion.so $(1)/usr/lib
endef

CO_BUILD_PACKAGES += libcommotion

define Package/commotiond
  SECTION:=commotion
  CATEGORY:=Commotion
  DEPENDS:=+libcommotion
  TITLE:=Commotion Daemon
  URL:=https://commotionwireless.net/
endef

define Package/commotiond/description
  An embedded C daemon for managing mesh networks.
endef

define Package/commotiond/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/etc/commotion
	$(INSTALL_DIR) $(1)/etc/commotion/profiles.d
	$(INSTALL_DIR) $(1)/lib/netifd
	$(INSTALL_DIR) $(1)/lib/netifd/proto
	$(INSTALL_DIR) $(1)/lib/functions
	$(INSTALL_DIR) $(1)/usr/share/commotion/patches
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/commotiond $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/etc/uci-defaults/commotiond $(1)/etc/uci-defaults
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/etc/init.d/commotiond $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/lib/netifd/commotion.dhcp.script $(1)/lib/netifd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/lib/netifd/proto/commotion.sh $(1)/lib/netifd/proto
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/lib/functions/commotion.sh $(1)/lib/functions
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/usr/share/commotion/patches/dnsmasq.patch $(1)/usr/share/commotion/patches
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/usr/share/commotion/patches/mac80211.sh.patch $(1)/usr/share/commotion/patches
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/profiles.d/defaultAP $(1)/etc/commotion/profiles.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/profiles.d/defaultMesh $(1)/etc/commotion/profiles.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/profiles.d/defaultPlug $(1)/etc/commotion/profiles.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/profiles.d/defaultSec $(1)/etc/commotion/profiles.d
endef

define Package/commotiond/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/commotiond ) && rm -f /etc/uci-defaults/commotiond
}
endef
CO_BUILD_PACKAGES += commotiond

define Package/commotion-client
  SECTION:=commotion
  CATEGORY:=Commotion
  DEPENDS:=+libcommotion +commotiond
  TITLE:=Commotion Client
  URL:=https://commotionwireless.net/
endef

define Package/commotion-client/description
	A client for managing the Commotion daemon.
endef

define Package/commotion-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/commotion $(1)/usr/bin
endef

CO_BUILD_PACKAGES += commotion-client
$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
