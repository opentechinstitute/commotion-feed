#
# nodewatcher module
# REPORTING OF CRYPTO KEY FINGERPRINTS
#

# Module metadata
MODULE_ID="core.keys"
MODULE_SERIAL=1

# SSH key file location
SSH_KEY_DSS="/etc/dropbear/dropbear_dss_host_key"
SSH_KEY_RSA="/etc/dropbear/dropbear_rsa_host_key"

#
# Report output function
#
report()
{
  show_entry "keys.ssh.dss" "`dropbearkey -y -f ${SSH_KEY_DSS} | grep -Eo 'Fingerprint: .+' | cut -d ' ' -f 2-`"
  show_entry "keys.ssh.rsa" "`dropbearkey -y -f ${SSH_KEY_RSA} | grep -Eo 'Fingerprint: .+' | cut -d ' ' -f 2-`"
}

