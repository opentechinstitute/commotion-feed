include $(TOPDIR)/rules.mk

PKG_NAME:=nodewatcher-koruza
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/nodewatcher-koruza
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+nodewatcher-core +koruza-controller
  TITLE:=nodewatcher-koruza
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/nodewatcher-koruza/install
	# Modules
	$(INSTALL_DIR) $(1)/etc/nodewatcher.d
	$(INSTALL_DATA) ./files/koruza.sh $(1)/etc/nodewatcher.d/koruza.sh
endef

$(eval $(call BuildPackage,nodewatcher-koruza))
