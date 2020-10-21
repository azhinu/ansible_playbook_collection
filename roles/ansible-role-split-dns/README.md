
Ansible Role: Split DNS with dnsmasq
---
This role will install dnsmasq, configure it to use different dns for internet and lan and set dnsmasq as system resolver.

Vars:
`dnsmasq_local_dns `- Address of local DNS server (no default).
`dnsmasq_local_zone` - Local network domain zone (no default).
`dnsmasq_local_ip` - PTR record for LAN IP pool (default 168.192.in-addr.arpa).
`dnsmasq_resolver` - List of upstream resolvers. By default using  UncensoredDNS servers.

Example:
```yaml
dnsmasq_resolver:
  - 130.225.244.166
  - 185.38.24.52
  - 89.233.43.71
```
