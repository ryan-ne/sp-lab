# Market Entry

> The plan teaches. This file is about getting hired, which is a separate skill on a separate clock.

The README puts every piece of market contact at D99–D100: update the CV, apply to five roles. That is the single largest structural risk in the plan, and it is not a study risk.

---

## 1. The problem with applying at D100

**D100 is 31 December.** Nobody is hiring in the last week of December. Requisitions are frozen, hiring managers are on leave, and applications submitted that week get read in the second week of January by someone with three hundred others in the queue.

**Interview feedback is a study signal, and the plan discards it.** An interview at D50 tells you what to study at D60. An interview at D100 tells you what you should have studied. Five months of work with no external correction is five months of assuming your own assessment of your gaps is accurate — and the whole design of [`docs/checkpoints.md`](checkpoints.md) is an admission that it is not.

**SP hiring is slow.** Backbone and peering roles are rare, the pipeline runs long, and the interview loop is often four or five stages. An application in January is an offer in March at the earliest. Starting the clock at D100 adds two months to a plan already at zero slack.

**The repo is credible long before D100.** A3 lands at D42 — a working three-AS BGP policy framework with a documented community scheme and a demonstrated no-transit proof. That is already more than most applicants for a junior SP role have ever built. The remaining 58 days deepen it; they do not create it.

---

## 2. The overlay

Six touchpoints. None costs a study session — they are 30–60 minute jobs for a Sunday, which [`schedule.md`](schedule.md) already holds as buffer.

| When | Target date | Do |
|---|---|---|
| **D6** | Sat 19 Sep | Recon already in the plan. Extend it: pull **20 real job ads** for IP / backbone / peering engineer across your target markets. Tally the technologies. That tally picks the certification track — and tells you whether the plan's Junos bias matches the market you are actually applying to |
| **D7** | Tue 22 Sep | Publish A1. First public artifact. Link it from your profiles |
| **D20** | Tue 6 Oct | Rewrite the CV **now**, not at D99, in SP language: convergence measured in milliseconds, policy written in two vendor syntaxes, evidence linked. It will be thin. That is the point — you will see exactly which sections the next 80 days need to fill |
| **D42** | Thu 29 Oct | A3 ships with blog post 1. **This is the week you start talking to people.** Post the artifact where operators read. Apply to three roles — not to get them, but to see the loop |
| **D60** | Tue 17 Nov | First real interview feedback should exist by now. Fold it into the block 5–7 plan. If nobody replied, the CV or the targeting is wrong, and finding that out in November is worth more than three study days |
| **D90** | Sat 19 Dec | A6 ships. Apply properly and broadly, into the January hiring window rather than the December dead zone |

Dates derived from [`schedule.md`](schedule.md) assuming no slippage. **Nothing above is a study day** — the plan's 125 sessions are untouched.

---

## 3. You are in the APNIC region — use it

The repo's resource list already leans APNIC, which is right. The region carries some specific advantages worth planning around rather than stumbling into.

### Community

| What | Why it matters | Where |
|---|---|---|
| **APNIC 62 — Mumbai, 4–10 Sep 2026** | Workshops and partner meetings 4–7 Sep, conference 8–10 Sep. Falls inside your bridge phase, about four weeks out. Remote participation is normally free — check, and attend the routing sessions even if only online | https://conference.apnic.net/62/ |
| **APRICOT 2027 / APNIC 63 — Hong Kong, 24 Feb – 4 Mar 2027** | MasterClasses 24–26 Feb at HKPC Kowloon; summit 1–4 Mar at the Hopewell, Wan Chai. Hosted by HKNOG and HKIX. Includes the **APRICOT Peering Forum** — the highest-density room of peering engineers in the region, eight weeks after this plan ends | https://2027.apricot.net/ |
| **ThaiNOG / BKNIX Peering Forum** | Thailand's operator community, typically meeting in May. Archives and the mailing list are useful now regardless of the next event date — **check the site for current dates, not this table** | https://www.thainog.or.th/ · https://bknix.co.th/ |
| **APRICOT 2028 — Bangkok** | Domestic, so cheap for you. Worth knowing it is coming | https://www.apricot.net/ |

*APNIC 62 and APRICOT 2027 dates verified against APNIC/APRICOT sites, 2026-08-07. ThaiNOG deliberately left undated — verify before planning around it.*

**APRICOT 2027 is the highest-leverage thing in this table.** It sits eight weeks past D100, in the region, and it is where the people who run the networks you want to work for physically are. Two things to check for it, and check them by **D42 at the latest** because both have deadlines that close months ahead:

- **The APNIC fellowship programme** funds regional attendance. Applications close well before the conference — find the date and put it in the schedule.
- **The call for papers.** A lightning talk on the A6 filter pipeline is exactly the kind of submission APRICOT takes from a first-time speaker, and "spoke at APRICOT" outranks any certification on a CV for a peering role.

### Targeting

D6 profiles a regional ISP. Make at least half your sample **domestic and regional** — the operators whose ASNs you can look up on PeeringDB and bgp.tools, whose peering at BKNIX and the Singapore and Hong Kong exchanges you can see, and whose engineers appear in ThaiNOG programmes. Those are networks you can talk about specifically in an interview because you have read their actual routing policy.

Also profile at least three **remote-hiring** operators outside the region. SP engineering does more remote hiring than enterprise networking, and a portfolio repo is a far stronger signal to a remote employer who cannot check your references over coffee.

### The certification decision at D6

`docs/resources.md` correctly defers this. One region-specific input for that decision: **MikroTik is heavily deployed across South-East Asian regional ISPs and WISPs**, and MTCINE is genuinely BGP/MPLS/TE-focused and cheap. If your D6 job-ad tally comes back full of MikroTik, that is real market information, not a downgrade — and it is a much shorter path to a first SP role than JNCIP-SP.

Let the twenty job ads decide. Not reputation, and not this file.

---

## 4. What to say when you have no SP experience

You will be asked. The honest answer is stronger than the evasive one, and you will have the evidence to back it:

> Seven years enterprise routing and switching. For the last five months I have been building a service provider network in the open — IS-IS and segment routing core, full BGP policy with a community scheme, RPKI and IRR filtering at the edge, five ASes and an IXP. It is on GitHub with the convergence measurements and the failure testing. I have not run a production backbone. I have built and broken every part of one.

The last sentence is the one that works, and it only works if the failure testing in A7 actually happened. `docs/artifacts.md` already says the failure testing *is* the artifact. That is the reason.

---

## 5. Open decision

**The merges are unsigned.** [`schedule.md`](schedule.md) marks all fourteen "PROPOSED, not yet applied", and the arithmetic on that page only reaches zero slack *after* they are applied. Session 1 starts 8 Aug. Sign them off, or the plan begins against a schedule that provably does not fit.
