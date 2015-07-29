#
# nodewatcher module
# SIMPLE SENSORS WITH A SIMPLE PROTOCOL
# Presents data as: DIGITEMP ONE-WIRE TEMPERATURE SENSORS
#

# Module metadata
MODULE_ID="sensors.onewire.digitemp"
MODULE_SERIAL=1

# Configuration
SENSOR_MEASURE_CACHE="/var/nodewatcher.simpleserial_measure"
SENSOR_TIMEOUT=100
SENSOR_NAMES="\
Pressure-(kPa) \
Temperature-(C) \
Temperature-1W-(C) \
"
SENSOR_START_ID=1

#
# Function that performs the actual measurements.
#
simpleserial_measure_stats()
{
  local sensor_id=`expr $SENSOR_START_ID - 1`
  
  for file in "/dev/ttyATH0"; do
    if [ -c "$file" ]; then
      for sensor_name in $SENSOR_NAMES; do
        # Sensor serial number
        # XXX: Generated dummy number
        sensor_serial="$sensor_name"
        sensor_id=`expr $sensor_id + 1`
        
        # Read sensor value via simple HTTP-like protocol
        sensor_value=`/usr/bin/readsensor -i $sensor_id -d $file -t $SENSOR_TIMEOUT 2>/dev/null`
        
        # Return sensor readings
        if [ -n "$sensor_value" ]; then
          show_entry "environment.sensor$sensor_id.serial" "$sensor_serial"
          show_entry "environment.sensor$sensor_id.temp" "$sensor_value"
        fi
      done
    fi
  done
}

#
# Report output function
#
report()
{
  if [ -f "$SENSOR_MEASURE_CACHE" ]; then
    cat "$SENSOR_MEASURE_CACHE"
  else
    # Run data collection in the background
    handle_simpleserial_measure &
  fi
}


#
# Handles periodic cache population (called via cron)
#
handle_simpleserial_measure()
{
  simpleserial_measure_stats > $SENSOR_MEASURE_CACHE
}

