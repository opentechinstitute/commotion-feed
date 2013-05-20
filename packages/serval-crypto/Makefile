include $(TOPDIR)/rules.mk

SERVAL_VERSION:=batphone-release-0.90

PKG_NAME:=serval-crypto
PKG_RELEASE:=1
PKG_VERSION:=2.0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/serval-crypto.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/serval-crypto
  SECTION:=commotion
  CATEGORY:=Commotion
  TITLE:=Serval signing and verification
  MAINTAINER:=Open Technology Institute
  DEPENDS:=+serval-dna
endef

define Package/serval-crypto/description
  This package provides functions for signing 
  arbitrary strings using Serval keypairs, 
  and verifying these signatures.
endef

TARGET_CFLAGS += $(TLS_CFLAGS) -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION) -I$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION)/nacl/include -O3
TARGET_LDFLAGS += -L$(BUILD_DIR)/serval-dna-$(SERVAL_VERSION)/ -lservald

define Package/serval-crypto/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/serval-* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,serval-crypto))
