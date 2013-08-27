include $(TOPDIR)/rules.mk

MODULE_NAME:=commotion-bigboard-send
MODULE_TITLE:=Commotion-Bigboard

THEME_NAME:=commotion
THEME_TITLE:=Commotion

PKG_NAME:=$(MODULE_NAME)
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/opentechinstitute/commotion-bigboard-send.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=commotion
	CATEGORY:=Commotion
	DEPENDS:=+curl
	TITLE:=Commotion Bigboard Sender
	URL:=https://commotionwireless.net
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
	Provides a transport mechanism to a remote Commotion Bigboard
endef

define Package/$(PKG_NAME)/install
	$(CP) $(PKG_BUILD_DIR)/bin/commotion-bigboard-send /usr/bin/
	$(CP) $(PKG_BULD_DIR)/conf/commotion-dash /etc/config/
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
cronline ='* * * * *  /usr/bin/commotion-bigboard-send'
echo "$cronline" >> /etc/crontabs/root
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
