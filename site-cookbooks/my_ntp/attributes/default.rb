default[:ntp][:service] =
  case platform_family
  when "rhel", "fedora"
    "ntpd"
  when "debian"
    "ntp"
  else
    "ntpd"
  end

