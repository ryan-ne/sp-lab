# Peering Policy — AS65001 (lab)

> Written at **D77**, alongside a mock PeeringDB record. Enforced in config from **D80** (IRR) and **D83** (RPKI ROV).
> This is a fictional policy for a lab AS. It describes no real network.

## Summary

| Field | Value |
|---|---|
| ASN | AS65001 |
| Policy | Open / Selective / Restrictive — **TBD at D77** |
| AS-SET | `AS-LAB65001` |
| IRR databases | TBD |
| ROAs published | yes |
| MANRS participant | aspirational |
| Max-prefix v4 / v6 | TBD |
| Peering contact | TBD |
| NOC contact | TBD |
| 24×7 | TBD |

## Requirements of a peer

1. Published, current IRR objects (`aut-num`, `route`/`route6`, `as-set`); we build prefix filters from them with `bgpq4` and refresh daily.
2. Valid ROAs. We enforce ROV and **drop invalids** — no depref.
3. No default route, no transit routes toward us; announce customer cone only.
4. Consistent announcements across all interconnect points.
5. Max-prefix limits set in both directions, with a warning threshold below the teardown limit.
6. Peering LAN hygiene: no proxy ARP, no ARP for others' addresses, single MAC, no discovery protocols, no spanning tree.
7. 24×7 reachable NOC.

## What we announce

- Our own prefixes and our customers' prefixes. Nothing else.
- Never a route learned from a peer or transit to another peer — the no-transit invariant, proven in the lab at **D42** and asserted in Batfish at **D97**.

## Blackhole

We accept RFC 7999 `BLACKHOLE` from customers on prefixes inside their authorised space, down to /32 (v4) and /128 (v6). See [community-scheme.md](community-scheme.md).

## Depeering

Grounds, notice period, escalation path — TBD at D77.
