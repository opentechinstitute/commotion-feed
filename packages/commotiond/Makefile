include $(TOPDIR)/rules.mk

PKG_NAME:=commotiond
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

SERVAL_VERSION:=commotion-wireless

TARGET_CFLAGS += -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION) -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION)/nacl/include -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION)/sqlite-amalgamation-3070900
CMAKE_OPTIONS+=-DDEBUG:Bool=Off -DOPENWRT:Bool=On

define Package/libcommotion
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Libraries
  DEPENDS:=+librt +libserval-dna
  TITLE:=libcommotion
  URL:=https://commotionwireless.net/
endef

define Package/libcommotion/description
  An embedded library and API for managing mesh networks.
endef

define Package/libcommotion/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libcommotion.so $(1)/usr/lib
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/commotion.h $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libcommotion.so $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/plugins/libcommotion_serval-sas.so $(1)/usr/lib
endef

CO_BUILD_PACKAGES += libcommotion

define Package/commotiond
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Utilities
  DEPENDS:=+libcommotion
  TITLE:=Commotion Daemon
  URL:=https://commotionwireless.net/
endef

define Package/commotiond/description
  An embedded C daemon for managing mesh networks.
endef

define Package/commotiond/conffile
	/etc/config/commotiond
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
	$(INSTALL_DIR) $(1)/usr/lib/commotion/plugins
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/commotiond $(1)/usr/sbin
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/openwrt/etc/uci-defaults/commotiond $(1)/etc/uci-defaults
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/openwrt/etc/config/commotiond $(1)/etc/config
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/etc/init.d/commotiond $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/lib/netifd/commotion.dhcp.script $(1)/lib/netifd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/lib/netifd/proto/commotion.sh $(1)/lib/netifd/proto
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/openwrt/lib/functions/commotion.sh $(1)/lib/functions
	$(CP) $(PKG_BUILD_DIR)/openwrt/usr/share/commotion/patches/* $(1)/usr/share/commotion/patches/
	$(CP) $(PKG_BUILD_DIR)/files/commotiond.conf $(1)/etc/commotion/
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
  SUBMENU:=Utilities
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

define Package/commotion-plugins
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Libraries
  DEPENDS:=+libcommotion +commotiond
  TITLE:=Commotion Plugins
  URL:=https://commotionwireless.net/
endef

define Package/commotion-plugins/description
	Additional plugins for the commotion management libraries.
endef

define Package/commotion-plugins/install
	$(INSTALL_DIR) $(1)/usr/lib/commotion/plugins
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/plugins/libcommotion_serval-dna.so $(1)/usr/lib/commotion/plugins
endef
CO_BUILD_PACKAGES += commotion-plugins

define Package/commotion-mdp-client
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Utilities
  DEPENDS:=+libcommotion +commotiond
  TITLE:=Commotion MDP Client
  URL:=https://commotionwireless.net/
endef

define Package/commotion-mdp-client/description
	Commotion client for Serval's Mesh Datagram Protocol.
endef

define Package/commotion-mdp-client/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/plugins/libcommotion_serval-sas.so $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/serval-client $(1)/usr/bin/
endef
CO_BUILD_PACKAGES += commotion-mdp-client

$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
