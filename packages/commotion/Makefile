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
+olsrd-mod-dyn-gw-plain +olsrd-mod-jsoninfo +olsrd-mod-mdp +olsrd-mod-txtinfo \
+serval-crypto +iperf +crda +wpad +freifunk-firewall +freifunk-gwcheck \
+remote-update +patch +bridge
  TITLE:=Commotion
  URL:=https://commotionwireless.net/
endef

define Package/$(PKG_NAME)/description
  A metapackage that includes all available non-GUI Commotion packages.
endef

define Package/$(PKG_NAME)/install
	true
endef
CO_BUILD_PACKAGES += commotion

define Package/$(PKG_NAME)-gui
  SECTION:=commotion
  CATEGORY:=Commotion
  SUBMENU:=Collections
  DEPENDS:=+commotion +luci-mod-commotion +luci-proto-commotion +commotion-lua \
+luci-commotion-dashboard +luci-commotion-apps +luci-commotion-quickstart \
+luci-commotion-splash +luci-i18n-commotion +luci-theme-commotion \
+luci-commotion-debug +luci-app-olsr +luci-app-olsr-viz +luci-app-qos \
+luci-mod-failsafe
  TITLE:=Commotion GUI
  URL:=https://commotionwireless.net/
endef

define Package/$(PKG_NAME)/description
  A metapackage that includes all available GUI Commotion packages.
endef

define Package/$(PKG_NAME)/install
	true
endef
CO_BUILD_PACKAGES += commotion-gui

$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
