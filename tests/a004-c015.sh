#!/usr/bin/env bash
# tests/a004-c015.sh — Athena A-004 — C-015 cycle closure verification
# Requires: bash, python3, git
# Run from anywhere in the repo: bash tests/a004-c015.sh
PASS=0
FAIL=0
ROOT="$(git rev-parse --show-toplevel)"
BP="$ROOT/agents/blueprints/C-014.json"
EP="$ROOT/agents/blueprints/E-006.json"
pass() { printf '  PASS  %s\n' "$1"; PASS=$((PASS+1)); }
fail() { printf '  FAIL  %s -- %s\n' "$1" "$2"; FAIL=$((FAIL+1)); }
echo "=== Athena A-004 -- C-015 cycle closure ==="
echo ""
# T-001: C-014.json exists
echo "T-001  C-014.json exists at agents/blueprints/C-014.json"
if [[ -f "$BP" ]]; then pass "C-014.json present"
else fail "C-014.json missing" "agents/blueprints/C-014.json not found on disk"; fi
# T-002: valid JSON
echo "T-002  C-014.json is valid JSON"
if python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$BP" 2>/dev/null
then pass "Valid JSON"
else fail "Invalid JSON" "python3 json.load raised an exception"; fi
# T-003: identity fields
echo "T-003  C-014.json identity fields correct"
RESULT=$(python3 -c "
import json, sys
d = json.load(open(sys.argv[1]))
errs = []
if d.get('agent')        != 'colombo': errs.append('agent=' + str(d.get('agent')))
if d.get('blueprint_id') != 'C-014':  errs.append('blueprint_id=' + str(d.get('blueprint_id')))
if d.get('source_plan')  != 'E-006':  errs.append('source_plan=' + str(d.get('source_plan')))
print('OK' if not errs else ' | '.join(errs))
" "$BP" 2>&1)
if [[ "$RESULT" == "OK" ]]; then pass "agent/blueprint_id/source_plan correct"
else fail "Field mismatch" "$RESULT"; fi
# T-004: exactly 2 specs
echo "T-004  C-014.json has exactly 2 specs: C-014-A and C-014-B"
RESULT=$(python3 -c "
import json, sys
d     = json.load(open(sys.argv[1]))
specs = d.get('specs', [])
ids   = [s.get('spec_id') for s in specs]
errs  = []
if len(specs) != 2:      errs.append('expected 2 specs, got ' + str(len(specs)))
if 'C-014-A' not in ids: errs.append('C-014-A missing')
if 'C-014-B' not in ids: errs.append('C-014-B missing')
print('OK' if not errs else ' | '.join(errs))
" "$BP" 2>&1)
if [[ "$RESULT" == "OK" ]]; then pass "2 specs: C-014-A + C-014-B"
else fail "Spec check failed" "$RESULT"; fi
# T-005: pre_flight_fixes and message_to_vitalik
echo "T-005  C-014.json has pre_flight_fixes and message_to_vitalik"
RESULT=$(python3 -c "
import json, sys
d    = json.load(open(sys.argv[1]))
errs = []
if not d.get('pre_flight_fixes'):   errs.append('pre_flight_fixes absent or empty')
if not d.get('message_to_vitalik'): errs.append('message_to_vitalik absent or empty')
print('OK' if not errs else ' | '.join(errs))
" "$BP" 2>&1)
if [[ "$RESULT" == "OK" ]]; then pass "pre_flight_fixes and message_to_vitalik present"
else fail "Required fields missing" "$RESULT"; fi
# T-006: E-006.json exists
echo "T-006  E-006.json exists at agents/blueprints/E-006.json"
if [[ -f "$EP" ]]; then pass "E-006.json present"
else fail "E-006.json missing" "agents/blueprints/E-006.json not found on disk"; fi
# T-007: fix(tokens) commit
echo "T-007  fix(tokens) commit in git log"
if git -C "$ROOT" log --oneline | grep -qF "fix(tokens): harmonise index.html CSS to C-006 token standard"
then pass "fix(tokens) commit found"
else fail "fix(tokens) commit missing" "Not found in git log"; fi
# T-008: feat(nav) commit
echo "T-008  feat(nav) commit in git log"
if git -C "$ROOT" log --oneline | grep -qF "feat(nav): add mobile hamburger overlay to all pages"
then pass "feat(nav) commit found"
else fail "feat(nav) commit missing" "Not found in git log"; fi
# T-009: docs(agents) commit
echo "T-009  docs(agents) commit in git log"
if git -C "$ROOT" log --oneline | grep -qF "docs(agents): update fleet files and blueprints for E-006 cycle"
then pass "docs(agents) commit found"
else fail "docs(agents) commit missing" "Not found in git log"; fi
# T-010: ELENA.md updated
echo "T-010  ELENA.md shows E-006 COMPLETE and Next plan ID E-007"
ELENA_OK=true
grep -q "E-006.*COMPLETE" "$ROOT/agents/ELENA.md" 2>/dev/null || ELENA_OK=false
grep -q "Next plan ID.*E-007" "$ROOT/agents/ELENA.md" 2>/dev/null || ELENA_OK=false
if [[ "$ELENA_OK" == "true" ]]; then pass "ELENA.md up to date"
else fail "ELENA.md stale" "E-006 COMPLETE or Next plan ID E-007 not found"; fi
# T-011: COLOMBO.md updated
echo "T-011  COLOMBO.md shows C-014 Complete and Next blueprint ID C-015"
COL_OK=true
grep -q "C-014.*Complete" "$ROOT/agents/COLOMBO.md" 2>/dev/null || COL_OK=false
grep -q "Next blueprint ID.*C-015" "$ROOT/agents/COLOMBO.md" 2>/dev/null || COL_OK=false
if [[ "$COL_OK" == "true" ]]; then pass "COLOMBO.md up to date"
else fail "COLOMBO.md stale" "C-014 Complete or Next blueprint ID C-015 not found"; fi
# T-012: ATHENA.md A-003 row
echo "T-012  ATHENA.md contains A-003 row"
if grep -q "A-003" "$ROOT/agents/ATHENA.md"
then pass "A-003 row present"
else fail "A-003 row missing" "grep found no A-003 in ATHENA.md"; fi
# T-013: OPERATOR_GUIDE.md IDs
echo "T-013  OPERATOR_GUIDE.md shows E-007 / C-015 / A-004 as next IDs"
OP_OK=true
grep -q "E-007" "$ROOT/agents/OPERATOR_GUIDE.md" 2>/dev/null || OP_OK=false
grep -q "C-015" "$ROOT/agents/OPERATOR_GUIDE.md" 2>/dev/null || OP_OK=false
grep -q "A-004" "$ROOT/agents/OPERATOR_GUIDE.md" 2>/dev/null || OP_OK=false
if [[ "$OP_OK" == "true" ]]; then pass "OPERATOR_GUIDE.md up to date"
else fail "OPERATOR_GUIDE.md stale" "E-007, C-015, or A-004 not found"; fi
# T-014: docs(agents) commit -- no site HTML leaked
echo "T-014  docs(agents) commit contains no soleinvictvs-web HTML files"
DOCS_HASH=$(git -C "$ROOT" log --format="%H %s" | grep -F "docs(agents): update fleet files" | awk '{print $1}' | head -1)
if [[ -n "$DOCS_HASH" ]]; then
  LEAK=$(git -C "$ROOT" show --stat "$DOCS_HASH" | grep "soleinvictvs-web/.*\.html" || true)
  if [[ -z "$LEAK" ]]; then pass "docs commit scoped to agent files -- no HTML leaked"
  else fail "docs commit leaked site HTML" "$LEAK"; fi
else fail "docs(agents) commit not found" "Hash lookup returned empty"; fi
# T-015: fix(tokens) commit -- only index.html
echo "T-015  fix(tokens) commit touches only index.html"
FIX_HASH=$(git -C "$ROOT" log --format="%H %s" | grep -F "fix(tokens): harmonise" | awk '{print $1}' | head -1)
if [[ -n "$FIX_HASH" ]]; then
  FILE_COUNT=$(git -C "$ROOT" show --name-only "$FIX_HASH" | grep -cE "\.(html|css|js)$" || true)
  if [[ "$FILE_COUNT" -eq 1 ]]; then pass "fix(tokens) scoped to 1 file (index.html)"
  else fail "fix(tokens) blast radius wrong" "Expected 1 file, found $FILE_COUNT"; fi
else fail "fix(tokens) commit not found" "Hash lookup returned empty"; fi
# T-016: feat(nav) commit creates main.css and main.js
echo "T-016  feat(nav) commit creates assets/css/main.css and assets/js/main.js"
NAV_HASH=$(git -C "$ROOT" log --format="%H %s" | grep -F "feat(nav): add mobile hamburger" | awk '{print $1}' | head -1)
if [[ -n "$NAV_HASH" ]]; then
  NAV_OK=true
  git -C "$ROOT" show --stat "$NAV_HASH" | grep -q "assets/css/main.css" 2>/dev/null || NAV_OK=false
  git -C "$ROOT" show --stat "$NAV_HASH" | grep -q "assets/js/main.js" 2>/dev/null || NAV_OK=false
  if [[ "$NAV_OK" == "true" ]]; then pass "main.css and main.js created in feat(nav) commit"
  else fail "main.css or main.js missing from feat(nav)" "Not found in commit stat"; fi
else fail "feat(nav) commit not found" "Hash lookup returned empty"; fi
echo ""
echo "=== Results: $PASS passed / $FAIL failed / $((PASS+FAIL)) total ==="
if [[ $FAIL -eq 0 ]]; then
  echo "VERDICT: PASS"
  exit 0
else
  echo "VERDICT: FAIL"
  exit 1
fi
