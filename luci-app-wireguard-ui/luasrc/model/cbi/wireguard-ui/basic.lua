local m, s

m = Map("wireguard-ui", translate("wireguard-ui"), translate("A web user interface to manage your WireGuard setup.") .. "<br/>" .. [[<a href="https://wireguard-ui.nn.ci/zh/guide/drivers/local.html" target="_blank">]] .. translate("User Manual") .. [[</a>]])

m:section(SimpleSection).template  = "wireguard-ui/wireguard-ui_status"

s = m:section(TypedSection, "wireguard-ui")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enable"))
o.rmempty = false

o = s:option(Value, "port", translate("Port"))
o.datatype = "and(port,min(1))"
o.rmempty = false

o = s:option(Flag, "username", translate("Username"))
o.default = admin
o.rmempty = false

o = s:option(Flag, "password", translate("Password"))
o.default = admin
o.rmempty=false

o = s:option(Flag, "smtp-hostname", translate("SMTP Hostname"))
o.rmempty = false

o = s:option(Flag, "smtp-username", translate("SMTP Username"))
o.rmempty=false

o = s:option(Flag, "smtp-password", translate("SMTP Password"))
o.rmempty=false

return m
