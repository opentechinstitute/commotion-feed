#
# nodewatcher module
# KORUZA CONTROLLER OUTPUT
# Presents data as: DIGITEMP ONE-WIRE TEMPERATURE SENSORS
#

# Module metadata
MODULE_ID="sensors.koruza"
MODULE_SERIAL=1

# Configuration
STATE_FILE="/tmp/koruza-collector.state"

#
# Report output function
#
report()
{
  if [ -f ${STATE_FILE} ]; then
    cat ${STATE_FILE}
    echo -n > ${STATE_FILE}
  fi
}

