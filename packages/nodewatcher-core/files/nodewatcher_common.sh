#
# Nodewatcher functions library
#
. /lib/functions.sh

get_client_subnets()
{
  client_subnets=
  
  config_cb() {
    local ipaddr netmask
    config_get enttype "$CONFIG_SECTION" TYPE

    if [[ "$enttype" == "alias" && "`echo $CONFIG_SECTION | grep subnet`" != "" ]]; then
      config_get ipaddr "$CONFIG_SECTION" ipaddr
      config_get netmask "$CONFIG_SECTION" netmask
      append client_subnets "$ipaddr/$netmask"
    fi
  }

  config_load network
}

get_local_ip()
{
  LOCAL_IP="`uci -q get network.subnet0.ipaddr`"
}

#
# A helper function for outputing key-value pairs in proper
# format.
#
show_entry()
{
  local key="$1"
  local value="$2"
  
  echo "${key}: ${value}"
}

#
# A helper function for outputting key-value pairs where
# value is read from a file if one exists, otherwise the
# default value is used.
#
show_entry_from_file()
{
  local key="$1"
  local filename="$2"
  local default="$3"

  if [ -f "${filename}" ]; then
    show_entry "${key}" "`cat ${filename}`"
  else
    show_entry "${key}" "${default}"
  fi
}

#
# A helper function for outputing key-value pairs where
# value is read from UCI.
#
show_uci_simple()
{
  local key="$1"
  local uci_key="$2"
  local default="$3"
  local uci_value="`uci -q get ${uci_key}`"
  if [[ "$?" != "0" ]]; then
    uci_value="${default}"
  fi
  show_entry "${key}" "${uci_value}"
}

#
# Converts a variable so it is suitable for using inside
# the key hierarchy.
#
convert_to_key()
{
  local key="$1"
  eval $key="$(eval echo \$$key | sed 's/[\. ]\+/-/g')"
}

