include $(TOPDIR)/rules.mk

SERVAL_VERSION:=batphone-release-0.91

PKG_NAME:=serval-crypto
PKG_RELEASE:=1
PKG_VERSION:=3.0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/serval-crypto.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += $(TLS_CFLAGS) -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION) -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION)/nacl/include -DHAVE_BCOPY -O3
TARGET_LDFLAGS += -L$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION)/ -lservald

define Package/libserval-crypto
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Utilities
  TITLE:=Serval signing and verification library
  MAINTAINER:=Open Technology Institute
  DEPENDS:=+serval-dna
  URL:=https://commotionwireless.net/
endef

define Package/libserval-crypto/description
  This package provides a library for signing 
  arbitrary strings using Serval keypairs, 
  and verifying these signatures.
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
  DEPENDS:=+serval-dna +libserval-crypto
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