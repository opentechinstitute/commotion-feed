include $(TOPDIR)/rules.mk

PKG_NAME:=commotion-dashboard-helper
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/commotion-dashboard-helper.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=commotion
	CATEGORY:=Commotion
  SUBMENU:=Utilities
	DEPENDS:=+luci-lib-httpclient +luci-lib-nixio +luci-lib-sys +lua-helpers-debugger +luci-lib-core
	TITLE:=Commotion Dashboard Helper
	URL:=https://commotionwireless.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
	Provides a transport mechanism to a remote dashboard
endef

define Package/$(PKG_NAME)/conffile
	/etc/config/commotion-dash
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/config/commotion-dash $(1)/etc/config/
	$(INSTALL_DIR) $(1)/etc/uci-defaults/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/uci-defaults/commotion-dashboard-helper $(1)/etc/uci-defaults/
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/commotion-dashboard-helper ) && rm -f /etc/uci-defaults/commotion-dashboard-helper
}
endef
CO_BUILD_PACKAGES += commotion-dashboard-helper

define Package/luci-commotion-dashboard
	SECTION:=commotion
	CATEGORY:=Commotion
  SUBMENU:=User Interface
	DEPENDS:=+commotion-dashboard-helper +luci-mod-commotion +lua-helpers-validate +lua-helpers-encode +lua-helpers-debugger
	TITLE:=Commotion Dashboard Helper Interface
	URL:=https://commotionwireless.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-commotion-dashboard/description
	Provides a transport mechanism to a remote dashboard (Web GUI)
endef


define Package/luci-commotion-dashboard/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci 2>/dev/null || true
endef

define Package/luci-commotion-dashboard/postinst
endef

CO_BUILD_PACKAGES += luci-commotion-dashboard
$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
