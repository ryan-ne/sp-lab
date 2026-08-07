# Resource Library

Everything referenced by the [140-day plan](../README.md). Free unless marked otherwise.

- [Free structured courses](#free-structured-courses)
- [Labs and tooling](#labs-and-tooling)
- [Vendor docs and free books](#vendor-docs-and-free-books)
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
