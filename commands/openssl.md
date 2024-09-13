# Openssl Commands

### certificate

#### create public-private key pair 
```bash
openssl req -newkey rsa:2048 -nodes -keyout rp-key.key -x509 -days 365 -out rp-certificate.crt
```
