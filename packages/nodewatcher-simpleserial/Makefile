include $(TOPDIR)/rules.mk

PKG_NAME:=nodewatcher-simpleserial
PKG_VERSION:=0.1
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/nodewatcher-simpleserial
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+nodewatcher-core +readsensor +cronscripts
  TITLE:=nodewatcher-simpleserial
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/nodewatcher-simpleserial/install
	# Periodic measurements
	$(INSTALL_DIR) $(1)/etc/crontabs/run.5
	$(INSTALL_BIN) ./files/simpleserial_measure $(1)/etc/crontabs/run.5/01-simpleserial_measure

	# Modules
	$(INSTALL_DIR) $(1)/etc/nodewatcher.d
	$(INSTALL_DATA) ./files/simpleserial.sh $(1)/etc/nodewatcher.d/simpleserial.sh
endef

$(eval $(call BuildPackage,nodewatcher-simpleserial))
