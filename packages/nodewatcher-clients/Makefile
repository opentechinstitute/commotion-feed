include $(TOPDIR)/rules.mk

PKG_NAME:=nodewatcher-clients
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/nodewatcher-clients
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+nodewatcher-core +nullhttpd
  TITLE:=nodewatcher-clients
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/nodewatcher-clients/install
	# Nullhttpd templates
	$(INSTALL_DIR) $(1)/www/nullhttpd
	$(CP) -r ./files/htdocs/* $(1)/www/nullhttpd
	
	# Actions
	$(INSTALL_DIR) $(1)/etc/actions.d
	$(INSTALL_BIN) ./files/olsr_gateway_action $(1)/etc/actions.d/olsr_gateway_action
	$(INSTALL_BIN) ./files/olsr_dns_action $(1)/etc/actions.d/olsr_dns_action
	
	# Common functions
	$(INSTALL_DIR) $(1)/lib/nodewatcher
	$(INSTALL_DATA) ./files/actions_common.sh $(1)/lib/nodewatcher/actions.sh
	
	# Modules
	$(INSTALL_DIR) $(1)/etc/nodewatcher.d
	$(INSTALL_DATA) ./files/clients.sh $(1)/etc/nodewatcher.d/clients.sh
endef

$(eval $(call BuildPackage,nodewatcher-clients))
