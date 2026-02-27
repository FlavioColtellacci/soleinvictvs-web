# SOLEINVICTVS — Project Context

This is the SOLEINVICTVS brand website project.
Operated by a fleet of intelligent agents, currently helmed by AntiGravity (Gemini 2.5). The Operator is the CEO.

---

## Status and Inheritance

This project has been inherited by **Gemini** (replacing the previous Claude-based fleet). All tasks, architecture decisions, and code ship operations are now processed within this system.

---

## GitHub

| Account | Status | Purpose |
|---------|--------|---------|
| **FlavioColtellacci** | Active — gh CLI authenticated | Live portfolio, CI/CD, public repos |

**Active repo:** `FlavioColtellacci/soleinvictvs-web` — GitHub Pages, static HTML/CSS/JS

---

## Project Structure

```
soleinvictvs_web/
├── agents/             — Agent soul files + blueprint history
│   ├── GEMINI.md       — This file (Current operating context)
│   ├── CLAUDE.md       — Legacy context (Archived)
│   ├── CINEMATIC_BUILDER.md — The Cinematic Website Builder Protocol
│   ├── ELENA.md
│   ├── COLOMBO.md
│   ├── VITALIK.md
│   ├── ATHENA.md
│   ├── OPERATOR_GUIDE.md
│   └── blueprints/     — JSON outputs from every plan cycle
├── soleinvictvs-web/   — Live website (GitHub Pages)
├── brand_assets/       — Logos, wallpapers, source files
└── apparel_design/     — Apparel logos
```

---

## Active Plans and Recent Shipments

| Milestone | Description | Status |
|-----------|-------------|--------|
| **V-01: Front Door** | Created the new, cinematic monolithic homepage via `CINEMATIC_BUILDER.md`. Removed all hyphens from textual phrasing. Updated footer social channels. | SHIPPED to localhost |

---

## Current Site State (`soleinvictvs-web/`)

| File | Status | Notes |
|------|--------|-------|
| `index.html` | Live Updates | Currently serving the new monolithic homepage on localhost. |
| `codex.html` | Live | 6 article cards — all link to `#`, individual pages pending |
| `vault.html` | Live | Free Arsenal + Digital Vault + Physical Vault (apparel) |
| `about.html` | Live | Founder placeholder — operator swaps when ready |
| `virtue-audit.html` | Live | 12-question virtue self-assessment — Athena PASS |
| `fortress-protocol.html` | Live | 30-day discipline protocol, print-ready — Athena PASS |
| `assets/css/main.css` | Live | C-006 design token set |
| `assets/js/main.js` | Live | Nav scroll, mobile menu, scroll reveal |

---

## Open Operator Blockers / Tasks

- **Substack URL** — Links to `#` in the other sub-pages (now successfully embedded in footer on homepage).
- **TheSeasons font files** — ACTIVE (Loaded as .woff2).
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
../apparel_design/logo_transparent.png       — apparel logo
```

---

## Standards

- **Stack:** Static HTML/CSS/JS · No framework · No backend · GitHub Pages
- **Commits:** Conventional Commits everywhere. No "Initial commit". No free-form messages.
- **CI/CD:** HTMLHint (block) + Lighthouse CI (warn) + GitHub Pages deploy on push to main
- **Naming:** kebab-case folders — all lowercase, hyphen-separated, 2–4 words

---

## Agent Workflow (Gemini Protocol)

1. **Operator briefs Gemini (AntiGravity)** (any format).
2. Gemini confirms instructions or requests missing information.
3. Gemini updates code directly in the relevant locations.
4. Gemini runs a local verification/check where possible.
5. Gemini hands review over to Operator.
