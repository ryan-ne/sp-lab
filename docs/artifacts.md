# Artifact Done-Criteria

Undefined scope on a flagship is how D42 eats D50. Each artifact below is done when **every box ticks** — not when it feels finished, not when the lab came up once.

A criterion is written so that someone else could verify it without asking you. "Documented the policy" is not a criterion. "`docs/community-scheme.md` lists every community with its action and the routers that set it" is.

**If everything slips, protect A3, A6, A7.** The rest can be thin.

---

## A1 · ISP landscape analysis — D7

- [ ] `01-igp-core/` not touched yet; this one is pure writing — put it in `docs/` or `00-journal/`
- [ ] One named regional ISP profiled: ASN, PeeringDB record, IXP presences, upstreams, customer-cone size from bgp.tools
- [ ] Their transit mix identified — who they buy from, and at least one guess at why, defended
- [ ] Money flow diagram: which of their relationships are paid, settlement-free, or revenue
- [ ] RFC 7454 read end to end, with five specific things from it you did not already do
- [ ] Written in a form a stranger could read — no private shorthand

**Not done if:** it is a list of facts with no argument. The artifact is the reasoning about *why their topology looks like that*.

---

## A2 · IGP core + convergence measurements — D21

- [ ] `01-igp-core/` contains the containerlab topology file, committed, and it comes up from `clab deploy` with no manual steps
- [ ] 6-node IS-IS L2-only core, dual-stacked, wide metrics, authentication on
- [ ] `docs/addressing-plan.md` filled in for this topology — every prefix justified, no TBD left in the IPv6 hierarchy section
- [ ] `docs/convergence-results.md` has real numbers in the IS-IS baseline table: min/median/max over ≥5 runs, method stated
- [ ] At least three rows differ only by a timer setting, so the effect of tuning is visible
- [ ] BFD measured at two intervals, and you can say whether you measured detection or convergence
- [ ] The same policy written twice — Junos `policy-statement` and IOS-XR RPL — both committed

**Not done if:** the convergence table has adjectives instead of milliseconds.

---

## A3 · BGP policy framework + community scheme ⭐ — D42

The flagship. This is what gets read in an interview.

- [ ] `02-bgp-policy/` holds a 3-AS containerlab topology that deploys clean from a single command
- [ ] `docs/community-scheme.md` complete — no TBD, no placeholder ASN left unresolved
- [ ] Every eBGP-learned route tagged on ingress: customer / peer / transit / IXP, plus region and PoP
- [ ] Action communities implemented, not just documented: local-pref override, prepend ×1/×2/×3, regional no-advertise, blackhole
- [ ] Local-pref hierarchy enforced — customer 200, peer 150, transit 100 — and visible in `show route`
- [ ] **The no-transit proof.** A peer route is announced to you; captured output shows it is *not* announced to your other peer. Both the config and the evidence committed
- [ ] Communities stripped at every egress boundary, with output proving a `65001:*` value does not leave the AS
- [ ] Ingress filters: bogons, max-prefix with a warning threshold below the teardown limit, AS-path filters
- [ ] RFC 8212 behaviour confirmed — no policy, no announcement
- [ ] A README in `02-bgp-policy/` explaining the design decisions, with the topology diagram
- [ ] **Blog post 1** published, linked from the repo

**Not done if:** the no-transit property is asserted rather than demonstrated. That single piece of evidence is most of the artifact's value.

---

## A4 · LDP → SR migration runbook — D52

- [ ] `03-mpls-sr/` topology, deploys clean
- [ ] LDP running over the IS-IS core first, LFIB inspected and captured
- [ ] SR enabled alongside LDP, both present, preference behaviour understood and recorded
- [ ] LDP removed with no traffic loss — measured, not assumed
- [ ] Runbook written as steps someone else could follow: pre-checks, each step, verification per step, rollback per step
- [ ] Rollback tested at least once, from a real mid-migration state
- [ ] The label stack before and after, decoded, side by side

**Not done if:** the runbook has no rollback, or the rollback was never run.

---

## A5 · Multi-service PE — D75

- [ ] `04-vpn-services/` topology, deploys clean, running over the SR core from A4
- [ ] Three services live simultaneously on one core: L3VPN, EVPN, and plain internet transit
- [ ] Two L3VPN customers both using 10.0.0.0/8, proven separate — `show route` from both VRFs in the evidence
- [ ] Deliberate leak between them performed and then reverted, with the import/export change that caused it
- [ ] PE-CE eBGP with AS-override demonstrated, and the loop it prevents explained in writing
- [ ] EVPN route type 1 captured and decoded
- [ ] The three-label stack on a VPN packet captured, each label identified

**Not done if:** the three services were built and torn down one at a time. The artifact is that they coexist.

---

## A6 · IRR + RPKI filter automation pipeline ⭐ — D90

- [ ] `tools/` contains a script that runs end to end from one command
- [ ] Input: an AS-SET. Output: a committed prefix filter for at least two vendors
- [ ] Uses `bgpq4`; handles the case where the AS-SET is huge, and the case where it is empty
- [ ] Routinator or rpki-client running, router attached over RTR, VRP table inspected
- [ ] ROV enforced — an invalid announcement is generated and its rejection captured
- [ ] The pipeline is idempotent: running twice changes nothing
- [ ] A stale-filter check — define how old is too old, and what the pipeline does when the IRR data exceeds it
- [ ] Failure mode documented: what the pipeline does when the IRR is unreachable. It must not fail open
- [ ] `docs/peering-policy.md` complete, no TBD
- [ ] **Blog post 2** published, linked from the repo

**Not done if:** it fails open. A filter generator that produces an empty filter on error is worse than no automation.

---

## A7 · Mini-Internet capstone ⭐ — D95

- [ ] `06-capstone-internet/` deploys all five ASes plus IXP from one command
- [ ] Each backbone: IS-IS + SR + TI-LFA
- [ ] Full BGP policy everywhere, using the A3 community scheme unchanged
- [ ] IXP route server, and the no-transit invariant holding across all five ASes
- [ ] At least one L3VPN customer
- [ ] RPKI ROV and IRR filters at every edge, from the A6 pipeline
- [ ] **Failure testing, all five, with evidence:** RTBH end to end · link failure under traffic with loss measured · an RR killed · a prefix leaked and caught by the filters · an RPKI-invalid announced and dropped
- [ ] Topology diagram, ASN and addressing plan, in `docs/`
- [ ] Design decisions written up — what you chose, what you rejected, why
- [ ] **Blog post 3** / repo README published

**Not done if:** it came up once and was never broken. The failure testing *is* the artifact — anyone can build a topology that works.

---

## Scope discipline

Three rules that keep an artifact from eating the days after it:

1. **Time-box the flagships to their day plus one.** A3 gets D42 and one overflow session. If it is not done, ship what exists, note the gap in the journal, and move on. An artifact at 80% on time beats 100% three weeks late — the next block depends on the day, not the polish.
2. **Evidence goes in as you go.** Capture the output the moment it works. Recreating a capture later costs a whole session.
3. **A TBD left in a doc means the artifact is not done.** Grep for it before ticking.

```bash
grep -rn "TBD" docs/
```
