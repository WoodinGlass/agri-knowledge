# Protected species policy

This repository does not include taxa that are protected under the Appendices
to CITES (any appendix) or under national regulations such as Permen LHK
106/2018 (Indonesia), unless a documented lawful cultivation pathway exists.

This policy is a design choice, not a legal opinion. Verify CITES and national
rules for each species and jurisdiction before use.

## Status definitions

- **Deny**: hard block. No scaffold, no facts, no names, no hazards.
- **Deferred**: soft block. No scaffold in the current release. A per-taxon
  legal pathway must be documented and reviewed before the taxon is scaffold.

## Resolution rules

Two entries can match one taxon (for example a genus under a blocked family).
The more specific entry wins: genus overrides family. A `deferred` genus
overrides a `deny` family for that genus only; other genera in the family stay
denied.

## Deny list

| Taxon | Rank | Legal basis |
|---|---|---|
| `nepenthes` | genus | CITES Appendix I (N. rajah, N. khasiana) and Appendix II; Permen LHK 106/2018 |
| `cycas` | genus | CITES Appendix II; Permen LHK 106/2018 |
| `cyathea` | genus | Permen LHK 106/2018 (some species) |
| `orchidaceae` | family | CITES Appendix I/II; Permen LHK 106/2018 for many genera |
| `dionaea` | genus | CITES Appendix II |

## Deferred list

| Taxon | Rank | Legal basis | Why deferred |
|---|---|---|---|
| `vanilla` | genus | CITES Appendix II (Orchidaceae), with explicit exemption for artificially propagated pods and seeds; not in Permen LHK 106/2018 | Decision 2026-11-12: deferred from the initial release. A per-species pathway must be documented before scaffold. |

## Acceptable pathways

Per ADR-005 (engine repository), Decision point 5:

- **Artificial propagation explicitly exempted by the instrument.** The
  exemption covers the parts and products named in the annotation. Living
  plants are not covered by the CITES annotation for Vanilla pods and seeds.
- **Data on commercially cultivated varieties rather than wild-type
  material.** Wild-collected material is not accepted.

A maintainer decision may only add an exclusion. It cannot justify inclusion of
a taxon that the instruments list as protected.

## What this policy does not do

- It does not decide whether a specific species is protected. Verify the
  Appendices and national rules for each taxon and jurisdiction.
- It does not copy data from restricted databases. Conservation status from
  the IUCN Red List is not an input (ADR-005 point 5).
- It does not replace legal advice.

## How to update the list

A change is a legal decision, not a data decision. It requires:

1. A citation to the legal instrument (CITES Appendices, Permen LHK 106/2018,
   or equivalent national law).
2. ADR-005 compliance: no restricted databases, no non-commercial sources.
3. A separate pull request, reviewed by a maintainer, updating both
   `docs/protected_taxa_deny.csv` and this document.

## See also

- `docs/protected_taxa_deny.csv`: the machine-readable list.
- Engine ADR-005: license allowlist and the no-restricted-databases rule.
- Engine protected-species policy:
  https://github.com/WoodinGlass/agri-agronomy-core#protected-species
