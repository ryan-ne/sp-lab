# Schedule

Target finish: **31 December 2026**. Written 7 Aug 2026.

Run [`tools/today.ps1`](../tools/today.ps1) for live position — this file is the plan, that script is the truth.

---

## The deficit, worked out

| | |
|---|---|
| Today | Fri 7 Aug 2026 |
| Deadline | Thu 31 Dec 2026 |
| Calendar days remaining, inclusive | **147** |
| Study pattern | 1.5 h × 5 weekdays + 3 h × 1 weekend day = **6 sessions/week** |
| Rest day | Sunday (see below — it is not really rest) |
| Sessions available, 8 Aug → 31 Dec | 146 days − 21 Sundays = **125** |
| Plan length | **140** days |
| Completed | 1 (B7) |
| Sessions needed at full length | **139** |
| **Deficit** | **14** |

147 days is exactly 21 weeks. At 6/week that is 126 sessions from today, 125 from tomorrow. The plan needs 139. **Fourteen days must come out.**

Seven sessions a week would technically close it — 21 × 7 = 147 — but that is a five-month run with no sick day, no work crunch, no bad week. It fails on the first one.

## After the merges

| | |
|---|---|
| Plan length after 14 merges | **126** |
| Less B7 (done) | **125 sessions needed** |
| Sessions available | **125** |
| **Slack** | **0** |

**Zero.** Not "some". The merges make the deadline *reachable*, not *comfortable*. One missed session without making it up moves the finish into January.

### Where the slack actually comes from

Sunday is banked, not scheduled. **21 Sundays** between here and the deadline, unallocated. Miss a Tuesday, take that Sunday. Don't miss anything, don't work them.

That is the buffer. It only works if Sunday stays empty by default — the moment Sunday becomes a normal session, the buffer is gone and you are back to needing a perfect run.

---

## The 14 merges — APPLIED 2026-08-08

> Signed off and applied to the README day list. Plan length is now **126**; `.github/workflows/check.yml` asserts that number, so changing it again is a deliberate edit in two places.
>
> **Day IDs were not renumbered.** A merged day reads `**D69 + D70**`. Renumbering would have broken every cross-reference in `days/`, `checkpoints.md` and `artifacts.md` — and `D42` *is* the name of A3.

Rules applied: only reading days merge; a hands-on lab is never absorbed into a reading day; artifact days A1–A7 are untouched; REVIEW days survive.

| # | Merge | Rationale |
|---|---|---|
| 1 | B14 → B15 | OSPFv3/dual-stack reading folds into the REVIEW day |
| 2 | B21 → B22 | "What BGP is for" is a page at 7 years in; B22 is the real content |
| 3 | B26 → B27 | `network` vs redistribute is origination — belongs with origin/AS-path |
| 4 | B33 → B34 | Aggregation is the mechanism multihoming depends on |
| 5 | B36 → B37 | IPv6 address types feed directly into the provider plan |
| 6 | D2 → D1 | Both are the money model — tiers, transit, 95th percentile |
| 7 | D3 → D4 | Network roles and the platforms that fill them are one topic |
| 8 | D8 → D9 | NET/NSAP decode is twenty minutes |
| 9 | D31 → D29 | ORR and confederations are the "why not this" footnote to RRs |
| 10 | D39 → D40 | PIC and RIB/FIB are both forwarding-plane behaviour |
| 11 | D58 → D56 | PCEP is how SR-TE policies get programmed |
| 12 | D59 → D60 | SRv6 folds into the block REVIEW |
| 13 | D69 → D70 | Inter-AS A/B/C is one topic cut arbitrarily in half |
| 14 | D88 → D89 | On-net caches and traffic ratios are the same conversation |

**Considered and rejected:** D24 → D23. Path selection is the single most-asked question in SP interviews; D23 stays a dedicated drill day.

**Protected throughout:** D42 (A3), D90 (A6), D95 (A7) — the three the README says to save if everything else slips.

---

## Milestones

Assumes no slippage from 8 Aug, Sundays banked. Dates move right on every missed session — that is expected and fine; the point is the shape, not the precision.

| Session | Date | Milestone |
|---|---|---|
| 1 | Sat 8 Aug | B1 — Linux, `ip`, tcpdump |
| 6 | Fri 14 Aug | B6 — vendor images pulled |
| 12 | Fri 21 Aug | B13 — multi-area OSPF lab |
| 13 | Sat 22 Aug | B15 — REVIEW (+ B14) |
| 18 | Fri 28 Aug | B20 — Junos policy-statement |
| 25 | Sat 5 Sep | B29 — path selection drill · **CP-02 first attempt** |
| 30 | Fri 11 Sep | B35 — 3-AS topology (D22 prerequisite) |
| 34 | Wed 16 Sep | **B40 — bridge capstone** |
| 35 | Thu 17 Sep | D1 — core plan starts |
| 39 | Tue 22 Sep | **D7 → A1** |
| 52 | Wed 7 Oct | **D21 → A2** |
| 71 | Thu 29 Oct | **D42 → A3** ⭐ + blog 1 |
| 87 | Tue 17 Nov | D60 — REVIEW · **Christmas decision point** |
| 101 | Thu 3 Dec | **D75 → A5** |
| 115 | Sat 19 Dec | **D90 → A6** ⭐ + blog 2 |
| 120 | Fri 25 Dec | **D95 → A7** ⭐ |
| 125 | Thu 31 Dec | D100 — self-test, apply to five roles |

Derived from the post-merge day sequence, not estimated. To regenerate after any further merge, run the derivation in `tools/today.ps1` against the updated day list.

### The Christmas problem

**A7 lands on Christmas Day.** A6 on Sat 19 Dec, A7 on Fri 25 Dec, D100 on 31 Dec — the capstone and one flagship sit inside the week a full-length session is least likely, and the capstone lands on the one day it is least likely of all.

Options, decide by **D60 (Tue 17 Nov)** — not in December:

1. **Bank Sundays hard from now.** Every Sunday worked before 1 Dec buys a day of December slack.
2. **Merge four more reading days** in Blocks 5–6 (candidates: D67→D68, D72→D73, D84→D85, D43→D44) to pull everything ~4 days left.
3. **Accept a January finish for D96–D100.** A7 is the portfolio piece; the CV and applications can run into the first week of January without costing anything real.

Option 3 is the honest one if the run has been rough. A7 finished well on 5 Jan beats A7 rushed on Christmas Day.

---

## Weekly retro — 15 minutes, Saturday

Cheap, and the only thing that stops a two-day slip becoming a two-week one.

1. `.\tools\today.ps1` — read the slack number out loud.
2. **Look ahead one week and put its largest build on the Saturday.** Blocks end in something built, so labs cluster at block boundaries while the 180-minute slot falls wherever the calendar puts it. Left alone they collide — it happened three blocks running in the bridge phase. Reading days have no dependencies and swap freely; move them, not the lab. Log the swap below.
3. **What slipped, and why?** Illness, work, or the day was genuinely bigger than a session? The third one is a planning error — record it, the estimate was wrong.
4. **Checkpoint cards** — anything reset twice? That day was ticked too early. Redo the lab.
5. **Re-plan.** If slack is negative, fix it this week: bank a Sunday, or merge a reading day and record it below.
6. Commit the retro to the month's journal file.

### Merge log

Merges taken beyond the 14 above. Every row is a decision made deliberately instead of by drift.

| Date | Merge | Why |
|---|---|---|
| | | |
