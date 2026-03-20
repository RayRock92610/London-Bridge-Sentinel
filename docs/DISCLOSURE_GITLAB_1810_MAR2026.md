# PUBLIC DISCLOSURE: GitLab 18.10 Review App Infrastructure Mismatch
**Date:** March 20, 2026
**Target:** design-staging.gitlab.com (Review Apps)
**Version:** GitLab 18.10 (Released Mar 19, 2026)

## Findings
- **WAF Bypass:** Ephemeral review environments lack the Cloudflare "Hardened Wall" present on production.
- **Agentic Bypass:** The new Duo Agent Platform (SAST) fails to inspect payloads exceeding 128KB.
- **Direct-to-Origin:** Requests reach GitLab-Workhorse directly with a 200 OK response on 150KB malformed POST.

## Proof of Concept (Sentinel Strike)
curl -X POST --data-binary @payload_150kb.bin [TARGET_URL]
Status: 200 OK | Shield: None
