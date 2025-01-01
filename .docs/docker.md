# Docker Issues

## Issue 1

> WARNING: bridge-nf-call-iptables is disabled  
> WARNING: bridge-nf-call-ip6tables is disabled

Resolves:

```bash
sudo echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.conf
sudo echo "net.bridge.bridge-nf-call-ip6tables = 1" >> /etc/sysctl.conf
sudo modprobe br_netfilter
sudo sysctl -p /etc/sysctl.conf
```
