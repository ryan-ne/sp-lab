# Resource Library

Everything referenced by the [140-day plan](../README.md). Free unless marked otherwise.

- [Free structured courses](#free-structured-courses)
- [Labs and tooling](#labs-and-tooling)
- [Vendor docs and free books](#vendor-docs-and-free-books)
- [Vendor training and certification](#vendor-training-and-certification)
- [Operational intelligence](#operational-intelligence)
- [Core RFCs](#core-rfcs)

---

## Free structured courses

| Resource | Link |
|---|---|
| **APNIC Academy** (free, self-paced, certificates) | https://academy.apnic.net/en/online-courses |
| APNIC — Routing Fundamentals (OSPF, IS-IS, BGP with configs) | https://academy.apnic.net/en/course/routing-fundamentals-course |
| APNIC — Introduction to BGP | https://academy.apnic.net/en/course/introduction-to-bgp |
| APNIC — IPv6 Fundamentals | https://academy.apnic.net/en/course/ipv6-fundamentals/ |
| **RIPE NCC Academy** (free, with certification exams) | https://academy.ripe.net/ |
| RIPE — BGP Security (maps directly onto Block 6) | https://academy.ripe.net/enrol/index.php?id=15 |

---

## Labs and tooling

| Resource | Link |
|---|---|
| containerlab | https://containerlab.dev/ · install: https://containerlab.dev/install |
| containerlab repo & supported NOS list | https://github.com/srl-labs/containerlab |
| Nokia SR Linux learning | https://learn.srlinux.dev/ |
| bgpq4 (IRR filter generation) | https://github.com/bgp/bgpq4 |
| Routinator (RPKI validator) | https://github.com/NLnetLabs/routinator |
| rpki-client | https://www.rpki-client.org/ |
| NetBox | https://netbox.dev/ |
| Batfish | https://www.batfish.org/ |
| Nornir · NAPALM | https://nornir.readthedocs.io/ · https://napalm.readthedocs.io/ |

---

## Vendor docs and free books

| Resource | Link |
|---|---|
| Juniper Day One library (free PDFs) | https://www.juniper.net/us/en/training/jnbooks/day-one/ |
| Day One: Routing the Internet Protocol | https://www.juniper.net/documentation/en_US/day-one-books/DO_Routing_the_IP.pdf |
| Day One: Migrating to Segment Routing | https://www.juniper.net/documentation/en_US/day-one-books/DO_MigrateSR.pdf |
| Juniper TechLibrary | https://www.juniper.net/documentation/ |
| Segment Routing portal | https://www.segment-routing.net/ |
| Juniper Learning Portal (JNCIA/JNCIS free training) | https://learningportal.juniper.net/ |

---

## Vendor training and certification

### Worth the time

| Resource | Link | Why |
|---|---|---|
| **Cisco Live on-demand** | https://www.ciscolive.com/on-demand.html | Free, no ticket. `BRKSPG` / `BRKMPL` sessions are deep dives on SR, TI-LFA, EVPN, BGP scale from the people who built it. Rotate into the weekly talk alongside NANOG and RIPE |
| Cisco Learning Network | https://learningnetwork.cisco.com/ | Free forums and study material; active SPCOR (350-501) community |
| Cisco DevNet | https://developer.cisco.com/ | Free automation and API tracks, pyATS — feeds D96–D97 |
| Cisco U. | https://u.cisco.com/ | Free tier carries some SP paths; most CCNP SP content sits behind the paywall |
| Juniper Learning Portal | https://learningportal.juniper.net/ | Free JNCIA/JNCIS training — the primary track for this plan |
| MikroTik training | https://mikrotik.com/training | **MTCINE** is genuinely BGP/MPLS/TE focused and cheap. Real relevance for WISP and regional-ISP roles |
| Nokia Service Routing Certification | https://www.nokia.com/networks/training/service-routing-certification/ | NRS I → NRS II → SRA. Matters if 7750s appear in your target networks. Self-study material free, exams paid |

### Skip

**Cisco Networking Academy** (https://www.netacad.com/) tops out at CCNA — ITN, SRWE, ENSA. Nothing in it reaches IS-IS wide metrics, SR, L3VPN, RPKI, or peering. Below the starting point of this plan.

> Skills for All is gone as a separate platform — Cisco folded `skillsforall.com` into `netacad.com` (announced [September 2024](https://blogs.cisco.com/our-corporate-purpose/cisco-networking-academy-unveils-new-unified-teaching-and-learning-experience)); one site now, ~50 courses. Doesn't change the verdict — the ceiling is still CCNA. *Checked 2026-08-07.*

**Packet Tracer** cannot simulate MPLS, LDP, SR, L3VPN, EVPN, or meaningful BGP communities. containerlab covers everything from B5 onward and does it properly. Don't split lab time between the two.

### Certification track — decide at D6, not before

Two viable paths. **Pick one.**

| Track | Path | Fits |
|---|---|---|
| Juniper | JNCIA-Junos → JNCIS-SP → JNCIP-SP | MX/PTX shops; tier-1/2 backbones |
| Cisco | CCNP Service Provider: SPCOR 350-501 + concentration | ASR9K/NCS shops; regional ISPs skew this way |

D6 profiles real regional ISPs in your market — let that recon pick the track. Job ads for the specific employers you're targeting decide it, not general reputation.

### Lab image note

**Cisco Modeling Labs** (https://www.cisco.com/go/cml) ships licensed Cisco images, IOS-XR among them. A cleaner route to the **D21** IOS-XR RPL work if XRd gives trouble under containerlab.

| Edition | Price | Nodes | Notes |
|---|---|---|---|
| **Free** | $0 | 5 | No expiry. Reference platforms + open-source hosts |
| Personal | $199 | 20 | Annual. Community support only, cannot expand |
| Personal Plus | $349 | 40 | Annual. Community support only, cannot expand |
| Enterprise | contact Cisco | 20, expandable +300 | TAC support |

*Prices from [cisco.com](https://www.cisco.com/c/en/us/products/cloud-systems-management/modeling-labs/index.html), checked 2026-08-07. USD; Personal tiers also purchasable with Cisco Learning Credits (2 / 4).*

**Try the free tier first.** 5 nodes is enough for D21 — that day only needs a couple of XR routers to write RPL against. Cisco's page does not spell out whether IOS-XR is in the free tier's reference-platform set, so confirm that before assuming, and before paying.

---

## Operational intelligence

| Resource | Link |
|---|---|
| NANOG (talk archives + mailing list) | https://www.nanog.org/ |
| RIPE Labs | https://labs.ripe.net/ |
| APNIC Blog | https://blog.apnic.net/ |
| Geoff Huston's ISP Column | https://www.potaroo.net/ |
| PeeringDB · bgp.tools | https://www.peeringdb.com/ · https://bgp.tools/ |
| RIPEstat · RIPE Atlas | https://stat.ripe.net/ · https://atlas.ripe.net/ |
| NLNOG RING · MANRS | https://ring.nlnog.net/ · https://www.manrs.org/ |

---

## Core RFCs

| RFC | Topic | Day |
|---|---|---|
| [4271](https://datatracker.ietf.org/doc/html/rfc4271) | BGP-4 | B22 |
| [7454](https://datatracker.ietf.org/doc/html/rfc7454) | BGP operations & security | D7 |
| [8212](https://datatracker.ietf.org/doc/html/rfc8212) | Default EBGP route propagation behaviour | B32, D37 |
| [1997](https://datatracker.ietf.org/doc/html/rfc1997) | Communities | B31 |
| [4360](https://datatracker.ietf.org/doc/html/rfc4360) | Extended communities | B31 |
| [8092](https://datatracker.ietf.org/doc/html/rfc8092) | Large communities | B31 |
| [7911](https://datatracker.ietf.org/doc/html/rfc7911) | Add-path | D30 |
| [5305](https://datatracker.ietf.org/doc/html/rfc5305) | IS-IS wide metrics | D10 |
| [5286](https://datatracker.ietf.org/doc/html/rfc5286) | LFA | D16 |
| [5880](https://datatracker.ietf.org/doc/html/rfc5880) | BFD | D17 |
| [8402](https://datatracker.ietf.org/doc/html/rfc8402) | Segment Routing architecture | D49 |
| [8986](https://datatracker.ietf.org/doc/html/rfc8986) | SRv6 network programming | D59 |
| [4364](https://datatracker.ietf.org/doc/html/rfc4364) | BGP/MPLS IP L3VPN | D61 |
| [7432](https://datatracker.ietf.org/doc/html/rfc7432) | EVPN | D71 |
| [7947](https://datatracker.ietf.org/doc/html/rfc7947) | IXP route servers | D76 |
| [7999](https://datatracker.ietf.org/doc/html/rfc7999) | BLACKHOLE community | D33, D86 |
| [8955](https://datatracker.ietf.org/doc/html/rfc8955) | Flowspec | D87 |
| [6480](https://datatracker.ietf.org/doc/html/rfc6480) | RPKI architecture | D81 |
| [6811](https://datatracker.ietf.org/doc/html/rfc6811) | RPKI origin validation | D81 |
| [9234](https://datatracker.ietf.org/doc/html/rfc9234) | BGP roles / Only-To-Customer | D84 |

Plus **[RIPE-580](https://www.ripe.net/publications/docs/ripe-580/)** on route flap damping — read at D40.

Addressing RFCs referenced by [addressing-plan.md](addressing-plan.md): [3849](https://datatracker.ietf.org/doc/html/rfc3849) (IPv6 documentation prefix), [5737](https://datatracker.ietf.org/doc/html/rfc5737) (IPv4 documentation prefixes), [6598](https://datatracker.ietf.org/doc/html/rfc6598) (shared address space), [6164](https://datatracker.ietf.org/doc/html/rfc6164) (/127 on links), [6996](https://datatracker.ietf.org/doc/html/rfc6996) (private ASNs).

