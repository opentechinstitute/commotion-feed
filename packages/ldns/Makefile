#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

LDNS_VERSION:=1.6.17

PKG_NAME:=ldns
PKG_VERSION:=$(LDNS_VERSION)-commotion
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(LDNS_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.nlnetlabs.nl/downloads/ldns
PKG_MD5SUM:=a79423bcc4129e6d59b616b1cae11e5e

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libldns/Default
  URL:=http://www.nlnetlabs.nl/projects/ldns/
endef

define Package/libldns
  $(call Package/libldns/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A library to simplify DNS programming
endef

define Package/libldns/description
  The goal of ldns is to simplify DNS programming, it supports recent RFCs like
  the DNSSEC documents, and allows developers to easily create software
  conforming to current RFCs, and experimental software for current Internet
  Drafts.
endef

define Package/drill
  $(call Package/libldns/Default)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=DNS(SEC) information tool
  DEPENDS+= +libldns
endef

define Package/drill/description
  drill is a tool to designed to get all sorts of information out of the DNS. It
  is specificly designed to be used with DNSSEC.
endef

CONFIGURE_ARGS += \
	--disable-ecdsa \
	--disable-gost \
	--with-drill \
	--without-ssl \
	--disable-sha2 \
	--disable-dane

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ldns $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libldns.{a,so*} $(1)/usr/lib/
endef

define Package/libldns/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libldns.so.* $(1)/usr/lib/
endef

define Package/drill/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/drill $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libldns))
$(eval $(call BuildPackage,drill))
