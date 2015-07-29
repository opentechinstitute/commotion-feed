#
# nodewatcher module
# FOWSR REPORTING MODULE
#

# Module metadata
MODULE_ID="sensors.fowsr"
MODULE_SERIAL=1

# Configuration
FOWSR_MEASURE_CACHE="/var/nodewatcher.fowsr_measure"

#
# Gather statistics from the weather station
#
fowsr_measure_stats()
{
  if [ ! -x /usr/bin/fowsr ]; then
    return
  fi
  
  /usr/bin/fowsr -c | while read entry; do
    key="$(echo $entry | cut -d ' ' -f 1)"
    value="$(echo $entry | cut -d ' ' -f 2)"

    if [[ "$key" == "RHi" ]]; then
      label="Humidity indoor (%)"
    elif [[ "$key" == "Ti" ]]; then
      label="Temperature indoor (C)"
    elif [[ "$key" == "RHo" ]]; then
      label="Humidity outdoor (%)"
    elif [[ "$key" == "To" ]]; then
      label="Temperature outdoor (C)"
    elif [[ "$key" == "RP" ]]; then
      label="Relative pressure (hPa)"
    elif [[ "$key" == "WS" ]]; then
      label="Wind speed (m/s)"
    elif [[ "$key" == "WG" ]]; then
      label="Wind gust (m/s)"
    elif [[ "$key" == "DIR" ]]; then
      label="Wind direction (heading)"
    elif [[ "$key" == "Rtot" ]]; then
      label="Rain total volume (mm/m2)"
    else
      continue
    fi

    show_entry "environment.sensorfowsr${key}.serial" "$label"
    show_entry "environment.sensorfowsr${key}.temp" "$value"
  done
}

#
# Report output function
#
report()
{
  if [ -f "$FOWSR_MEASURE_CACHE" ]; then
    cat "$FOWSR_MEASURE_CACHE"
  fi
}

#
# Handles periodic cache population (called via cron)
#
handle_fowsr_measure()
{
  fowsr_measure_stats > $FOWSR_MEASURE_CACHE
}

