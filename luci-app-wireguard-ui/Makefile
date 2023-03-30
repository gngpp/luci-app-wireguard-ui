# Copyright (C) 2016 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-wireguard-ui
PKG_VERSION:=1.0.8
PKG_RELEASE:=1

LUCI_TITLE:=LuCI support for wireguard-ui
LUCI_DEPENDS:=+wireguard-ui +luci-compat

define Package/$(PKG_NAME)/conffiles
/etc/wireguard-ui
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-wireguard-ui ) && rm -f /etc/uci-defaults/luci-wireguard-ui
	exit 0
}
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
