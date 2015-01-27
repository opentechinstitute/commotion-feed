#
# Let's see if this works..
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ndt
PKG_VERSION:=3.6.5
PKG_RELEASE:=1

PKG_BUILD_DIR:=${BUILD_DIR}/ndt-$(PKG_VERSION)
PKG_SOURCE:=ndt-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://software.internet2.edu/sources/ndt

include $(INCLUDE_DIR)/package.mk

define Package/ndt
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpthread +zlib
  TITLE:=Network Testing Tool
endef

define Build/Compile/Default
$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/ndt/install
$(INSTALL_DIR) $(1)/sbin
$(CP) $(PKG_BUILD_DIR)/src/web100clt $(1)/sbin/
endef

$(eval $(call BuildPackage,ndt))
