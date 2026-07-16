# Calil Hall — Personal Site & AI Overview 0–100

A personal site and a live home for **AI Overview 0–100**, a self-updating AI literacy curriculum I built while learning AI from scratch.

Hosted on **Railway**, deployed from this repository.

---

## What this is

Two things in one place:

**The personal page** — who I am, what I'm working on, and how to reach me.

**The project page** — an embedded, rendered view of *AI Overview 0–100*: a beginner-to-practitioner guide covering prompting (the ICC method), the AI Fluency 4D framework, Claude 101, connectors, models, artifacts, projects, and Claude Code. Every section follows the same shape — Concept → Videos → Definition/Example/Notes → Exercise → Reflection — so it stays scannable as it grows.

The curriculum isn't hand-copied onto the page. It's rendered from the output of an automated pipeline, so the site reflects the current state of the document rather than a snapshot.

---

## How the content pipeline works

```
YouTube source video
        ↓
   SocialKit  ──────────────  transcript extraction
        ↓
 Google Apps Script  ───────  serverless orchestration
        ↓
 Gemini / Claude  ──────────  multi-LLM failover matrix
        ↓
 Google Doc ("Pending Review")
        ↓
   This site  ──────────────  rendered project page
```

- **SocialKit** pulls transcripts from hand-selected YouTube videos.
- **Google Apps Script** holds the functions and runs the pipeline serverlessly — no server to babysit.
- **Gemini and Claude** run behind a failover matrix, so a single model outage or refusal doesn't stall the pipeline.
- Generated summaries append to the source document under **Pending Review**. Nothing publishes without a human pass.

---

## Human review

Every AI-generated section lands in Pending Review first. I read it, verify it, revise it, and only then does it move into the published curriculum. Drafts are recommendations, not final authority.

The full **AI Diligence Statement** — which tools were used, what they contributed, and where responsibility sits — lives in the source document and is reproduced on the project page.

---

## Stack

Static HTML, CSS, and JavaScript. No framework, no build step. The site fetches rendered curriculum content from an Apps Script endpoint at load time.

```
public/          the site itself — index.html, styles, scripts
Dockerfile       tells Railway how to serve public/
```

## Running locally

No dependencies to install. You do need a local server rather than opening the file directly — `file://` blocks the fetch call.

```bash
git clone https://github.com/Calil-Hall/ai-overview-0-100.git
cd ai-overview-0-100

python3 -m http.server 8080 --directory public
```

Then open `localhost:8080`.

## Deploying

Railway builds from this repository via the Dockerfile, which serves `public/` with Caddy:

```dockerfile
FROM caddy:2-alpine
COPY public/ /srv
CMD ["sh", "-c", "caddy file-server --root /srv --listen :${PORT:-8080}"]
```

Push to the default branch to deploy. Railway detects the Dockerfile automatically — no build command needed. Generate a public domain under Settings → Networking.

### A note on keys

This is a static site: there are no environment variables at runtime, and anything the browser can read, a visitor can read. The Apps Script endpoint URL is written directly into `public/index.html`. That's fine — it points at a read-only endpoint that's safe to expose.

The Anthropic, Gemini, and SocialKit keys are **not** in this repository. They live in Apps Script's own Script Properties, where the pipeline runs server-side and nothing reaches the browser.

---

## Why I built it

I wanted out of the habit of using AI like a slightly better search bar. This document is the record of getting there — and the pipeline behind it is the proof that I learned it, because I couldn't have built any of this before I started.

It's free. Take what's useful.

— Calil Hall
