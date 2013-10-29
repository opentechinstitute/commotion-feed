include $(TOPDIR)/rules.mk

PKG_NAME:=xssfilter
PKG_VERSION:=8.06.22
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://sputnik.freewisdom.org/files/
PKG_MD5SUM:=a34fda4a5948c5c35aba0555810d6024

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Lua filter to prevent cross-site scripting (XSS) attacks
  URL:=http://sputnik.freewisdom.org/lib/xssfilter/
  DEPENDS:= +lua
endef

define Package/$(PKG_NAME)/description
 XSSFilter is a Lua module for filtering out unsafe tags from (X)HTML.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_BUILD_DIR)/lua/xssfilter.lua $(1)/usr/lib/lua
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
