#!/bin/bash
# A-005 Verification Suite for C-016
set -e

echo "Running Athena A-005 Tests..."

fails=0

# Test 1: .gitignore contains agents rules
if grep -q "agents/" .gitignore && grep -q "Antigravity/" .gitignore; then
  echo "✅ PASS: .gitignore contains agent tooling exclusions"
else
  echo "❌ FAIL: .gitignore is missing agent tooling exclusions"
  fails=$((fails + 1))
fi

# Test 2: agents/ is not tracked by git
if [ -z "$(git ls-files agents/)" ]; then
  echo "✅ PASS: agents/ is not tracked by git"
else
  echo "❌ FAIL: agents/ is still tracked by git"
  fails=$((fails + 1))
fi

# Test 3: agents/ directory exists
if [ -d "agents" ]; then
  echo "✅ PASS: agents/ directory exists on disk"
else
  echo "❌ FAIL: agents/ directory is missing"
  fails=$((fails + 1))
fi

if [ $fails -eq 0 ]; then
  echo "🎉 All A-005 tests passed."
  exit 0
else
  echo "💥 $fails test(s) failed."
  exit 1
fi
