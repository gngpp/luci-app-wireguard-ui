#
# Copyright (C) 2016-2019 Jason A. Donenfeld <Jason@zx2c4.com>
# Copyright (C) 2016 Baptiste Jonglez <openwrt@bitsofnetworks.org>
# Copyright (C) 2016-2017 Dan Luedtke <mail@danrl.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=wireguard-tools

PKG_VERSION:=1.0.20210914
PKG_RELEASE:=2

PKG_SOURCE:=wireguard-tools-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://git.zx2c4.com/wireguard-tools/snapshot/
PKG_HASH:=97ff31489217bb265b7ae850d3d0f335ab07d2652ba1feec88b734bc96bd05ac

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/package-defaults.mk

MAKE_PATH:=src
MAKE_VARS += PLATFORM=linux

define Package/wg-quick
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  URL:=https://www.wireguard.com
  MAINTAINER:=Jason A. Donenfeld <Jason@zx2c4.com>
  TITLE:=WireGuard userspace control program (wg)
  DEPENDS:= \
	  +@BUSYBOX_CONFIG_IP \
	  +@BUSYBOX_CONFIG_FEATURE_IP_LINK \
	  +kmod-wireguard
endef

define Package/wg-quick/description
  This is an extremely simple script for easily bringing up a WireGuard interface,
  suitable for a few common use cases.

  Use up to add and set up an interface, and use down to tear down and remove an interface.
  Running up adds a WireGuard interface, brings up the interface with the supplied IP addresses,
  sets up mtu and routes, and optionally runs pre/post up scripts. Running down optionally saves
  the current configuration, removes the WireGuard interface, and optionally runs pre/post down scripts.
  Running save saves the configuration of an existing interface without bringing the interface down.
  Use strip to output a configuration file with all wg-quick(8)-specific options removed, suitable for use with wg(8).

  CONFIG_FILE is a configuration file, whose filename is the interface name followed by `.conf'. 
  Otherwise, INTERFACE is an interface name, with configuration found at `/etc/wireguard/INTERFACE.conf', 
  searched first, followed by distro-specific search paths.
  
  Generally speaking, this utility is just a simple script that wraps invocations to wg(8) and ip(8) in order
  to set up a WireGuard interface. It is designed for users with simple needs, and users with more advanced 
  needs are highly encouraged to use a more specific tool, a more complete network manager,
  or otherwise just use wg(8) and ip(8), as usual.
endef

define Package/wg-quick/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/wg-quick/linux.bash $(1)/usr/bin/wg-quick
endef

$(eval $(call BuildPackage,wg-quick))