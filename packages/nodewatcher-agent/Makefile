include $(TOPDIR)/rules.mk

PKG_NAME:=nodewatcher-agent
PKG_VERSION:=2015-05-15
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/wlanslovenija/nodewatcher-agent.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE_VERSION:=5d1d9a736af3babda85070b7dc70cbf9b9c821a3
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Jernej Kos <jernej@kos.mx>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/include/nodewatcher-agent $(1)/usr/include/
endef

define Package/nodewatcher-agent/default
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Nodewatcher agent daemon
  DEPENDS:=+libubus +libubox +libjson-c
endef

define Package/nodewatcher-agent
  $(Package/nodewatcher-agent/default)
  DEPENDS+= +libuci +libblobmsg-json
endef

define Package/nodewatcher-agent/description
  Nodewatcher agent daemon
endef

define Package/nodewatcher-agent/conffiles
/etc/config/nodewatcher
endef

define Package/nodewatcher-agent/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/nodewatcher-agent.init $(1)/etc/init.d/nodewatcher-agent
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nodewatcher-agent $(1)/usr/bin/nodewatcher-agent
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libnodewatcher-agent-common.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/nodewatcher-agent.config $(1)/etc/config/nodewatcher
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_CONF) ./files/rpcd-acl.json $(1)/usr/share/rpcd/acl.d/nodewatcher.json
	$(INSTALL_DIR) $(1)/www/nodewatcher
endef


# 1: module name
# 2: extra dependencies
# 3: module title/description
define BuildModule

  PKG_CONFIG_DEPENDS += CONFIG_PACKAGE_nodewatcher-agent-mod-$(1)

  define Package/nodewatcher-agent-mod-$(1)
    $(Package/nodewatcher-agent/default)
    TITLE+= ($(1) module)
    DEPENDS+=nodewatcher-agent $(2)
  endef

  define Package/nodewatcher-agent-mod-$(1)/description
    $(3)
  endef

  define Package/nodewatcher-agent-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/nodewatcher-agent
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(1).so $$(1)/usr/lib/nodewatcher-agent/
  endef

  $$(eval $$(call BuildPackage,nodewatcher-agent-mod-$(1)))

endef

$(eval $(call BuildPackage,nodewatcher-agent))
$(eval $(call BuildModule,general,,Provides general system info.))
$(eval $(call BuildModule,resources,,Provides system resource usage info.))
$(eval $(call BuildModule,interfaces,netifd,Provides network interface info.))
$(eval $(call BuildModule,wireless,libiwinfo,Provides wireless interface info.))
$(eval $(call BuildModule,keys_ssh,,Provides SSH key info.))
$(eval $(call BuildModule,clients,,Provides client info.))
$(eval $(call BuildModule,http_push,libcurl,Provides HTTP push support.))
$(eval $(call BuildModule,routing_babel,,Provides Babel routing info.))

