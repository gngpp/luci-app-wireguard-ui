# luci-app-wireguard-ui
Wireguard UI for OpenWrt (还没有写完测试，请不要编译)

## How to build

- Enter in your openwrt dir

- Openwrt official SnapShots

  *1. update golang 19.x (Fix build for `openwrt-21.02/22.03` branches)*

  ```shell
  rm -rf feeds/packages/lang/golang
  svn export https://github.com/gngpp/openwrt_packages_lang_golang/branches/master feeds/packages/lang/golang
  ```

  *2. get luci-app-wireguard-ui source & building*
  
  ```shell
  git clone https://github.com/gngpp/luci-app-wireguard-ui package/wireguard-ui
  make menuconfig # choose LUCI -> Applications -> luci-app-wireguard-ui
  make V=s
  ```
