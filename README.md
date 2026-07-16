# ai-overview-0-100.
🚀 Live automated AI literacy engine powering the 'AI Overview 0-100' curriculum. Features a serverless Google Apps Script pipeline extracting YouTube data via SocialKit, processed through a resilient Gemini/Claude multi-LLM failover matrix. Connected to a live public dashboard site.

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
 
## Running locally
 
```bash
git clone <repo-url>
cd <repo>
# install dependencies
# start the dev server
```
 
Copy `.env.example` to `.env` and fill in your own keys. Nothing sensitive is committed.
 
| Variable | Purpose |
| --- | --- |
| `APPS_SCRIPT_URL` | Endpoint the site pulls rendered curriculum content from |
| `ANTHROPIC_API_KEY` | Claude — primary generation |
| `GEMINI_API_KEY` | Gemini — failover generation |
| `SOCIALKIT_API_KEY` | YouTube transcript extraction |
 
## Deploying
 
Railway builds from the connected GitHub repository. Push to the default branch to deploy. Set the environment variables above in the Railway project settings before the first build.
 
---
 
## Why I built it
 
I wanted out of the habit of using AI like a slightly better search bar. This document is the record of getting there — and the pipeline behind it is the proof that I learned it, because I couldn't have built any of this before I started.
 
It's free. Take what's useful.
 
— Calil Hall
