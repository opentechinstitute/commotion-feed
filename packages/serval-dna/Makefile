include $(TOPDIR)/rules.mk

PKG_NAME:=serval-dna
PKG_VERSION:=START-2952-ge1949c1
PKG_RELEASE=3

PKG_SOURCE_VERSION:=commotion-wireless
PKG_SOURCE_URL:=https://github.com/opentechinstitute/serval-dna/archive/$(PKG_SOURCE_VERSION).tar.gz?
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Build/Compile
	$(call Build/Compile/Default)
	$(call Build/Compile/Default, \
		libserval.so \
	)
endef

define Package/serval-dna
	SECTION:=commotion
	CATEGORY:=Commotion
	SUBMENU:=Utilities
	TITLE:=serval-dna
	DEPENDS:=+libpthread +librt
	URL:=http://www.servalproject.org/
endef

define Package/serval-dna/description
  Serval DNA is a daemon that implements the Serval Mesh network protocol as an
  overlay network encapsulated within UDP/IP packets over Wi-Fi. The daemon,
  when running, joins the OpenWRT router to the local Serval Mesh Wi-Fi
  network. This allows it to participate in dynamic mesh routing (using
  Serval's own mesh routing protocol), file distribution (using the Rhizome
  store-and-forward protocol), secure text messaging (using the MeshMS
  protocol), and to relay secure voice calls (using the VoMP voice-over-mesh
  protocol) and other secure Serval traffic (such as tunnelled SOCKS proxy
  connections) between Android devices running the Serval Mesh app.

  The Serval Mesh Extender device is essentially a Wi-Fi router running the
  Serval DNA daemon on OpenWRT.
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
	$(CP) $(PKG_BUILD_DIR)/libserval.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc/serval
	$(CP) ./files/etc/serval/serval.conf $(1)/etc/serval/serval.conf
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/serval-dna $(1)/etc/uci-defaults/serval-dna
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libserval.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/serval.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/sqlite-amalgamation-3070900/sqlite3.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/include/serval
	$(CP) $(PKG_BUILD_DIR)/*.h $(1)/usr/include/serval/
	$(CP) $(PKG_BUILD_DIR)/nacl/include/*.h $(1)/usr/include/serval/
endef

$(eval $(call BuildPackage,serval-dna))
$(eval $(call BuildPackage,libserval-dna))
