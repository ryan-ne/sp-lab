# Checkpoints

The plan teaches forward and never looks back. By D42 you will have forgotten B10; by D75, B29. This file is the only thing in the repo that fights that.

**Rule:** a question is answered *only* if you said it out loud, from memory, with no notes and no tab open. Anything else is `n`.

## Spaced repetition

| Result | Next due |
|---|---|
| `y` — clean, from memory | advance one step: **+1d → +7d → +30d → +90d** |
| `n` — hesitated, needed notes, or got it wrong | **reset to +1d** |

A card that reaches +90d and passes is retired. A card reset twice in a row means the underlying day was ticked too early — go back and redo the lab, don't just re-read.

Run [`tools/today.ps1`](../tools/today.ps1) at the start of each session; it prints the cards due.

---

## Question bank

### Seeded from the README — the ten that matter most

| ID | Question | First due |
|---|---|---|
| CP-01 | Why IS-IS over OSPF in a backbone? What does the overload bit do? | D14 |
| CP-02 | BGP path selection, in order, with tie-breakers. | B29 |
| CP-03 | Why is inbound traffic engineering fundamentally weaker than outbound? | D36 |
| CP-04 | How do you guarantee you never become transit between two peers? | D42 |
| CP-05 | What state does SR eliminate versus LDP + RSVP-TE? | D49 |
| CP-06 | How does TI-LFA guarantee a loop-free repair path? | D53 |
| CP-07 | RD versus RT? | D61 |
| CP-08 | Compare Inter-AS options A, B and C. | D70 |
| CP-09 | How does RPKI ROV differ from IRR filtering, and why do you need both? | D81 |
| CP-10 | A customer calls mid-DDoS. Walk through your response. | D85 |

CP-02 is the highest-frequency real interview question in this field. It is seeded at B29 and never retires — re-ask it every 30 days regardless of streak.

### B1–B7 · Linux, containers, lab foundations

| ID | Question |
|---|---|
| CP-11 | What does `ip route get 8.8.8.8` tell you that `ip route show` does not? |
| CP-12 | Two namespaces joined by a veth pair — what makes them route rather than switch? |
| CP-13 | Docker bridge vs host vs none: which breaks a containerlab topology, and why? |

### B8–B15 · Link-state internals

| ID | Question |
|---|---|
| CP-14 | Walk OSPF adjacency from Down to Full. What is exchanged at each state? |
| CP-15 | Which LSA types cross an ABR, which cross an ASBR, which never leave their area? |
| CP-16 | Totally-stubby vs NSSA: what is blocked, what is injected, why does NSSA exist? |
| CP-17 | Why change reference bandwidth, and what breaks if you change it on one router only? |
| CP-18 | Given a 6-node weighted graph, produce the shortest-path tree root-first. |

### B16–B20 · Redistribution and policy

| ID | Question |
|---|---|
| CP-19 | Route-maps end in an implicit deny — where does that bite differently in redistribution than in BGP filtering? |
| CP-20 | How does a route tag prevent a redistribution loop? Why is administrative distance alone not enough? |
| CP-21 | Seed metrics: what happens when you redistribute into OSPF with no metric set, and into BGP? |

### B21–B35 · BGP to CCNP level

| ID | Question |
|---|---|
| CP-22 | Why is iBGP full mesh required? State the loop-prevention gap precisely. |
| CP-23 | `network` statement vs redistribution vs aggregation — why is `network` the SP-safe choice? |
| CP-24 | Local-pref and MED: which direction does each influence, and which one can a neighbour ignore? |
| CP-25 | RFC 8212 changed default eBGP behaviour. What was the old behaviour and what did it cause? |
| CP-26 | Standard vs extended vs large communities — what forces you to large? |
| CP-27 | Two upstreams, want inbound load-sharing. List every lever and rank them by how well they actually work. |

### B36–B40 · IPv6 and Junos

| ID | Question |
|---|---|
| CP-28 | Why /127 on point-to-point links rather than /64 or /126? |
| CP-29 | SLAAC vs DHCPv6 — what does each fail to give you? |
| CP-30 | What does `commit confirmed` solve that `rollback` does not? |

### Block 1 · D1–D7 · SP mindset

| ID | Question |
|---|---|
| CP-31 | Draw the money flow between tier 1/2/3, transit and peering. Who pays whom, and who pays nobody? |
| CP-32 | Given a month of 5-minute samples, compute the 95th percentile bill. Why 95th and not mean or max? |
| CP-33 | Across access → aggregation → PE → P → peering edge, where does policy apply and where must it not? |

### Block 2 · D8–D21 · IS-IS and policy

| ID | Question |
|---|---|
| CP-34 | Decompose `49.0001.1921.6800.1001.00` into area ID, system ID and NSEL. |
| CP-35 | What does IS-IS not need that OSPF does? Name the consequence for MTU and for address families. |
| CP-36 | What breaks with narrow metrics at backbone scale? |
| CP-37 | Where does LFA coverage fail, and what exactly does remote LFA add? |
| CP-38 | Your BFD number: did you measure detection, or convergence? How do you know? |

### Block 3 · D22–D42 · BGP at carrier depth

| ID | Question |
|---|---|
| CP-39 | Name four AFI/SAFI pairs and what each carries. |
| CP-40 | Route reflector path hiding: what does add-path fix, and what does it cost? |
| CP-41 | Justify customer 200 > peer 150 > transit 100 in revenue terms, not habit. |
| CP-42 | Where must your communities be stripped, and what leaks if you forget one boundary? |
| CP-43 | Which attributes are transitive, which are not, and who controls each across an eBGP hop? |

### Block 4 · D43–D60 · MPLS and SR

| ID | Question |
|---|---|
| CP-44 | Trace a 4-hop LSP. Name the label operation at every hop, including PHP. |
| CP-45 | Define P-space, Q-space, and the post-convergence path. |
| CP-46 | Why must the SRGB be globally consistent? What goes wrong if it is not? |
| CP-47 | Uniform vs pipe vs short-pipe: what happens to the customer's DSCP in each? |
| CP-48 | RSVP FRR promises 50 ms. What does that number actually cover, and what does it exclude? |

### Block 5 · D61–D75 · VPN services

| ID | Question |
|---|---|
| CP-49 | Name every label in a VPN packet's stack and say who imposes each. |
| CP-50 | AS-override, allowas-in, Site-of-Origin — which loop does each prevent? |
| CP-51 | Why did EVPN displace VPLS? Name the specific VPLS limitations. |
| CP-52 | Symmetric vs asymmetric IRB — what changes in the data plane? |
| CP-53 | Two customers both on 10.0.0.0/8. Explain precisely why they don't collide. |

### Block 6 · D76–D90 · The edge

| ID | Question |
|---|---|
| CP-54 | ROA max-length set too loose — what attack does that enable? |
| CP-55 | RFC 9234 OTC stops a leak class that ROV cannot. Which, and why can't ROV see it? |
| CP-56 | RTBH drops the victim's traffic. Justify that to the customer. |
| CP-57 | Flowspec vs RTBH — when do you reach for which? |
| CP-58 | An IRR filter and a ROA disagree about a prefix. What do you do? |

### Block 7 · D91–D100 · Capstone

| ID | Question |
|---|---|
| CP-59 | State the no-transit invariant precisely enough to be a Batfish assertion. |
| CP-60 | Your RR pair is gone. What is the failure domain, and what still forwards? |

---

## Answer log

Append one row per attempt. Never edit a past row — the streak history is the diagnostic.

`Recall`: `y` = said it out loud, from memory, no notes. Anything else is `n`.
`Gap`: what you actually could not produce. "Forgot MED tie-break position" is useful; "shaky" is not.

| ID | Asked | Recall | Gap | Next due |
|---|---|---|---|---|
| CP-02 | 2026-08-07 | n | Seeded, not yet attempted. Baseline row. | 2026-08-08 |

<!-- today.ps1 parses this table. Keep the five columns and the ISO dates. -->
