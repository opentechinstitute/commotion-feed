BEGIN {
  bssid=""
  frequency=""
  signal=""
  ssid=""
  mode=""
  encryption=""
  privacy=0
  net_idx=0
}

{
  if ($1 == "BSS") {
    i = match($0, /[[:xdigit:]]{2}:[[:xdigit:]]{2}:[[:xdigit:]]{2}:[[:xdigit:]]{2}:[[:xdigit:]]{2}:[[:xdigit:]]{2}/)
    if (i != 0) {
      if (bssid != "") {
        if (encryption == "") {
          if (privacy == 1) { encryption = "wep" } else { encryption = "none" }
        }
        printf("wireless.scan.net%d.bssid: %s\n", net_idx, bssid)
        printf("wireless.scan.net%d.ssid: %s\n", net_idx, ssid)
        printf("wireless.scan.net%d.frequency: %s\n", net_idx, frequency)
        printf("wireless.scan.net%d.signal: %s\n", net_idx, signal)
        printf("wireless.scan.net%d.mode: %s\n", net_idx, mode)
        printf("wireless.scan.net%d.encryption: %s\n", net_idx, encryption)
        net_idx++
      }
      bssid=substr($0, i, 17)
      encryption=""
      privacy=0
    }
  } else if (bssid != "") {
    if ($1 == "freq:") {
      frequency=$2
    } else if ($1 == "signal:") {
      signal=$2
    } else if ($1 == "SSID:") {
      ssid=$2
    } else if ($1 == "capability:") {
      if ($0 ~ /IBSS/) {
        mode="ibss"
      } else {
        mode="ap"
      }
      if ($0 ~ /Privacy/) {
        privacy=1
      }
    } else if ($1 == "WPA:") {
      encryption=sprintf("wpa1 %s", encryption)
    } else if ($1 == "RSN:") {
      encryption=sprintf("wpa2 %s", encryption)
    }
  }
}

END {
  if (bssid != "") {
    if (encryption == "") {
      if (privacy == 1) { encryption = "wep" } else { encryption = "none" }
    }

    printf("wireless.scan.net%d.bssid: %s\n", net_idx, bssid)
    printf("wireless.scan.net%d.ssid: %s\n", net_idx, ssid)
    printf("wireless.scan.net%d.frequency: %s\n", net_idx, frequency)
    printf("wireless.scan.net%d.signal: %s\n", net_idx, signal)
    printf("wireless.scan.net%d.mode: %s\n", net_idx, mode)
    printf("wireless.scan.net%d.encryption: %s\n", net_idx, encryption)
  }
}
