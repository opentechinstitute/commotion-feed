include $(TOPDIR)/rules.mk

PKG_NAME:=tcpreplay
PKG_VERSION:=4.0.4
PKG_RELEASE:=1

PKG_SOURCE_URL:=@SF/tcpreplay
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_MD5SUM:=e290239bd5ba2451880b96ff64a43a7d

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/tcpreplay
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +librt
  TITLE:=tcpreplay
endef

CONFIGURE_ARGS += \
	--with-libpcap="$(STAGING_DIR)/usr" \
	
CONFIGURE_VARS += \
	ac_cv_have_bpf=no
	
define Package/tcpreplay/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tcpreplay $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tcprewrite $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,tcpreplay))