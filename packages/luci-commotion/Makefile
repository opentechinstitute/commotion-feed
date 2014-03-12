include $(TOPDIR)/rules.mk

PKG_NAME:=luci-commotion
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/luci-commotion.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/luci-mod-commotion
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=User Interface
  DEPENDS:=+coreutils +coreutils-sha1sum +luci +lua-helpers-debugger +lua-helpers-ccbi \
	+lua-helpers-crypto +lua-helpers-debugger +lua-helpers-dispatch +lua-helpers-encode \
	+lua-helpers-validate +lua-helpers-network +lua-helpers-setup_wizard +lua-helpers-util +luci-lib-json
  TITLE:=Commotion LuCI Module
  URL:=https://commotionwireless.net/
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-mod-commotion/description
  Contains Commotion Wireless Project tweaks and additions to stock LuCI interface.
endef

define Package/luci-mod-commotion/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) $(PKG_BUILD_DIR)/files/etc/uci-defaults/* $(1)/etc/uci-defaults/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) $(PKG_BUILD_DIR)/files/etc/config/* $(1)/etc/config/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) $(PKG_BUILD_DIR)/files/etc/init.d/* $(1)/etc/init.d/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/share/commotion/files
	$(CP) $(PKG_BUILD_DIR)/files/usr/share/commotion/files/* $(1)/usr/share/commotion/files/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/share/commotion/patches
	$(CP) $(PKG_BUILD_DIR)/files/usr/share/commotion/patches/* $(1)/usr/share/commotion/patches/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/commotion
	$(CP) $(PKG_BUILD_DIR)/luasrc/controller/commotion/* $(1)/usr/lib/lua/luci/controller/commotion/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/commotion
	$(CP) $(PKG_BUILD_DIR)/luasrc/model/cbi/commotion/* $(1)/usr/lib/lua/luci/model/cbi/commotion/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/commotion
	$(CP) $(PKG_BUILD_DIR)/luasrc/view/commotion/* $(1)/usr/lib/lua/luci/view/commotion/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/cbi
	$(CP) $(PKG_BUILD_DIR)/luasrc/view/cbi/* $(1)/usr/lib/lua/luci/view/cbi/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/www/luci-static/resources/
	$(CP) $(PKG_BUILD_DIR)/htdocs/luci-static/* $(1)/www/luci-static/ 2>/dev/null || true
endef

define Package/luci-mod-commotion/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-mod-commotion ) && rm -f /etc/uci-defaults/luci-mod-commotion
}
endef

CO_BUILD_PACKAGES += luci-mod-commotion

define Package/luci-proto-commotion
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=User Interface
  DEPENDS:=+commotiond
  TITLE:=Commotion LuCI Protocol Extensions
  URL:=https://commotionwireless.net/
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-proto-commotion/description
  OpenWRT script hooks for Commotion interfaces.
endef

define Package/luci-proto-commotion/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/admin_network
	$(CP) $(PKG_BUILD_DIR)/luasrc/model/cbi/admin_network/* $(1)/usr/lib/lua/luci/model/cbi/admin_network/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/network
	$(CP) $(PKG_BUILD_DIR)/luasrc/model/network/* $(1)/usr/lib/lua/luci/model/network/ 2>/dev/null || true
endef

define Package/luci-proto-commotion/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-proto-commotion ) && rm -f /etc/uci-defaults/luci-proto-commotion
}
endef

CO_BUILD_PACKAGES += luci-proto-commotion

$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
