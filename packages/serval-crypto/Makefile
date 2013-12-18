include $(TOPDIR)/rules.mk

SERVAL_VERSION:=commotion-wireless

PKG_NAME:=serval-crypto
PKG_RELEASE:=1
PKG_VERSION:=master

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/serval-crypto.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION) -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION)/nacl/include -O3

define Package/libserval-crypto
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Utilities
  TITLE:=Serval signing and verification library
  MAINTAINER:=Open Technology Institute
  DEPENDS:=+serval-dna +libserval-dna
  URL:=https://commotionwireless.net/
endef

define Package/libserval-crypto/description
  This package provides a library for signing 
  arbitrary strings using Serval keypairs, 
  and verifying these signatures.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/serval-crypto.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libserval-crypto.so $(1)/usr/lib/
endef

define Package/libserval-crypto/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libserval-crypto.so $(1)/usr/lib
endef

CO_BUILD_PACKAGES += libserval-crypto

define Package/serval-crypto
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Utilities
  TITLE:=Serval signing and verification programs
  MAINTAINER:=Open Technology Institute
  DEPENDS:=+serval-dna +libserval-dna +libserval-crypto
  URL:=https://commotionwireless.net/
endef

define Package/serval-crypto/description
  This package provides programs for signing 
  arbitrary strings using Serval keypairs, 
  and verifying these signatures.
endef

define Package/serval-crypto/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/serval-crypto $(1)/usr/sbin/
endef

CO_BUILD_PACKAGES += serval-crypto

$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
