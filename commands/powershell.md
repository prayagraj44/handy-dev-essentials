# powershell

### 

#### generate self-signed certificate with subject
```shell
New-SelfSignedCertificate `
    -KeyExportPolicy Exportable `
    -Subject "CN=yourappname.yourtenant.onmicrosoft.com" `
    -KeyAlgorithm RSA `
    -KeyLength 2048 `
    -KeyUsage DigitalSignature `
    -NotAfter (Get-Date).AddMonths(24) `
    -CertStoreLocation "Cert:\CurrentUser\My"
```
