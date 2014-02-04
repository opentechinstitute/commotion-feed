
include $(TOPDIR)/rules.mk

PKG_NAME:=commotion-lua-helpers
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/commotion-lua-helpers.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
CO_BUILD_PACKAGES:=

include $(INCLUDE_DIR)/package.mk

define Build/Configure
endef

define Build/Compile
endef

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

#actually build packages if added to the CO_BUILD_PACKAGES and checked in menuconfig
$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
