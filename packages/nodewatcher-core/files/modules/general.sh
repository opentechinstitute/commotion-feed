#
# nodewatcher module
# GENERAL STATISTICS
#

# Module metadata
MODULE_ID="core.general"
MODULE_SERIAL=3

#
# Report output function
#
report()
{
  show_uci_simple "general.uuid" system.@system[0].uuid
  show_uci_simple "general.hostname" system.@system[0].hostname
  show_entry_from_file "general.version" /etc/version "missing"
  show_entry "general.local_time" "`date +%s`"
  show_entry_from_file "general.uptime" /proc/uptime
  show_entry_from_file "general.loadavg" /proc/loadavg
  
  # Memory
  local memfree="`cat /proc/meminfo | awk '/^MemFree/ { print $2 }'`"
  local buffers="`cat /proc/meminfo | awk '/^Buffers/ { print $2 }'`"
  local cached="`cat /proc/meminfo | awk '/^Cached/ { print $2 }'`"
  
  # TODO These are now deprecated and should be removed in a later
  # version (when the old nodewatcher instance is replaced)
  show_entry "general.memfree" "${memfree}"
  show_entry "general.buffers" "${buffers}"
  show_entry "general.cached" "${cached}"
  
  show_entry "general.memory.free" "${memfree}"
  show_entry "general.memory.buffers" "${buffers}"
  show_entry "general.memory.cache" "${cached}"

  # Network resource usage
  show_entry "general.routes.ipv4" "`ip -4 ro sh table all | wc -l`"
  if [[ -f /proc/net/if_inet6 ]]; then
    show_entry "general.routes.ipv6" "`ip -6 ro sh table all | wc -l`"
  else
    show_entry "general.routes.ipv6" "0"
  fi
  show_entry "general.connections.tcp" "`cat /proc/net/tcp /proc/net/tcp6 | wc -l`"
  show_entry "general.connections.udp" "`cat /proc/net/udp /proc/net/udp6 | wc -l`"

  # Detailed process counts by state
  local running=0
  local sleeping=0
  local blocked=0
  local zombie=0
  local stopped=0
  local paging=0
  for state in $(cat /proc/*/stat 2>/dev/null | cut -d ')' -f 2 | cut -d ' ' -f 2); do
    case "$state" in
      R) let running++ ;;
      S) let sleeping++ ;;
      D) let blocked++ ;;
      Z) let zombie++ ;;
      T) let stopped++ ;;
      W) let paging++ ;;
      *) ;;
    esac
  done

  show_entry "general.procs.running" "$running"
  show_entry "general.procs.sleeping" "$sleeping"
  show_entry "general.procs.blocked" "$blocked"
  show_entry "general.procs.zombie" "$zombie"
  show_entry "general.procs.stopped" "$stopped"
  show_entry "general.procs.paging" "$paging"
}

