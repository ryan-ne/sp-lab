# BGP Community Scheme

> Filled in at **D32–D33**, proven in the lab at **D34**, shipped as part of **Artifact A3** (D42).

Placeholder ASN for the lab: `AS65001` (replace when the topology is fixed at D91).

## 1. Design rules

- Everything learned on an eBGP session is tagged on **ingress**. No untagged routes in the RIB.
- Informational communities are set by us and **stripped from customer/peer input** — a neighbour must never be able to forge one.
- Action communities are accepted **only from customers**, and only the ones published in the peering policy.
- Prefer **large communities** (RFC 8092) so a 4-byte ASN fits without tricks; keep standard (RFC 1997) equivalents only where a peer's kit demands it.

## 2. Informational — set on ingress

| Large community | Meaning |
|---|---|
| `65001:1:1` | learned from customer |
| `65001:1:2` | learned from peer |
| `65001:1:3` | learned from transit |
| `65001:1:4` | learned from IXP route server |
| `65001:2:<region>` | region of ingress |
| `65001:3:<pop>` | PoP of ingress |

## 3. Action — accepted from customers

| Large community | Action |
|---|---|
| `65001:100:<lp>` | set local-pref |
| `65001:101:<asn>` | prepend once toward `<asn>` |
| `65001:102:<asn>` | prepend twice toward `<asn>` |
| `65001:103:<asn>` | prepend three times toward `<asn>` |
| `65001:200:<asn>` | do not announce to `<asn>` |
| `65001:201:<region>` | do not announce in `<region>` |
| `65535:0:666` / `65535:666` | blackhole (RFC 7999 `BLACKHOLE`) |

## 4. Local-pref hierarchy

| Source | Local-pref |
|---|---|
| Customer | 200 |
| Peer | 150 |
| Transit | 100 |
| Backup / depref-on-request | 50 |

Rationale (write this out at D35): customer routes earn revenue, peer routes are free, transit routes cost money.

## 5. Boundary behaviour

- Strip all `65001:*` on egress to peers and transit.
- Verify at D34: tag on ingress → confirm propagation across iBGP → confirm strip at every egress boundary.

## 6. Open questions

- Standard-community fallback mapping — needed at all, or drop it?
- Blackhole propagation upstream: which transits accept it, at what max-length?
