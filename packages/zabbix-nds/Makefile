include $(TOPDIR)/rules.mk

PKG_NAME:=zabbix-nds
PKG_VERSION:=master
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Utilities
  DEPENDS:=+nodogsplash
  TITLE:=Nodogsplash Zabbix Plugin
  URL:=https://commotionwireless.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
	Provides a key (general.splash) to monitor Nodogsplash through Zabbix.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/zabbix_agentd.conf.d/
	$(INSTALL_DIR) $(1)/etc/uci-defaults/
	$(INSTALL_BIN) ./files/ndsctl.status.sh $(1)/usr/sbin/ndsctl.status.sh
	$(INSTALL_BIN) ./files/splash $(1)/etc/zabbix_agentd.conf.d/splash
	$(INSTALL_BIN) ./files/crontab.sh $(1)/etc/uci-defaults/$(PKG_NAME)
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
        ( . /etc/uci-defaults/$(PKG_NAME) ) && rm -f /etc/uci-defaults/$(PKG_NAME)
}
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
