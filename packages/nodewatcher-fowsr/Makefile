include $(TOPDIR)/rules.mk

PKG_NAME:=nodewatcher-fowsr
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/nodewatcher-fowsr
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+nodewatcher-core +fowsr +cronscripts
  TITLE:=nodewatcher-fowsr
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/nodewatcher-fowsr/install
	# Periodic measurements
	$(INSTALL_DIR) $(1)/etc/crontabs/run.10
	$(INSTALL_BIN) ./files/fowsr_measure $(1)/etc/crontabs/run.10/01-fowsr_measure

	# Modules
	$(INSTALL_DIR) $(1)/etc/nodewatcher.d
	$(INSTALL_DATA) ./files/fowsr.sh $(1)/etc/nodewatcher.d/fowsr.sh
endef

$(eval $(call BuildPackage,nodewatcher-fowsr))
