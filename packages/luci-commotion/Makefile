include $(TOPDIR)/rules.mk

PKG_NAME:=luci-commotion
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/luci-commotion.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Build/Configure
endef

define Build/Compile
endef

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

define Package/luci-mod-commotion/description
  Contains Commotion Wireless Project tweaks and additions to stock LuCI interface.
endef

define Package/luci-mod-commotion/conffile
	/etc/config/setup_wizard
endef

define Package/luci-mod-commotion/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/uci-defaults/luci-mod-commotion $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/config/setup_wizard $(1)/etc/config
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/config/serval $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/etc/init.d/hostname $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/share/commotion/files
	$(CP) $(PKG_BUILD_DIR)/files/usr/share/commotion/files/* $(1)/usr/share/commotion/files/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/share/commotion/patches
	$(CP) $(PKG_BUILD_DIR)/files/usr/share/commotion/patches/* $(1)/usr/share/commotion/patches/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/commotion
	$(CP) $(PKG_BUILD_DIR)/luasrc/controller/commotion/* $(1)/usr/lib/lua/luci/controller/commotion/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/commotion
	$(CP) $(PKG_BUILD_DIR)/luasrc/model/cbi/commotion/* $(1)/usr/lib/lua/luci/model/cbi/commotion/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/about.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/apply.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/apply_xhr.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/confirm.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/conn_clients.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/debug.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/error_olsr.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/help.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/license.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/meshprofile.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/nearby_md.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/revert.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/serval_keyring.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/splash.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/status.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/viz.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/welcome.htm $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/cbi/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/cbi/osmll_value.htm $(1)/usr/lib/lua/luci/view/cbi
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/cbi/commotion/addAP.htm $(1)/usr/lib/lua/luci/view/cbi/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/cbi/commotion/addMesh.htm $(1)/usr/lib/lua/luci/view/cbi/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/cbi/commotion/delegator.htm $(1)/usr/lib/lua/luci/view/cbi/commotion
	$(INSTALL_DIR) $(1)/www/luci-static/resources/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/htdocs/luci-static/commotion_index.html $(1)/www/luci-static/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/htdocs/luci-static/resources/OSMLatLon.htm $(1)/www/luci-static/resources/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/htdocs/luci-static/resources/osm.js $(1)/www/luci-static/resources/
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
  DEPENDS:=+commotiond +luci-mod-commotion
  TITLE:=Commotion LuCI Protocol Extensions
  URL:=https://commotionwireless.net/
endef

define Package/luci-proto-commotion/description
  OpenWRT script hooks for Commotion interfaces.
endef

define Package/luci-proto-commotion/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/admin_network
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/model/cbi/admin_network/proto_commotion.lua $(1)/usr/lib/lua/luci/model/cbi/admin_network
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/network
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/model/network/proto_commotion.lua $(1)/usr/lib/lua/luci/model/network
endef

CO_BUILD_PACKAGES += luci-proto-commotion

define Package/luci-theme-commotion
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=User Interface
  DEPENDS:=+luci-theme-base +lua-helpers-crypto
  TITLE:=LuCI Theme - Commotion
  URL:=https://www.commotionwireless.net/
endef

define Package/luci-theme-commotion/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/uci-defaults/luci-theme-commotion $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/www/luci-static/commotion
	$(CP) $(PKG_BUILD_DIR)/htdocs/luci-static/commotion/* $(1)/www/luci-static/commotion/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/themes/commotion
	$(CP) $(PKG_BUILD_DIR)/luasrc/view/themes/commotion/* $(1)/usr/lib/lua/luci/view/themes/commotion/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/cbi
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/cbi/full_valuefooter.htm $(1)/usr/lib/lua/luci/view/cbi
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/cbi/full_valueheader.htm $(1)/usr/lib/lua/luci/view/cbi
endef

define Package/luci-theme-commotion/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-theme-commotion ) && rm -f /etc/uci-defaults/luci-theme-commotion
}
endef

CO_BUILD_PACKAGES += luci-theme-commotion

define Package/luci-commotion-apps
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=User Interface
  DEPENDS:=+luci-mod-commotion +luci-theme-commotion +netcat \
+commotiond +avahi-daemon +lua-helpers-validate +lua-helpers-encode \
+lua-helpers-util +commotion-service-manager
  TITLE:=Commotion Application Portal
  URL:=https://commotionwireless.net
endef

define Package/luci-commotion-apps/description
  Provides a LuCI interface for local applications on a Commotion mesh network
endef

define Package/luci-commotion-apps/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/uci-defaults/luci-commotion-applications $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/www/luci-static/commotion
	$(CP) $(PKG_BUILD_DIR)/htdocs/luci-static/apps/* $(1)/www/luci-static/commotion/ || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/commotion
	$(CP) $(PKG_BUILD_DIR)/luasrc/view/commotion/apps_* $(1)/usr/lib/lua/luci/view/commotion/ || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/themes/commotion
	$(CP) $(PKG_BUILD_DIR)/luasrc/view/themes/commotion/apps_* $(1)/usr/lib/lua/luci/view/themes/commotion/ || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/model/cbi/commotion/app_settings.lua $(1)/usr/lib/lua/luci/model/cbi/commotion
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/controller/commotion/apps_controller.lua $(1)/usr/lib/lua/luci/controller/commotion
endef

define Package/luci-commotion-apps/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-commotion-applications ) && rm -f /etc/uci-defaults/luci-commotion-applications
}
endef

CO_BUILD_PACKAGES += luci-commotion-apps

define Package/luci-commotion-splash
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=User Interface
  DEPENDS:=+nodogsplash +luci-mod-commotion +lua-helpers-encode +lua-helpers-util +lua-helpers-debugger +lua-helpers-validate +lua-helpers-network
  TITLE:=Commotion Captive Portal
  URL:=https://commotionwireless.net
endef

define Package/luci-commotion-splash/description
  Provides a LuCI interface for the Nodogsplash captive portal software
endef

define Package/luci-commotion-splash/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/commotion/nds_config.lua $(1)/usr/lib/lua/luci/commotion
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/commotion-splash
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/controller/commotion-splash/splash.lua $(1)/usr/lib/lua/luci/controller/commotion-splash
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/commotion-splash
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/model/cbi/commotion-splash/splash_settings.lua $(1)/usr/lib/lua/luci/model/cbi/commotion-splash
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/model/cbi/commotion-splash/splashtext.lua $(1)/usr/lib/lua/luci/model/cbi/commotion-splash
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/commotion-splash
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion-splash/splash.htm $(1)/usr/lib/lua/luci/view/commotion-splash
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion-splash/splash_settings.htm $(1)/usr/lib/lua/luci/view/commotion-splash
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion-splash/splashtext.htm $(1)/usr/lib/lua/luci/view/commotion-splash
	$(INSTALL_DIR) $(1)/usr/share/commotion/files
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/share/commotion/files/splash.html $(1)/usr/share/commotion/files
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/etc/uci-defaults/luci-commotion-splash $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/etc/init.d/ucidog $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/bin/uci2nds.lua $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/config/nodogsplash $(1)/etc/config/
	$(INSTALL_DIR) $(1)/www/luci-static/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/htdocs/commotion/apps.128.png $(1)/www/luci-static/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/htdocs/commotion/internet.128.png $(1)/www/luci-static/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/htdocs/commotion/local.128.png $(1)/www/luci-static/commotion
endef

define Package/luci-commotion-splash/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
        ( . /etc/uci-defaults/luci-commotion-splash ) && rm -f /etc/uci-defaults/luci-commotion-splash
}
endef

CO_BUILD_PACKAGES += luci-commotion-splash

define Package/commotion-dashboard-helper
	SECTION:=commotion
	CATEGORY:=Commotion
  SUBMENU:=Utilities
	DEPENDS:=+luci-lib-httpclient +luci-lib-nixio +luci-lib-sys +lua-helpers-debugger +luci-lib-core
	TITLE:=Commotion Dashboard Helper
	URL:=https://commotionwireless.net
endef

define Package/commotion-dashboard-helper/description
	Provides a transport mechanism to a remote dashboard
endef

define Package/commotion-dashboard-helper/conffile
	/etc/config/commotion-dash
endef

define Package/commotion-dashboard-helper/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/bin/commotion-bigboard-send $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/bin/request_json.sh $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/config/commotion-dash $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/uci-defaults/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/etc/uci-defaults/commotion-dashboard-helper $(1)/etc/uci-defaults
endef

define Package/commotion-dashboard-helper/postinst
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

define Package/luci-commotion-dashboard/description
	Provides a transport mechanism to a remote dashboard (Web GUI)
endef

define Package/luci-commotion-dashboard/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/commotion-dash
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/controller/commotion-dash/bigboard-conf.lua $(1)/usr/lib/lua/luci/controller/commotion-dash
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/commotion-dash
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion-dash/bigboard-conf.htm $(1)/usr/lib/lua/luci/view/commotion-dash
endef

define Package/luci-commotion-dashboard/postinst
endef

CO_BUILD_PACKAGES += luci-commotion-dashboard

define Package/commotion-debug-helper
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Utilities
  TITLE:=Commotion Debug Helper
  URL:=https://commotionwireless.net
endef

define Package/commotion-debug-helper/description
  Commotion tool for generating a report file used for troubleshooting
endef

define Package/commotion-debug-helper/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/sbin/cdh $(1)/usr/sbin
endef

CO_BUILD_PACKAGES += commotion-debug-helper

define Package/luci-commotion-debug
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=User Interface
  TITLE:=Commotion Debug Interface
  DEPENDS:=+luci-mod-commotion +luci-theme-commotion +commotion-debug-helper
  URL:=https://commotionwireless.net
endef

define Package/luci-commotion-debug/description
  Commotion tool for generating a report file used for troubleshooting (Web UI)
endef

define Package/luci-commotion-debug/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/controller/commotion/debugger.lua $(1)/usr/lib/lua/luci/controller/commotion
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/commotion
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/luasrc/view/commotion/debugger.htm $(1)/usr/lib/lua/luci/view/commotion
endef

CO_BUILD_PACKAGES += luci-commotion-debug

#create lua helper packages
define lua-helpers
  define Package/lua-helpers-$(1)
    SECTION:=commotion
    CATEGORY:=Commotion
    SUBMENU:=Libraries
    DEPENDS:=$(if $(3),$(3),$(2))
    URL:=https://commotionwireless.net/
    TITLE:=$(if $(2),$(2),$(1))
  endef

  define Package/lua-helpers-$(1)/description
    Contains Commotion Wireless lua helper functions related to $(1).
  endef

  define Package/lua-helpers-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/lua/luci/commotion
	$(CP) $(PKG_BUILD_DIR)/modules/$(1).lua $$(1)/usr/lib/lua/luci/commotion #2>/dev/null || true
  endef

  CO_BUILD_PACKAGES += lua-helpers-$(1)
endef

#Dependencies
CRYDEP:=+coreutils +coreutils-sha1sum +luci +luci-ssl
LUCIDEP:=+luci +lua-uri
DEBDEP:=+luci +BUSYBOX_CONFIG_LOGGER:busybox
NETDEP:=+luci +ubus +BUSYBOX_CONFIG_CUT:busybox +BUSYBOX_CONFIG_GREP:busybox +luci-lib-json +commotiond

#call lua-helpers,NAME,TITLE,DEPENDENCIES
$(eval $(call lua-helpers,crypto,Crypto,$(CRYDEP)))
$(eval $(call lua-helpers,debugger,Debugger,$(DEBDEP)))
$(eval $(call lua-helpers,validate,Validate,$(LUCIDEP)))
$(eval $(call lua-helpers,network,Networking,$(NETDEP)))
$(eval $(call lua-helpers,util,Utilities,$(LUCIDEP)))
$(eval $(call lua-helpers,encode,Encode,$(LUCIDEP)))
$(eval $(call lua-helpers,ccbi,Commotion-CBI,$(LUCIDEP)))
$(eval $(call lua-helpers,setup_wizard,Setup-Wizard,$(LUCIDEP)))
$(eval $(call lua-helpers,dispatch,Dispatch,$(LUCIDEP)))

$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
