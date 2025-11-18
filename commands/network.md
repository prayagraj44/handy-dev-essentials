
#### Check all listening (inbound) ports
```bash
sudo netstat -tulpn
```
#### Which Process Opened Which Port
```bash
sudo lsof -i -P -n
```
---
## Nmap

#### Discover devices on a network (Ping Scan)

```bash
nmap -sn 192.168.1.0/24
```

#### Quick scan (most common ports)

```bash
nmap -F 192.168.1.10
```

#### SYN Stealth Scan (most used)

```bash
sudo nmap -sS 192.168.1.10
```

#### Service Version Detection

```bash
sudo nmap -sV 192.168.1.10
```

#### OS Detection

```bash
sudo nmap -O 192.168.1.10
```

#### OS + Version + Script Scan (Aggressive)

```bash
sudo nmap -A 192.168.1.10
```

#### Scan specific port

```bash
nmap -p 80 192.168.1.10
```

#### Scan multiple ports

```bash
nmap -p 22,80,443 192.168.1.10
```

#### Scan a port range

```bash
nmap -p 1-1000 192.168.1.10
```

#### Scan ALL 65535 port

```bash
nmap -p- 192.168.1.10
```

#### Fastest full port scan

```bash
nmap -T4 -p- 192.168.1.10
```

#### UDP Scan

```bash
sudo nmap -sU 192.168.1.10
```

#### Script scan (NSE scripts)

```bash
sudo nmap -sC 192.168.1.10
```

---
###

* **/24** → Means subnet mask 255.255.255.0 (256 IPs). Used for home networks.
* **Listening ports** → Show which apps are waiting for inbound connections.

---

### Nmap Flags

### **1. `-sn` — Ping Scan**

Skips port scanning, only checks which hosts are alive.

### **2. `-F` — Fast Scan**

Scans top 100 most common ports instead of all 1000.

### **3. `-sS` — SYN Stealth Scan**

Sends only SYN packets → fast, stealthy, avoids full TCP handshake.

### **4. `-sV` — Service Version Detection**

Tries to identify app version running on each open port.

### **5. `-O` — OS Detection**

Fingerprints TCP/IP packet behavior to guess OS.

### **6. `-A` — Aggressive Mode**

Runs OS detection, version detection, traceroute, default scripts.

### **7. `-p` — Port Selection**

Specifies which port(s) you want to scan.

### **8. `-p-` — Scan All Ports**

Scans ports 1 to 65535.

### **9. `-T4` — Timing Template**

Higher speed (aggressive) without losing reliability.

### **10. `-sU` — UDP Scan**

Used because UDP doesn’t respond like TCP. Slower but needed for DNS, DHCP, etc.


---
