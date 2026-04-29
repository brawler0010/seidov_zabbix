#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./collect_snmp.sh <host> <community> <output_file>
#
# Example:
#   ./collect_snmp.sh 192.168.1.10 public ../snmp_dumps/alt.txt

HOST="${1:-}"
COMMUNITY="${2:-public}"
OUTPUT="${3:-snmp_dump.txt}"

if [[ -z "$HOST" ]]; then
  echo "Usage: $0 <host> <community> <output_file>"
  exit 1
fi

{
  echo "### SNMP system tree: 1.3.6.1.2.1.1"
  snmpwalk -v2c -c "$COMMUNITY" "$HOST" 1.3.6.1.2.1.1 || true

  echo
  echo "### IF-MIB interfaces tree: 1.3.6.1.2.1.2"
  snmpwalk -v2c -c "$COMMUNITY" "$HOST" 1.3.6.1.2.1.2 || true

  echo
  echo "### HOST-RESOURCES-MIB tree: 1.3.6.1.2.1.25"
  snmpwalk -v2c -c "$COMMUNITY" "$HOST" 1.3.6.1.2.1.25 || true

  echo
  echo "### Enterprise tree: 1.3.6.1.4.1"
  snmpwalk -v2c -c "$COMMUNITY" "$HOST" 1.3.6.1.4.1 || true
} > "$OUTPUT"

echo "SNMP dump saved to $OUTPUT"
