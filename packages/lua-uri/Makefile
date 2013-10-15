include $(TOPDIR)/rules.mk

PKG_NAME:=lua-uri
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.geoffrichards.co.uk/lua/uri/download/
PKG_MD5SUM:=eb555554dafb44252b19d77099bf5091

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Lua URI/URL normalizing and validating
  URL:=http://www.geoffrichards.co.uk/lua/uri/
  DEPENDS:= +lua
endef

define Package/$(PKG_NAME)/description
 Lua-URI allows you to normalize and validate URIs/URLs in Lua programs, and provides methods for manipulating them in various ways
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/uri
	$(CP) $(PKG_BUILD_DIR)/uri.lua $(1)/usr/lib/lua
	$(CP) $(PKG_BUILD_DIR)/uri/_util.lua $(1)/usr/lib/lua/uri
	$(CP) $(PKG_BUILD_DIR)/uri/_relative.lua $(1)/usr/lib/lua/uri
endef

CO_BUILD_PACKAGES += lua-uri

define Package/$(PKG_NAME)-extras
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Lua URI/URL normalizing and validating, extra modules
  URL:=http://www.geoffrichards.co.uk/lua/uri/
  DEPENDS:= +lua-uri
endef

define Package/$(PKG_NAME)-extras/description
 Lua-URI allows you to normalize and validate URIs/URLs in Lua programs, and provides methods for manipulating them in various ways
endef

define Package/$(PKG_NAME)-extras/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/uri/urn
	$(INSTALL_DIR) $(1)/usr/lib/lua/uri/file
	$(foreach b,_login data file ftp http https pop rtsp rtspu telnet urn,$(CP) $(PKG_BUILD_DIR)/uri/$(b).lua $(1)/usr/lib/lua/uri;)
	$(CP) $(PKG_BUILD_DIR)/uri/urn/*.lua $(1)/usr/lib/lua/uri/urn
	$(CP) $(PKG_BUILD_DIR)/uri/file/unix.lua $(1)/usr/lib/lua/uri/file
endef

CO_BUILD_PACKAGES += lua-uri-extras


$(foreach b,$(CO_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
