# Addressing Plan

> IPv6 plan justified in writing at **D18**. Full 5-AS mini-Internet plan at **D91**.
> Every allocation below is lab-only, from documentation/private space. Nothing here comes from a real network.

## 1. Space in use

| Purpose | Space | Why |
|---|---|---|
| IPv6 documentation | `2001:db8::/32` | RFC 3849 — safe to publish |
| IPv4 documentation | `192.0.2.0/24`, `198.51.100.0/24`, `203.0.113.0/24` | RFC 5737 |
| IPv4 lab-scale filler | `100.64.0.0/10` | RFC 6598 — enough room, clearly not routable |
| Private ASNs | `64512–65534` | RFC 6996 |

## 2. IPv6 hierarchy (the D18 deliverable)

| Level | Prefix size | Notes |
|---|---|---|
| Provider allocation | `/32` | one per lab AS |
| PoP | `/40` or `/44` | aggregation boundary — one IGP-advertised summary per PoP |
| Infrastructure per PoP | `/48` | loopbacks + links carved from here |
| Loopbacks | `/128` from a dedicated `/64` | one `/64` per AS, never split |
| P2P links | `/127` | RFC 6164 — avoids the ping-pong and NDP-exhaustion issues of `/64` on links |
| Customer assignment | `/48` (site) or `/56` (small) | never `/64` to a customer — kills their subnetting |
| LAN | `/64` | SLAAC requires it |

Justify at D18: why `/127` on links and not `/126` or `/64`; why loopbacks come from one contiguous `/64`; where the summarisation boundary sits and what it buys in LSDB size.

## 3. Per-AS allocations — mini-Internet (D91)

| AS | Role | IPv6 | IPv4 | ASN |
|---|---|---|---|---|
| A | Tier-2 transit | TBD | TBD | TBD |
| B | Regional ISP | TBD | TBD | TBD |
| C | Regional ISP | TBD | TBD | TBD |
| D | Content network | TBD | TBD | TBD |
| E | IXP + route server | TBD | TBD | TBD |

## 4. Loopback / system-ID convention

- IS-IS system ID derived from the IPv4 loopback: `192.0.2.11` → `1920.0200.2011`. Deterministic, readable in `show isis database`.
- Node-SID = last octet of loopback offset into the SRGB (see D50).
