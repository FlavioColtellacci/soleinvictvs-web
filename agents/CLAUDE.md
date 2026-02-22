# Code Base — Project Collection

This directory contains a collection of independent projects and utilities.
Each folder is its own universe. Nothing here is coupled to anything else.

---

## GitHub

| Account | Status | Purpose |
|---------|--------|---------|
| **FlavioColtellacci** | Active — gh CLI authenticated | Live portfolio, CI/CD, public repos |
| **Catalitium** | Available — inactive | Historical / reference only |

**Control plane:** `FlavioColtellacci/repo-bootstrap` — scripts, CI templates, publishing pipeline.
Local copy: `code-base/repo-bootstrap/`
> ⚠️ `repo-bootstrap` does not exist on GitHub yet. Must be created before any CI injection or bulk publish work.

---

## Agent Fleet

This codebase is operated by a four-agent waterfall. Each agent has a soul file in memory.

```
Elena → Colombo → Vitalik → Athena
```

| Agent | Role | Soul File |
|-------|------|-----------|
| **Elena** | Intake — translates operator requests into JSON task plans | `ELENA.md` |
| **Colombo** | Architect — turns Elena's plans into Vitalik blueprints | `COLOMBO.md` |
| **Vitalik** | Builder — ships code from Colombo's blueprints | `VITALIK.md` (not yet created) |
| **Athena** | QA — verifies, tests, closes the loop | (human-in-the-loop) |

**Operator = CEO.** You review PRs, set priorities, approve scope changes.
Everything else runs through the fleet.

---

## Naming Convention

All project folders use **kebab-case**: `noun-topic` or `noun-action`
— all lowercase, hyphen-separated, 2–4 words, singular where natural.
No `tool-` or `util-` prefixes. No camelCase. No underscores.

---

## Structure

Each subdirectory is a standalone, independent project.
`wip-` prefix = spec complete, code not yet written.

---

### Active Plans

| Plan | Agent | Project | Status |
|------|-------|---------|--------|
| E-002 | Elena | `soleinvictvs-web` | In progress — 6 prototypes built, selection pending |

---

### In Progress

- `soleinvictvs-web/` — SOLEINVICTVS brand website (HTML/JS, GitHub Pages)
  - Stack: static HTML/CSS/JS · No framework · No backend
  - Scope: Home, About, Codex, Vault, Newsletter · Digital products · Waitlist CTA
  - Payments: deferred · Physical merch/membership: out of scope for E-002
  - **Prototype selection pending** — operator chooses from `prototypes/` before build starts
  - Operator blockers: prototype pick, ConvertKit setup, founder copy, future payment solution TBD

- `prototypes/` — Design prototypes for `soleinvictvs-web` (not a deployable project)
  - `proto-1-monolith.html` — Centered, austere, large Cinzel, gold rules
  - `proto-2-aurora.html` — Animated CSS sun rays, clip-path sections, Cormorant
  - `proto-3-editorial.html` — Sticky sidebar, drop caps, virtues grid
  - `proto-4-imperium.html` — CSS Roman arch frame, SPQR nav, Pompeii red, Latin subtitles ⭐
  - `proto-5-divinus.html` — Canvas-animated Sol Invictus, imperial purple, medal cards ⭐
  - `proto-6-codex.html` — CSS Roman column sidebar, proclamation listing, four virtues ⭐
  - ⭐ = Round 2 elevated (more Roman, better UI)

---

### Live Projects (35)

#### Python Tools
- `ascii-art/` — ASCII art generator
- `auto-prompter/` — Auto prompt chaining tool
- `cache-cleaner/` — Cache cleaning utility (Python + PowerShell)
- `conway-game/` — Conway's Game of Life
- `maze-master/` — Maze generation and solving
- `qr-generator/` — QR code generator
- `secure-vault/` — Encrypted secure vault
- `seo-intel/` — SEO intelligence tool (Flask)
- `text-summarizer/` — Text summarization utility
- `typing-test/` — Typing speed test

#### PowerShell / System Tools
- `cpu-benchmark/` — CPU benchmarking tool
- `system-health/` — System health monitor and benchmark

#### Web / HTML Tools
- `aspect-ratio/` — Image/video dimension calculator
- `base64/` — Base64 encoder/decoder
- `binary-converter/` — Binary, decimal, hex, octal converter
- `bmi-calculator/` — BMI calculator with health range visualization
- `contract-generator/` — Contract document generator
- `countdown-timer/` — Live countdown to any target date/time
- `cron-builder/` — Visual cron expression builder
- `css-minifier/` — CSS minifier and beautifier
- `euro-castles/` — European castles interactive guide
- `hash-generator/` — MD5/SHA1/SHA256 hash generator
- `hex-palette/` — Hex color mood palette (PWA)
- `invoice-generator/` — Invoice creation and export
- `json-formatter/` — JSON formatter, minifier, validator
- `lorem-generator/` — Placeholder text generator
- `morse-translator/` — Morse code translator with audio
- `pixel-art-editor/` — Pixel art drawing tool
- `reading-estimator/` — Reading time, word count, readability stats
- `regex-tester/` — Live regex tester with match highlighting
- `social-card/` — Social media card designer
- `timezone-converter/` — World timezone converter with visual clock
- `tip-calculator/` — Bill splitter and tip calculator
- `word-counter/` — Real-time word/character/sentence counter
- `password-generator/` — Secure password generator (crypto.getRandomValues)

---

### Planned Projects (wip- prefix — spec complete, no code yet)

#### Simple Utilities
- `wip-color-scheme/` — Color palette generator
- `wip-dice-roller/` — Virtual dice roller for tabletop gaming
- `wip-gradient-generator/` — Visual CSS gradient creator
- `wip-markdown-preview/` — Live markdown editor with preview
- ~~`wip-password-generator/`~~ — **SHIPPED** → `password-generator/` (C-004-09)
- `wip-pomodoro-timer/` — Productivity timer (25/5 min cycles)
- `wip-unit-converter/` — Multi-category unit conversion

#### Developer & AI Tools
- `wip-case-converter/` — camelCase ↔ snake_case ↔ kebab-case ↔ PascalCase
- `wip-context-packer/` — Compress long text for LLM context windows
- `wip-data-converter/` — CSV ↔ JSON ↔ YAML bidirectional converter
- `wip-token-counter/` — Token count + API cost estimator
- `wip-url-parser/` — URL decomposer (scheme, host, path, params, fragment)

#### Games
- `wip-simon-says/` — Audio + color memory sequences
- `wip-snake-game/` — Classic Snake on HTML canvas

#### Three.js / WebGL Animations
- `wip-audio-visualizer/` — Mic-driven 3D frequency bars
- `wip-dna-helix/` — Rotating double helix with base pair labels
- `wip-fluid-sim/` — 2D Navier-Stokes fluid simulation
- `wip-fractal-tree/` — Generative 3D trees from L-System grammar
- `wip-gravity-sim/` — N-body gravitational simulation
- `wip-lorenz-attractor/` — Real-time 3D strange attractor
- `wip-matrix-rain/` — Matrix digital rain in 3D
- `wip-particle-galaxy/` — 50k+ particle spiral galaxy
- `wip-solar-system/` — 8 planets with real orbital period ratios
- `wip-terrain-generator/` — Perlin noise heightmap with flythrough camera

#### Serious Math Tools
- `wip-complex-plane/` — Argand plane, roots of unity, Julia sets
- `wip-fourier-visualizer/` — Draw a wave → FFT decomposition + epicycle animation
- `wip-graphing-calculator/` — Multi-function plotter with zoom/pan and root finder
- `wip-laplace-visualizer/` — Pole-zero plot, step response, Bode plot
- `wip-linear-solver/` — Gaussian elimination with geometric visualization
- `wip-matrix-calculator/` — NxN matrix operations with step-by-step solutions

#### Million-Dollar SaaS (Requirements Complete)
- `wip-api-builder/` — Visual API creation platform
- `wip-compliance-auto/` — GDPR/CCPA automation
- `wip-email-warmup/` — Email deliverability and sender reputation
- `wip-niche-job-board/` — Vertical-specific job marketplace
- `wip-screenshot-docs/` — AI-powered docs from screenshots
- `wip-waitlist-platform/` — Complete product launch toolkit

---

## Guidelines

### Working with Projects
- Each project is independent and self-contained
- Check for project-specific deps: `package.json`, `requirements.txt`, etc.
- No root-level git repo — individual projects may have their own
- `repo-bootstrap/` is the control plane — not a project, never publish it as one

### CI/CD Standards (per stack)
- **HTML:** HTMLHint (block) + Lighthouse CI (warn) + GitHub Pages deploy on push to main
- **Python:** ruff lint (block) + pytest if `tests/` exists (skip otherwise)
- **PowerShell:** PSScriptAnalyzer — Error=block, Warning=warn, runs on windows-latest

### Commit Standard
Conventional Commits everywhere. No "Initial commit". No free-form messages.

### Agent Workflow
1. Operator briefs **Elena** (any format — voice dump, one-liner, full spec)
2. **Elena** decorates (questions/assumptions/challenges) then outputs task plan JSON
3. **Colombo** receives JSON → produces blueprint for Vitalik
4. **Vitalik** receives blueprint → ships code → hands off to Athena
5. **Athena** verifies → passes or sends back to Vitalik
6. Operator reviews PR → merges
