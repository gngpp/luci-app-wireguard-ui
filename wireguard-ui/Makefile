#
# Copyright (C) 2019-2023 gngpp <gngppz@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wireguard-ui
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ngoduykhanh/wireguard-ui/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=75cb1b56892d2076be9a8dab69e4752301da65a5abbd787ab6deaa1ab32b69b4

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE
PKG_MAINTAINER:=gngpp <gngppz@gmail.com>


PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_WIREGUARD-UI:=github.com/ngoduykhanh/wireguard-ui
GO_PKG:=github.com/ngoduykhanh/wireguard-ui
GO_PKG_LDFLAGS:=-w -s
GO_PKG_LDFLAGS_X:= \
	$(WIREGUARD-UI).Version=v$(PKG_VERSION)-$(ARCH)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Wireguard web interface
  URL:=https://github.com/ngoduykhanh/wireguard-ui
  DEPENDS:=$(GO_ARCH_DEPENDS)
endef

define Package/$(PKG_NAME)/description
  A web user interface to manage your WireGuard setup.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(eval $(call Download,$(PKG_NAME)))
	$(PKG_BUILD_DIR)/prepare_assets.sh
endef

define Package/$(PKG_NAME)/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/wireguard-ui $(1)/usr/bin
endef

$(eval $(call BuildPackage,$(PKG_NAME)))