module("luci.controller.wireguard-ui", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/wireguard-ui") then
		return
	end

	local page = entry({"admin", "nas", "wireguard-ui"}, alias("admin", "nas", "wireguard-ui", "wireguard-ui"), _("wireguard-ui"), 20)
	page.dependent = true
	page.acl_depends = { "luci-app-wireguard-ui" }

	entry({"admin", "nas"}, firstchild(), "NAS", 44).dependent = false
	entry({"admin", "nas", "wireguard-ui", "basic"}, cbi("wireguard-ui/basic"), _("Basic Setting"), 1).leaf = true
	entry({"admin", "nas", "wireguard-ui", "log"}, cbi("wireguard-ui/log"), _("Logs"), 2).leaf = true
	entry({"admin", "nas", "wireguard-ui", "wireguard-ui_status"}, call("wireguard-ui_status")).leaf = true
	entry({"admin", "nas", "wireguard-ui", "get_log"}, call("get_log")).leaf = true
	entry({"admin", "nas", "wireguard-ui", "clear_log"}, call("clear_log")).leaf = true
	entry({"admin", "nas", "wireguard-ui", "admin_info"}, call("admin_info")).leaf = true
end

function wireguard-ui_status()
	local sys  = require "luci.sys"
	local uci  = require "luci.model.uci".cursor()
	local port = tonumber(uci:get_first("wireguard-ui", "wireguard-ui", "port"))

	local status = {
		running = (sys.call("pidof wireguard-ui >/dev/null") == 0),
		port = (port or 5000)
	}

	luci.http.prepare_content("application/json")
	luci.http.write_json(status)
end

function get_log()
	luci.http.write(luci.sys.exec("cat $(uci -q get wireguard-ui.@wireguard-ui[0].temp_dir)/wireguard-ui.log"))
end

function clear_log()
	luci.sys.call("cat /dev/null > $(uci -q get wireguard-ui.@wireguard-ui[0].temp_dir)/wireguard-ui.log")
end

function admin_info()
	local username = luci.sys.exec("/usr/bin/wireguard-ui --data /etc/wireguard-ui password 2>&1 | tail -2 | awk 'NR==1 {print $2}'")
	local password = luci.sys.exec("/usr/bin/wireguard-ui --data /etc/wireguard-ui password 2>&1 | tail -2 | awk 'NR==2 {print $2}'")

	luci.http.prepare_content("application/json")
	luci.http.write_json({username = username, password = password})
end
