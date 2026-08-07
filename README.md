# 140 Days to ISP Backbone & Edge Engineering

> A public, self-directed curriculum for moving from enterprise routing & switching into service provider backbone and peering engineering. Built and tracked in the open.

**Starting point:** 7 years enterprise networking, CCNA-level formal depth
**Target roles:** IP Engineer · Backbone Engineer · Peering Engineer · Network Engineer (Service Provider)
**Structure:** 40-day bridge phase (`B1–B40`) + 100-day core plan (`D1–D100`)
**Daily load:** ~1.5 hrs weekdays, ~3 hrs one weekend day → roughly 5 months

---

## Progress

**Bridge phase:** 1 / 40 · **Core plan:** 0 / 100 · **Total:** 1 / 140

Update the counts as you go. Every ticked box is a commit — the history is the proof.

---

## How to use this repo

1. Tick a day's checkbox only when the **hands-on part is done**, not when the reading is done.
2. Commit after every session, even if the only change is a journal entry.
3. Days marked **REVIEW** are deliberately light — use them to catch up if you've slipped.
4. Days are *study days*, not calendar days. Miss one, shift everything right; don't skip it.
5. The rule that matters most: **every block ends in something you built, not something you read.**

### Suggested repo layout

```
.
├── README.md                 ← this file
├── 00-journal/               ← daily notes, one file per month
├── 01-igp-core/
├── 02-bgp-policy/            ← flagship artifact
├── 03-mpls-sr/
├── 04-vpn-services/
├── 05-edge-security/         ← flagship artifact
├── 06-capstone-internet/     ← flagship artifact
├── tools/                    ← IRR/RPKI filter automation
└── docs/
    ├── resources.md           ← courses, tooling, RFCs
    ├── community-scheme.md
    ├── addressing-plan.md
    ├── peering-policy.md
    └── convergence-results.md
```

Add a `.gitignore` for `*.qcow2`, `*.tar`, `clab-*/` — never commit vendor images.

---

## Resource library

**→ [docs/resources.md](docs/resources.md)**

Courses, lab tooling, vendor docs, operational intelligence, and the core RFC list with the day each one gets read.

---

# Bridge Phase — B1–B40

> CCNA → CCNP-ish depth on the four things the core plan assumes. Skip nothing here; it's the difference between the main plan working and the main plan crushing you at D22.

<details open>
<summary><b>B1–B7 · Linux, containers, lab foundations</b></summary>

- [ ] **B1** — Linux CLI + `ip` command family. `ip link/addr/route/neigh`, `ip route get`, tcpdump basics
- [ ] **B2** — Docker fundamentals: images, containers, network modes (bridge/host/none)
- [ ] **B3** — **Namespaces, veth pairs, bridges.** Build two routers by hand with kernel primitives — *the most important day in this block*
- [ ] **B4** — Install containerlab · https://containerlab.dev/install
- [ ] **B5** — First lab: FRR two-node, OSPF adjacency, then break it deliberately
- [ ] **B6** — Pull vendor images: Nokia SR Linux, Juniper vJunos-router, Cisco XRd, Arista cEOS
- [x] **B7** — Git repo init, `.gitignore`, directory structure, first journal entry

</details>

<details>
<summary><b>B8–B15 · Link-state internals</b></summary>

- [ ] **B8** — Link-state vs distance-vector. LSDB, flooding, Dijkstra by hand on a 6-node graph
- [ ] **B9** — OSPF adjacency: hello, DR/BDR election, neighbour states
- [ ] **B10** — OSPF LSA types 1–5 and 7 — what each carries, who floods it
- [ ] **B11** — Multi-area OSPF, ABR/ASBR, stub/totally-stubby/NSSA
- [ ] **B12** — SPF timers, LSA throttling, incremental SPF, reference bandwidth
- [ ] **B13** — **Lab:** multi-area OSPF, 6 nodes, verify LSDB per area, partition area 0 on purpose
- [ ] **B14** — OSPFv3 and dual-stack · Day One: Routing the IP, ch. 4–5
- [ ] **B15** — **REVIEW.** Explain LSDB synchronisation from memory

</details>

<details>
<summary><b>B16–B20 · Redistribution and policy</b></summary>

- [ ] **B16** — Administrative distance / route preference, selection between protocols
- [ ] **B17** — Route-maps and prefix-lists: match/set, sequence, permit/deny semantics
- [ ] **B18** — Redistribution: metric translation, seed metrics, loops, tagging to prevent them
- [ ] **B19** — **Lab:** OSPF ↔ BGP mutual redistribution at two points. Create a loop, then fix it with tags
- [ ] **B20** — Same policy in Junos `policy-statement` · https://www.juniper.net/documentation/

</details>

<details>
<summary><b>B21–B35 · BGP from zero to CCNP level</b></summary>

- [ ] **B21** — What BGP is for: AS, path vector, inter- vs intra-domain
- [ ] **B22** — Session mechanics: TCP 179, FSM, capabilities, message types · RFC 4271
- [ ] **B23** — **Lab:** first eBGP session, advertise a loopback, watch the UPDATE in tcpdump
- [ ] **B24** — eBGP vs iBGP: the split-horizon rule and why full mesh is required
- [ ] **B25** — **Lab:** iBGP inside an AS, next-hop-self, IGP for reachability
- [ ] **B26** — `network` statement vs redistribution vs aggregation — why `network` is SP-safe
- [ ] **B27** — AS-path, origin, next-hop. Prepending and loop prevention
- [ ] **B28** — Local-preference and MED — which direction each influences
- [ ] **B29** — **Path selection algorithm.** Write it from memory, in order, three times
- [ ] **B30** — **Lab:** manipulate the winning path four different ways
- [ ] **B31** — Communities: standard (1997), extended (4360), large (8092)
- [ ] **B32** — Filtering: prefix-lists, AS-path ACLs, route-maps in/out · RFC 8212
- [ ] **B33** — Aggregation: `aggregate-address`, atomic-aggregate, suppress-maps
- [ ] **B34** — Multihoming basics: two upstreams, load-sharing, why it's harder than it looks
- [ ] **B35** — **REVIEW + Lab:** 3-AS topology with full basic policy. Prerequisite for D22

</details>

<details>
<summary><b>B36–B40 · IPv6 and Junos onboarding</b></summary>

- [ ] **B36** — IPv6 beyond CCNA: address types, ICMPv6, NDP, SLAAC vs DHCPv6
- [ ] **B37** — Provider IPv6 addressing design: /32, /48, /56, /64, /127 links
- [ ] **B38** — **Lab:** dual-stack the B35 topology, IPv6 BGP address family
- [ ] **B39** — Junos onboarding: candidate config, `commit confirmed`, rollback, `show | compare`, config groups
- [ ] **B40** — **BRIDGE CAPSTONE:** rebuild B35 on vJunos in containerlab, dual-stacked, from scratch, no notes

</details>

---

# Core Plan — D1–D100

<details>
<summary><b>Block 1 · D1–D7 · The service provider mindset</b></summary>

- [ ] **D1** — Tiers 1/2/3, transit vs peering, the default-free zone. Draw the money flow
- [ ] **D2** — 95th percentile billing (work the maths), commits, bursts, cost per Mbps, ratio disputes
- [ ] **D3** — ISP anatomy: access → aggregation → PE → P → peering edge. Mark where policy applies
- [ ] **D4** — Platforms: MX vs PTX, ASR9K vs NCS, Nokia 7750. Roles and FIB scale limits
- [ ] **D5** — RIRs, ASN/prefix allocation, IRR objects (`aut-num`, `route`, `as-set`), LOAs
- [ ] **D6** — Recon on PeeringDB, bgp.tools, RIPEstat, RIPE Atlas. Profile a real regional ISP
- [ ] **D7** — **Read RFC 7454 end to end.** Write up the ISP profile → **Artifact A1**

</details>

<details>
<summary><b>Block 2 · D8–D21 · IS-IS, IPv6, routing policy</b></summary>

- [ ] **D8** — IS-IS NET/NSAP addressing, area ID, system ID, NSEL
- [ ] **D9** — L1/L2, hellos, LSP flooding, CSNP/PSNP. What IS-IS doesn't need that OSPF does
- [ ] **D10** — TLV extensibility. Wide metrics · RFC 5305
- [ ] **D11** — **Lab:** 6-node L2-only IS-IS core. Verify the LSDB by hand
- [ ] **D12** — **Lab:** authentication, wide metrics, overload bit on startup
- [ ] **D13** — **Lab: break it.** Mismatched levels, MTU, duplicate system IDs, auth failure
- [ ] **D14** — **REVIEW.** Write the IS-IS vs OSPF argument
- [ ] **D15** — SPF and LSP generation timers, exponential backoff, stability under flap
- [ ] **D16** — LFA and remote LFA · RFC 5286. Note where coverage is incomplete
- [ ] **D17** — **Lab: BFD** · RFC 5880. Measure real failover, tune, re-measure, record numbers
- [ ] **D18** — IPv6 addressing plan for your lab AS, fully justified in writing
- [ ] **D19** — **Lab:** multi-topology vs single-topology IS-IS for v6; dual-stack the core
- [ ] **D20** — Junos routing policy: terms, from/then, chaining, route filters
- [ ] **D21** — Same policy in IOS-XR RPL → **Artifact A2** (core + convergence measurements)

</details>

<details>
<summary><b>Block 3 · D22–D42 · BGP at carrier depth</b></summary>

- [ ] **D22** — BGP the SP way: AFI/SAFI as the extension mechanism for everything later
- [ ] **D23** — Path selection, memorised, with tie-breakers
- [ ] **D24** — Attributes: transitive vs non-transitive, and who controls what
- [ ] **D25** — **Lab:** three ASes, eBGP, no policy. Observe raw AS-path selection
- [ ] **D26** — **Lab:** iBGP full mesh, next-hop-self, IGP underneath
- [ ] **D27** — **Lab:** break next-hop resolution, fix it three ways, compare trade-offs
- [ ] **D28** — **REVIEW.** Path selection drill
- [ ] **D29** — Route reflectors: cluster ID, originator ID, path hiding, redundancy
- [ ] **D30** — **Lab:** redundant RRs, then add-path · RFC 7911. Compare visibility
- [ ] **D31** — ORR and confederations. Why most operators chose RRs
- [ ] **D32** — **Community scheme pt.1:** informational tags — customer/peer/transit/IXP, geo, PoP
- [ ] **D33** — **Community scheme pt.2:** action communities — local-pref override, prepend-on-demand, regional no-advertise, blackhole · RFC 7999
- [ ] **D34** — **Lab:** tag every route on ingress; verify propagation and boundary stripping
- [ ] **D35** — Outbound TE: local-pref hierarchy (customer 200 > peer 150 > transit 100)
- [ ] **D36** — Inbound TE: prepending, MED, more-specifics. Write down why it's weak
- [ ] **D37** — Filtering: bogons, max-prefix with warnings, AS-path filters · RFC 8212
- [ ] **D38** — Session security: MD5 vs TCP-AO, GTSM, graceful restart vs GR-helper
- [ ] **D39** — BGP PIC edge and core, next-hop tracking
- [ ] **D40** — RIB vs FIB, FIB compression, TCAM limits. Flap damping → then read RIPE-580
- [ ] **D41** — **Lab:** full ingress policy framework across all three ASes
- [ ] **D42** — **Lab:** egress policy — prove you never transit between peers → **Artifact A3** ⭐ + **Blog post 1**

</details>

<details>
<summary><b>Block 4 · D43–D60 · MPLS and Segment Routing</b></summary>

- [ ] **D43** — Label stack, TC bits, S-bit, TTL, FEC, PHP. Trace a 4-hop LSP on paper
- [ ] **D44** — LDP: discovery, distribution modes, LDP-IGP sync
- [ ] **D45** — **Lab:** LDP over the IS-IS core, inspect the LFIB
- [ ] **D46** — RSVP-TE: PATH/RESV, ERO, soft state, refresh reduction
- [ ] **D47** — CSPF, TE metric vs IGP metric, admin groups. Compute a constrained path by hand
- [ ] **D48** — RSVP FRR: link vs node protection, bypass vs detour. The 50 ms claim examined
- [ ] **D49** — **Why SR** · RFC 8402. Write in your own words exactly what state disappears
- [ ] **D50** — SRGB, prefix-SID, node-SID, adjacency-SID, anycast-SID. Build a label stack by hand
- [ ] **D51** — SR control plane via IS-IS extensions. **Lab:** SR alongside LDP
- [ ] **D52** — **Lab: migrate off LDP** → **Artifact A4** (migration runbook)
- [ ] **D53** — TI-LFA: P-space, Q-space, post-convergence path, microloop avoidance
- [ ] **D54** — **Lab:** TI-LFA, fail a link under traffic, decode the repair label stack
- [ ] **D55** — Convergence ordering. Watch one NANOG SR deployment talk
- [ ] **D56** — SR-TE policies: candidate paths, preference, binding SID
- [ ] **D57** — **Lab:** colour community → SR-TE policy → steer traffic off shortest path
- [ ] **D58** — PCEP, stateful vs stateless PCE, SR-PCE
- [ ] **D59** — SRv6: locator/function, uSID, END/END.X · RFC 8986. Learn both sides of the argument
- [ ] **D60** — SP QoS: DiffServ, TC marking, uniform vs pipe vs short-pipe. **REVIEW**

</details>

<details>
<summary><b>Block 5 · D61–D75 · VPN services</b></summary>

- [ ] **D61** — L3VPN architecture · RFC 4364. RD makes prefixes unique; RT controls import/export
- [ ] **D62** — VPNv4/VPNv6 SAFIs, VPN label, three-label stack. Trace a customer packet
- [ ] **D63** — VRF mechanics: import/export policy, per-VRF route limits
- [ ] **D64** — **Lab:** two VRFs across the SR core, static PE-CE first
- [ ] **D65** — **Lab:** PE-CE eBGP. AS-override, allowas-in, Site-of-Origin — which loop each prevents
- [ ] **D66** — **Lab:** both customers on 10.0.0.0/8. Prove RD separates them, then leak on purpose
- [ ] **D67** — Hub-and-spoke, extranet, shared services, inter-VRF leaking
- [ ] **D68** — Internet access from a VRF: full table, default leak, or central breakout
- [ ] **D69** — Inter-AS options A and B. Note next-hop rewrite in B
- [ ] **D70** — Inter-AS option C with BGP-LU, plus Carrier Supporting Carrier
- [ ] **D71** — EVPN fundamentals · RFC 7432. Route types 1–5. Why it displaced VPLS
- [ ] **D72** — EVPN multihoming: ESI, DF election, split-horizon, all-active vs single-active
- [ ] **D73** — MAC mobility, ARP/ND suppression, EVPN-IRB symmetric vs asymmetric
- [ ] **D74** — **Lab:** EVPN-VPWS between two PEs; inspect route type 1
- [ ] **D75** — **Lab:** EVPN multipoint. Three services on one core → **Artifact A5**. **REVIEW**

</details>

<details>
<summary><b>Block 6 · D76–D90 · The edge</b></summary>

- [ ] **D76** — IXP mechanics, route servers · RFC 7947. Peering LAN hygiene
- [ ] **D77** — Peering strategy, ratios, port sizing. Write a peering policy + mock PeeringDB record
- [ ] **D78** — IRR object hierarchy, multiple databases, trust levels, staleness
- [ ] **D79** — **bgpq4:** generate filters from three real AS-SETs, compare sizes
- [ ] **D80** — **Lab:** apply IRR filters to a peering session; announce outside it, confirm the drop
- [ ] **D81** — RPKI: ROAs, max-length, TALs, RTR · RFCs 6480, 6811. Read the MANRS actions
- [ ] **D82** — **Lab:** run Routinator or rpki-client, connect a router over RTR, inspect the VRP table
- [ ] **D83** — **Lab:** enforce ROV, drop invalids, announce an invalid prefix, confirm rejection
- [ ] **D84** — Route leaks: BGP roles and OTC · RFC 9234. ASPA, peer-lock. Read a real leak post-mortem
- [ ] **D85** — Hijack response playbook: detect → verify → contact → mitigate → document
- [ ] **D86** — **Lab: RTBH** · RFC 7999. Customer-triggered /32 blackhole, propagated upstream
- [ ] **D87** — **Flowspec** · RFC 8955. Lab a rate-limit rule. Scrubbing integration and the GRE return path
- [ ] **D88** — On-net CDN caches: Netflix OCA, Google GGC, Akamai, Meta MNA. Effect on bill and ratios
- [ ] **D89** — Flow visibility: NetFlow/IPFIX/sFlow, sampling, collectors. Build a traffic-ratio report
- [ ] **D90** — **DELIVERABLE: filter automation pipeline** → **Artifact A6** ⭐ + **Blog post 2**

</details>

<details>
<summary><b>Block 7 · D91–D100 · Capstone and going to market</b></summary>

- [ ] **D91** — Design the mini-Internet on paper: 5 ASes, IXP, content network. ASN/IP plan, diagram
- [ ] **D92** — Build all five ASes: IS-IS + SR + TI-LFA in each backbone
- [ ] **D93** — Full BGP policy everywhere. Community scheme, route server, no-transit proven
- [ ] **D94** — Add an L3VPN customer. RPKI ROV + IRR filters at every edge
- [ ] **D95** — Failure testing: RTBH end to end, link failures, kill an RR, leak a prefix → **Artifact A7** ⭐
- [ ] **D96** — Automation: push the lab from source with Nornir/NAPALM. NetBox as source of truth
- [ ] **D97** — **Batfish:** assert "we never announce a transit route to a peer", prove a bad commit fails
- [ ] **D98** — **Publish:** blog post or repo README with diagram and design decisions → **Blog post 3**
- [ ] **D99** — CV in SP language. Update profiles. Link the repo
- [ ] **D100** — Self-test on all checkpoint questions. Apply to five roles the same day

</details>

---

## Portfolio artifacts

| ID | Artifact | Lands |
|---|---|---|
| A1 | ISP landscape analysis | D7 |
| A2 | IGP core + convergence measurements | D21 |
| **A3** | **BGP policy framework + community scheme** ⭐ | D42 |
| A4 | LDP → SR migration runbook | D52 |
| A5 | Multi-service PE (L3VPN + EVPN + transit) | D75 |
| **A6** | **IRR + RPKI filter automation pipeline** ⭐ | D90 |
| **A7** | **Mini-Internet capstone** ⭐ | D95 |

**If everything slips, protect A3, A6 and A7.** Those three, well documented, are enough.

---

## Checkpoint questions

Answer out loud, from memory, on review days. If you can't, the block isn't finished.

1. Why IS-IS over OSPF in a backbone? What does the overload bit do?
2. BGP path selection, in order, with tie-breakers.
3. Why is inbound traffic engineering fundamentally weaker than outbound?
4. How do you guarantee you never become transit between two peers?
5. What state does SR eliminate versus LDP + RSVP-TE?
6. How does TI-LFA guarantee a loop-free repair path?
7. RD versus RT?
8. Compare Inter-AS options A, B and C.
9. How does RPKI ROV differ from IRR filtering, and why do you need both?
10. A customer calls mid-DDoS. Walk through your response.

---

## Threaded throughout

- **One NANOG or RIPE talk per week** — free archives, where operational reality is discussed
- **Lurk** on the NANOG list, RIPE Routing WG, and your local NOG. Then answer something
- **15 minutes daily on the Junos CLI** — MX/PTX dominate SP, and Junos teaches policy thinking
- **After D100:** JNCIA-Junos → JNCIS-SP → JNCIP-SP · https://learningportal.juniper.net/

---

## A note on scope

This repo tracks lab work only. Nothing here originates from any employer's network — no configs, no topologies, no addressing, sanitised or otherwise. Every topology is built from scratch in containerlab using publicly available images.
