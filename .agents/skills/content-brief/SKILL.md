# /content-brief

Start a new content or SEO brief. Fills `Templates/content-brief.md` through a short interactive interview.

## Usage

- `/content-brief` — start a new content brief from scratch
- `/content-brief [topic]` — start a brief for a specific topic or keyword
- `/content-brief review [file]` — review an existing content brief before writing starts

## Steps (new brief)

1. Read `CLAUDE.md` — get the user's content and SEO context. Do not re-ask role, channels, KPIs, approval chain, or review gates already captured there.
2. Follow the `CLAUDE.md` Lark wiki search protocol for the topic before drafting. Use confirmed wiki sources when relevant; if the search returns no useful hit or the MCP is unavailable, state that plainly and do not fabricate links.
3. Read `Knowledge/Segments/` — check for audience profiles relevant to this piece
4. Read `Knowledge/Source/` — check for any competitor snapshots relevant to this topic

5. Ask in one batch:
   - "What's the topic or working title?"
   - "Content type? (Blog post / Landing page / Case study / Email newsletter / Social / Other)"
   - "Who is the primary reader? (Job title / persona / lifecycle stage)"
   - "Where are they in the funnel? (Awareness / Consideration / Decision)"

6. Ask in a second batch:
   - "Is this an SEO piece? If yes, what's the primary keyword? (Include search volume if you have it)"
   - "What should the reader do after reading? (CTA goal)"
   - "Target publish date?"
   - "Approximate length? (Short 500w / Standard 1,000–1,500w / Long 2,000w+)"

7. If SEO piece — ask:
   - "Which competitor URLs are ranking for this keyword that we need to beat?"
   - "Any internal data, stats, or subject matter experts we should reference?"

8. Draft the brief using `Templates/content-brief.md`
9. Suggest an H1 and 4–5 section headings based on the search intent and audience
10. Output the draft inline
11. Route to `/brief-review` before publish — remind the user this is required for all external content

## Steps (review existing brief)

1. Read the specified file
2. Check completeness:
   - Is the primary reader specific enough?
   - Is the search intent identified (for SEO pieces)?
   - Is there a primary keyword with search volume?
   - Is there exactly one CTA with a URL?
   - Are evidence requirements listed (stats, sources, SME quotes)?
3. Output:

```
## Content brief review — [FILE]

**Ready to write ✅ / Not ready ❌**

Issues:
- [Issue — e.g., "No primary keyword specified for SEO piece"]
- [Issue — e.g., "CTA URL missing"]
- [Issue — e.g., "Target reader too broad — narrow to specific persona"]
```

## After the piece is written

Before publishing, run `/brief-review [file]` on the final draft. This checks:
- Does the copy deliver on the brief's stated objective?
- Is the CTA clear and in the right position?
- Does the tone match the intended audience?
