# 🛡️ SECURITY ADVISORY: DIRECT KESTREL EXPOSURE
**Target:** api.sandbox.bingads.microsoft.com
**Researcher:** Ray Rock (rayrock92610)
**Date:** March 20, 2026

## 🛰️ ANALYSIS
The BingAds Sandbox environment is directly exposed via the Kestrel web server, bypassing the Azure Front Door/WAF layer. This allows for direct-to-origin header manipulation and potential request smuggling.

## ⚔️ PROOF OF CONCEPT
- **Server Header:** Kestrel
- **WAF Presence:** None (Missing X-Azure-Ref)
- **Response Code:** 431 (Header Overflow Handled by Kestrel directly)

---
> *Published via London Bridge Sentinel - Ray Rock Standard*
