#
# nodewatcher module
# NETMEASURED OUTPUT
# Presents data as: DIGITEMP ONE-WIRE TEMPERATURE SENSORS
#

. /usr/share/libubox/jshn.sh

# Module metadata
MODULE_ID="sensors.netmeasured"
MODULE_SERIAL=1

#
# Report output function
#
report()
{
  json_load "`ubus call netmeasured get_probe`"
  json_get_keys _w_probes
  for _w_probe in $_w_probes; do
    json_select "$_w_probe"
    json_get_vars loss_percent
    ubus call netmeasured reset_probe "{ 'probe': '${_w_probe}' }" >/dev/null

    echo "environment.sensor${_w_probe}.serial: Packet Loss Probe ${_w_probe}"
    echo "environment.sensor${_w_probe}.temp: ${loss_percent}"
  done
}

