#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Nebula
# Generates an identiy in case it does not exists yet
# ==============================================================================
readonly key='/etc/nebula/host.key'
readonly cert='/etc/nebula/host.crt'
readonly ca='/etc/nebula/ca.crt'
readonly config='/etc/nebula/config.yml'
declare network
#declare node
declare tmp

# Write out private key
if bashio::config.has_value 'host_key'; then
    tmp=$(bashio::config 'host_key')
    echo "${tmp}" > "${key}"
else
    bashio::exit.nok "No host key provided"
fi

# Write out host cert
if bashio::config.has_value 'host_cert'; then
    tmp=$(bashio::config 'host_cert')
    echo "${tmp}" > "${cert}"
else
    bashio::exit.nok "No host certificate provided"
fi

# Write out ca cert
if bashio::config.has_value 'ca_cert'; then
    tmp=$(bashio::config 'ca_cert')
    echo "${tmp}" > "${ca}"
else
    bashio::exit.nok "No CA certificate provided"
fi

# Write out config
if bashio::config.has_value 'nebula_config'; then
    tmp=$(bashio::config 'nebula_config')
    echo "${tmp}" > "${config}"
else
    bashio::exit.nok "No Nebula configuration provided"
fi
