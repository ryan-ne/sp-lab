# Convergence Results

> Numbers, not adjectives. Every row is a measurement taken in the lab with the method stated.
> Feeds **Artifact A2** (D21) and **Artifact A7** (D95).

## Method

State this once and keep it constant, or the numbers aren't comparable:

- Traffic generator, offered rate, packet size.
- Loss measured how — packets dropped at the receiver, converted to milliseconds at the offered rate.
- Repetitions per scenario (minimum 5; record min / median / max, not a single run).
- Timer settings in force for that run.

## IS-IS baseline (D11–D17)

| Scenario | Detection | Timers | Loss (ms) min / med / max | Notes |
|---|---|---|---|---|
| Link down, physical | carrier | default SPF | | |
| Link down, physical | carrier | tuned SPF | | |
| Link down, no carrier loss | BFD 300×3 | | | |
| Link down, no carrier loss | BFD 100×3 | | | |
| Node down (P router) | BFD | | | |
| RR down | | | | |

Record what you changed between rows. A row without its timer settings is worthless.

## LFA / TI-LFA (D16, D53–D54)

| Scenario | Protection | Repair stack | Loss (ms) | Coverage |
|---|---|---|---|---|
| Link protection, ring | LFA | | | partial — note the gaps |
| Link protection, ring | TI-LFA | | | |
| Node protection | TI-LFA | | | |

At D54: decode the repair label stack and confirm it matches the post-convergence path, not just *a* loop-free path.

## BGP (D39, D95)

| Scenario | Mechanism | Loss (ms) | Notes |
|---|---|---|---|
| PE-CE link failure | PIC edge | | |
| Core link failure, VPN traffic | PIC core | | |
| Next-hop unreachable | NHT | | |

## Conclusions

Write these at D21 and revise at D95. What actually dominates the number — detection, SPF, FIB update, or BGP re-advertisement? Be specific about which one you measured.
