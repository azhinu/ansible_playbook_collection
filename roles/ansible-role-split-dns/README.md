
Ansible Role: Split DNS with dnsmasq
---
This role will install dnsmasq, configure it to use different dns for internet and lan and set dnsmasq as system resolver.

Vars:

`dnsmasq_local_dns `- List of local resolvers address (no default).

`dnsmasq_local_zone` - List of local network domain zones (no default).

`dnsmasq_local_ip` - List of PTR record for LAN IP pool (default 168.192.in-addr.arpa).

`dnsmasq_resolver` - List of upstream resolvers. By default using  UncensoredDNS servers.

Example of lists:
```yaml
dnsmasq_resolver:
  - 130.225.244.166
  - 185.38.24.52
  - 89.233.43.71
```
