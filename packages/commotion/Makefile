include $(TOPDIR)/rules.mk

PKG_NAME:=commotion
PKG_VERSION:=master
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Collections
  DEPENDS:=+libcommotion +commotiond +commotion-client +commotion-debug-helper \
+olsrd +olsrd-mod-arprefresh +olsrd-mod-nameservice +olsrd-mod-dnssd \
+olsrd-mod-dyn-gw-plain +olsrd-mod-mdp +olsrd-mod-txtinfo +dnsmasq\
+commotion-service-manager +wpad-mini +freifunk-gwcheck +ip\
+patch +rng-tools +commotion-plugins +commotion-mdp-client
  TITLE:=Commotion
  URL:=https://commotionwireless.net/
endef

define Package/$(PKG_NAME)/description
  A metapackage that includes all available non-GUI Commotion packages.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	true
endef
CO_BUILD_PACKAGES += commotion

define Package/$(PKG_NAME)-gui
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Collections
  DEPENDS:=+commotion +luci-mod-commotion +luci-proto-commotion \
+luci-commotion-dashboard +olsrd-mod-jsoninfo +luci-commotion-apps \
+luci-commotion-splash +luci-theme-commotion +commotion-dnsproxy \
+luci-commotion-debug +luci-app-olsr +luci-app-olsr-viz +netcat +luci-app-splash
  TITLE:=Commotion GUI
  URL:=https://commotionwireless.net/
endef

define Package/$(PKG_NAME)-gui/description
  A metapackage that includes all available GUI Commotion packages.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)-gui/install
	true
endef
CO_BUILD_PACKAGES += commotion-gui

$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
