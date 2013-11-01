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

#create lua helper packages
define lua-helpers
  define Package/commotion-lua-helper-$(1)
	SECTION:=commotion
	CATEGORY:=Commotion
	SUBMENU:=Libraries
	DEPENDS:=$(if $(3),$(3),$(2))
	URL:=https://commotionwireless.net/
    TITLE:=$(if $(2),$(2),$(1))
  endef

  define Package/commotion-lua-helper-$(1)/install
	$(call Package/commotion-lua-helper/install/template,$$(1),modules/$(1))
#calls the install template passing the name and the path modules/[name]
  endef

  ifneq ($(CONFIG_PACKAGE_helpers-$(1)),)
    LUCI_SELECTED_MODULES+=modules/$(1)
  endif

  CO_BUILD_PACKAGES += commotion-lua-helper-$(1)
endef

### Install Template ###
#TODO make this reflect the actual install of each lua module
define Package/commotion-lua-helpers/install/template
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/commotion/
	$(CP) -a $(PKG_BUILD_DIR)/$(2)/* $(1)/ #2>/dev/null || true
endef

CRYDEP:=+coreutils +coreutils-sha1sum +luci
LUCIDEP:=+luci
DEBDEP:=+luci +logger
NETDEP:=+luci +ubus  +BUSYBOX_CONFIG_CUT:busybox +BUSYBOX_CONFIG_GREP:busybox 

#call lua-helpers,NAME,TITLE,DEPENDENCIES
$(eval $(call lua-helpers,crypto,Crypto,$(CRYDEP)))
$(eval $(call lua-helpers,debugger,Debugger,$(DEBDEP)))
$(eval $(call lua-helpers,identify,Identify,$(LUCIDEP)))
$(eval $(call lua-helpers,network,Networking,$(NETDEP)))
$(eval $(call lua-helpers,util,Utilities,$(LUCIDEP)))
$(eval $(call lua-helpers,encode,Encode,$(LUCIDEP)))

#actually build packages if added to the CO_BUILD_PACKAGES and checked in menuconfig
$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
