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
+commotion-dashboard-helper +olsrd +olsrd-mod-arprefresh +olsrd-mod-dnssd \
+olsrd-mod-dyn-gw-plain +olsrd-mod-dyn-gw +olsrd-mod-jsoninfo +olsrd-mod-mdp +olsrd-mod-txtinfo \
+commotion-service-manager +iperf +crda +wpad-mini +freifunk-firewall +freifunk-gwcheck \
+remote-update +patch +bridge +commotion-plugins +commotion-mdp-client
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
+luci-commotion-dashboard +luci-commotion-apps \
+luci-commotion-splash +luci-i18n-commotion +luci-theme-commotion \
+luci-commotion-debug +luci-app-olsr +luci-app-olsr-viz
  TITLE:=Commotion GUI
  URL:=https://commotionwireless.net/
endef

define Package/$(PKG_NAME)/description
  A metapackage that includes all available GUI Commotion packages.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	true
endef
CO_BUILD_PACKAGES += commotion-gui

$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
