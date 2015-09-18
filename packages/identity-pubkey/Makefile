include $(TOPDIR)/rules.mk

PKG_NAME:=identity-pubkey
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/identity-pubkey
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+px5g-standalone
  TITLE:=identity-pubkey
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/identity-pubkey/install
	# Base files
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pubkey.init $(1)/etc/init.d/identity-pubkey
endef

$(eval $(call BuildPackage,identity-pubkey))
