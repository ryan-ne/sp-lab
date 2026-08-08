# Day Cards

The [README](../README.md) says *what* each day is. This directory says *how* — the sources in reading order, the commands, and what evidence proves the day is finished.

One file per block. A card is a session plan for **90 minutes** on a weekday and **180** on the weekend day. If a card runs long two sessions in a row, the estimate was wrong: record it in the Saturday retro as a planning error, per [`docs/schedule.md`](../docs/schedule.md).

---

## The rule that makes this directory work

**Write one block ahead. Never more.**

A lesson plan for D75 written in August is fiction. You do not yet know which vendor images your machine tolerates, which topics you already half-know, or where the last block ran over. Cards written five months early get followed out of obedience rather than judgement, which is the opposite of what this repo is for.

Write the next block's cards during the Saturday retro of the block before. Fifteen minutes. Everything you learned in the last block goes into it.

Blocks written so far are indexed below. The rest are titles in the README until their turn.

---

## Card anatomy

Every card has the same six parts. If a part is missing, the card is not finished.

| Part | Contract |
|---|---|
| **Why this day exists** | One or two sentences tying it forward to a specific later day. A day that can't point forward should be merged into one that can |
| **Objective** | The single sentence you must be able to say out loud at the end, unaided |
| **Source** | Time-boxed, in reading order, with links. Total ≤ the session length minus the hands-on time |
| **Do** | Numbered, concrete, executable. Not "explore X" |
| **Done when** | Verifiable by someone else. "Understood NSSA" is not a criterion; "wrote the four LSA types crossing the ABR, unaided" is |
| **Cards touched** | The `CP-xx` IDs from [`docs/checkpoints.md`](../docs/checkpoints.md) this day seeds or re-arms |

Reading-only days get an extra field: **Cheapest hands-on**. Ten minutes at a terminal beats sixty of reading you can't apply, and a day with no terminal time is a day you will fail to recall at D42.

---

## Index

| Block | Days | Cards |
|---|---|---|
| Linux, containers, lab foundations | B1–B7 | [`B01-B07.md`](B01-B07.md) |
| Link-state internals | B8–B15 | [`B08-B15.md`](B08-B15.md) |
| Redistribution and policy | B16–B20 | [`B16-B20.md`](B16-B20.md) |
| BGP from zero to CCNP level | B21–B35 | not written yet |
| IPv6 and Junos onboarding | B36–B40 | not written yet |
| Core plan | D1–D100 | not written yet |

---

## Generating the next block

Paste this at the retro. It carries the constraints that make the cards match the repo instead of generic study advice.

```
Write day cards for block <IDs> of my 140-day SP plan, following days/README.md exactly.

Constraints:
- 90 min weekday sessions, 180 min on the weekend day.
- Six-part card anatomy, no missing parts.
- Free sources only unless the day genuinely needs a paid one — say so if it does.
- Every "Done when" verifiable by a stranger.
- The block ends in something built, not something read.

Context from the last block:
- Ran over on: <days>
- Ran short on: <days>
- Could not explain without notes: <topics>
- Lab environment problems: <e.g. vJunos won't boot, no KVM>

Do not restate the README. Do not add days. If a day in the README is thinner than
a session, say which day it should merge into rather than padding it.
```

The last two lines matter. A model asked for a lesson plan will happily inflate a twenty-minute topic into ninety. That inflation is exactly what the fourteen merges in [`docs/schedule.md`](../docs/schedule.md) exist to undo.

---

## Verify every link before you rely on it

Links rot, vendor download portals move, and free tiers change without notice. Each card names *what* to read as well as *where*, so a dead link costs you a search rather than a session. If a source has moved, fix the card in the same commit as the day — the fix is worth more to the next reader than the tick is.
