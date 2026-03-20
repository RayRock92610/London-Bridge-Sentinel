# 🛡️ SECURITY ADVISORY: WAF BYPASS & BACKEND DoS
**Target:** api-paybylink.globalpayments.com
**Platform:** Azure App Service / IIS 10.0
**Audit Date:** March 20, 2026

## 🛰️ TECHNICAL SUMMARY
A "Leaky Pipe" vulnerability where the WAF fails to inspect POST payloads > 8KB. 
Malformed traffic causes a 500 Internal Server Error at the backend.

---
> *Reported via London Bridge Sentinel (Ray Rock Standard)*
