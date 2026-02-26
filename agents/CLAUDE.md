# SOLEINVICTVS — Project Context

This is the SOLEINVICTVS brand website project.
Operated by a four-agent waterfall fleet. Operator is the CEO.

---

## GitHub

| Account | Status | Purpose |
|---------|--------|---------|
| **FlavioColtellacci** | Active — gh CLI authenticated | Live portfolio, CI/CD, public repos |

**Active repo:** `FlavioColtellacci/soleinvictvs-web` — GitHub Pages, static HTML/CSS/JS

---

## Agent Fleet

```
Elena → Colombo → Vitalik → Athena
```

| Agent | Role | Soul File |
|-------|------|-----------|
| **Elena** | Intake — translates operator requests into JSON task plans | `agents/ELENA.md` |
| **Colombo** | Architect — turns Elena's plans into Vitalik blueprints | `agents/COLOMBO.md` |
| **Vitalik** | Builder — ships code from Colombo's blueprints | `agents/VITALIK.md` |
| **Athena** | QA — verifies, tests, closes the loop | `agents/ATHENA.md` |

**Operator = CEO.** You review PRs, set priorities, approve scope changes.
Everything else runs through the fleet.

---

## Project Structure

```
soleinvictvs_web/
├── agents/             — Agent soul files + blueprint history
│   ├── CLAUDE.md       — This file
│   ├── ELENA.md
│   ├── COLOMBO.md
│   ├── VITALIK.md
│   ├── ATHENA.md
│   ├── OPERATOR_GUIDE.md
│   └── blueprints/     — JSON outputs from every plan cycle
├── soleinvictvs-web/   — Live website (GitHub Pages)
├── brand_assets/       — Logos, wallpapers, source files
├── apparel_design/     — Apparel logos
└── website_prototypes/ — Historical prototypes (reference only)
```

---

## Active Plans

| Plan | Blueprint(s) | Description | Status |
|------|-------------|-------------|--------|
| E-005 | C-009–C-013 | Full multi-page website build | MERGED to main — Athena PASS · PR #3 closed |

**Next plan: E-006** (not yet briefed)

---

## Current Site State (main — clean)

| File | Status | Notes |
|------|--------|-------|
| `soleinvictvs-web/index.html` | Live | Token debt: old names (--dim, --stone, --bronze) → fix in E-006 |
| `soleinvictvs-web/codex.html` | Live | 6 article cards — all link to `#`, individual pages pending |
| `soleinvictvs-web/vault.html` | Live | Free Arsenal + Digital Vault + Physical Vault (apparel) |
| `soleinvictvs-web/about.html` | Live | Founder placeholder — operator swaps when ready |
| `soleinvictvs-web/virtue-audit.html` | Live | 12-question virtue self-assessment — Athena PASS |
| `soleinvictvs-web/fortress-protocol.html` | Live | 30-day discipline protocol, print-ready — Athena PASS |
| `soleinvictvs-web/assets/css/main.css` | Live | C-006 design token set |
| `soleinvictvs-web/assets/js/main.js` | Live | Nav scroll, mobile menu, scroll reveal |
| `soleinvictvs-web/.github/workflows/ci.yml` | Live | HTMLHint + Lighthouse CI |

---

## E-006 Backlog (not yet briefed)

- **Token harmonisation** — index.html still uses pre-C-006 names (--dim, --stone, --bronze, --bg:#0a0806)
- **Mobile nav hamburger** — nav links hidden on mobile across all pages
- **Individual article pages** — Codex cards all link to `#`

---

## Open Operator Blockers

- **Substack URL** — all newsletter CTAs point to `#` across all pages
- **TheSeasons font files** — drop `TheSeasons-Regular.woff2` + `TheSeasons-Italic.woff2` into `soleinvictvs-web/assets/fonts/` to activate
- **Founder avatar + real bio** — about.html ships with placeholder
- **Payment solution** (Stripe / Gumroad / Lemon Squeezy) — vault paid CTAs point to newsletter waitlist

---

## Design System (C-006 tokens — use everywhere, never hardcode)

```
--bg: #0A0A0A          --surface: #111111      --surface-2: #161616
--border: #1E1E1E      --text: #F5F0E8         --text-muted: #9A9080
--gold: #C9A84C        --gold-muted: #8A6F32   --red: #8B1A1A

--font-display: 'The Seasons', 'Cormorant Garamond', serif
--font-serif:   'Cormorant Garamond', serif
--font-ui:      'Inter', sans-serif
```

---

## Asset Paths (relative to soleinvictvs-web/)

```
../brand_assets/2k_wallpaper_sun.png         — hero background
../brand_assets/sun_transparent.png          — nav + footer logo (32px / 24px)
../brand_assets/sun_logo_black.png           — founder avatar fallback
../brand_assets/twitter_header.png          — legion section background
../brand_assets/substack_wordmark/2.png      — substack logo
../apparel_design/logo_transparent.png       — apparel logo
```

---

## Standards

- **Stack:** Static HTML/CSS/JS · No framework · No backend · GitHub Pages
- **Commits:** Conventional Commits everywhere. No "Initial commit". No free-form messages.
- **CI/CD:** HTMLHint (block) + Lighthouse CI (warn) + GitHub Pages deploy on push to main
- **Naming:** kebab-case folders — all lowercase, hyphen-separated, 2–4 words

---

## Agent Workflow

1. Operator briefs **Elena** (any format — voice dump, one-liner, full spec)
2. **Elena** decorates (questions/assumptions/challenges) then outputs task plan JSON
3. **Colombo** receives JSON → produces blueprint for Vitalik
4. **Vitalik** receives blueprint → ships code → hands off to Athena
5. **Athena** verifies → passes or sends back to Vitalik
6. Operator reviews PR → merges
