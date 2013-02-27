include $(TOPDIR)/rules.mk

PKG_NAME:=serval-crypto
PKG_RELEASE:=1
PKG_VERSION:=1.0

PKG_SOURCE_URL:=https://github.com/opentechinstitute/serval-crypto/archive
PKG_SOURCE:=$(PKG_VERSION).tar.gz

PKG_MD5SUM:=7b3d4e7eada83e056e585ee37bcc87bd
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/serval-crypto/default
  SECTION:=commotion
  CATEGORY:=Commotion
  TITLE:=Serval signing and verification
  MAINTAINER:=Open Technology Institute
  DEPENDS:=+serval-dna
endef

define Package/serval-crypto
  $(Package/serval-crypto/default)
  MENU:=1
endef

define Package/serval-crypto/description
  This package provides functions for signing 
  arbitrary strings using Serval keypairs, 
  and verifying these signatures.
endef

TARGET_CFLAGS += $(TLS_CFLAGS) -I$(BUILD_DIR)/serval-dna-2012-10-29 -I$(BUILD_DIR)/serval-dna-2012-10-29/nacl/include -O3
TARGET_LDFLAGS += -L$(BUILD_DIR)/serval-dna-2012-10-29/ -lservald

define Package/serval-crypto/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/serval-* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,serval-crypto))
