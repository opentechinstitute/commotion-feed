include $(TOPDIR)/rules.mk

PKG_NAME:=nodeupgrade
PKG_VERSION:=0.5
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/nodeupgrade
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+busybox
  TITLE:=NodeUpgrade
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/nodeupgrade/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/nodeupgrade $(1)/sbin
endef

$(eval $(call BuildPackage,nodeupgrade))
