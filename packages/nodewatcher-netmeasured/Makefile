include $(TOPDIR)/rules.mk

PKG_NAME:=nodewatcher-netmeasured
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/nodewatcher-netmeasured
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+nodewatcher-core +netmeasured
  TITLE:=nodewatcher-netmeasured
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/nodewatcher-netmeasured/install
	$(INSTALL_DIR) $(1)/etc/nodewatcher.d
	$(INSTALL_DATA) ./files/netmeasured.sh $(1)/etc/nodewatcher.d/netmeasured.sh
endef

$(eval $(call BuildPackage,nodewatcher-netmeasured))
