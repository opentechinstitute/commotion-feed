include $(TOPDIR)/rules.mk

MODULE_NAME:=commotiond
MODULE_TITLE:=Commotiond

PKG_NAME:=commotion-daemon
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/jheretic/commotiond.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/build

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libcommotion
  SECTION:=commotion
  CATEGORY:=Commotion
  TITLE:=libcommotion
  URL:=https://commotionwireless.net/
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/libcommotion/description
  An embedded embedded library and API for managing mesh networks.
endef

define Package/libcommotion/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libcommotion $(1)/usr/lib
endef

define Package/libcommotion/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/libcommotion) ) && rm -f /etc/uci-defaults/libcommotion
}
endef
CO_BUILD_PACKAGES += libcommotion

define Package/commotiond
  SECTION:=commotion
  CATEGORY:=Commotion
  DEPENDS:=+libcommotion
  TITLE:=Commotion Daemon
  URL:=https://commotionwireless.net/
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/commotiond/description
  An embedded C daemon for managing mesh networks.
endef

define Package/commotiond/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/commotiond $(1)/usr/sbin
endef

define Package/commotiond/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/commotiond) ) && rm -f /etc/uci-defaults/commotiond
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

define Build/Configure
endef

define Build/Compile
endef

define Package/commotion-client/description
	A client for managing the Commotion daemon.
endef

define Package/commotion-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/commotion $(1)/usr/bin
endef

define Package/commotion-client/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/commotion) ) && rm -f /etc/uci-defaults/commotion
}
endef
CO_BUILD_PACKAGES += commotion-client
$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
