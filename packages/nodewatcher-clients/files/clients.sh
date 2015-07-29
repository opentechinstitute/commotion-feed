#
# nodewatcher module
# CLIENT STATUS MODULE
#

# Module metadata
MODULE_ID="core.clients"
MODULE_SERIAL=1

#
# Report output function
#
report()
{
  # DHCP client leases
  LEASES=$(cat /tmp/dhcp.leases | awk '{ print $3 }')
  client_id=0
  for lease in $LEASES; do
    show_entry "dhcp.client${client_id}.ip" $lease
    let client_id++
  done

  # Firewall problems
  show_entry_from_file "iptables.redirection_problem" /tmp/iptables_redirection_problem "0"

  # Connectivity loss counter
  show_entry_from_file "net.losses" /tmp/loss_counter "0"
}

