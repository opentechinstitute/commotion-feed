include $(TOPDIR)/rules.mk

PKG_NAME:=serval-dna
PKG_VERSION:=commotion-wireless
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/opentechinstitute/serval-dna.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz

PKG_FIXUP:=autoreconf

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/serval-dna
	SECTION:=commotion
	CATEGORY:=Commotion
	SUBMENU:=Utilities
	TITLE:=serval-dna
	DEPENDS:=+libpthread +librt
	URL:=http://www.servalproject.org/
endef

define Package/serval-dna/description
  Serval Daemon
endef

define Package/serval-dna/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/servald $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/serval
	$(CP) ./files/etc/serval/serval.conf $(1)/etc/serval/serval.conf
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/serval-dna $(1)/etc/uci-defaults/serval-dna
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/serval-dna $(1)/etc/init.d/serval-dna
endef

define Package/libserval-dna
	SECTION:=commotion
	CATEGORY:=Commotion
	SUBMENU:=Libraries
	TITLE:=libserval-dna
	DEPENDS:=+libpthread +librt
	URL:=http://www.servalproject.org/
endef

define Package/libserval-dna/description
  Serval Library
endef

define Package/libserval-dna/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libservald.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc/serval
	$(CP) ./files/etc/serval/serval.conf $(1)/etc/serval/serval.conf
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/serval-dna $(1)/etc/uci-defaults/serval-dna
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libservald.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/serval.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/include/serval
	$(CP) $(PKG_BUILD_DIR)/*.h $(1)/usr/include/serval/
	$(CP) $(PKG_BUILD_DIR)/nacl/include/*.h $(1)/usr/include/serval/
endef

$(eval $(call BuildPackage,serval-dna))
$(eval $(call BuildPackage,libserval-dna))


