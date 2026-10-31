<h1 align="center">agri-knowledge</h1>

<p align="center"><strong>Open, tiered, cited cultivation knowledge for vegetables, fruit, staples, fodder, ornamentals and rare plants, scoped by country.</strong><br>
Every value has a source, a scope, an evidence grade and a review status. Where we do not know, we say <code>unknown</code>.</p>

<p align="center">
  <a href="https://github.com/WoodinGlass/agri-knowledge/actions/workflows/ci.yml"><img src="https://github.com/WoodinGlass/agri-knowledge/actions/workflows/ci.yml/badge.svg" alt="CI"></a>
  <img src="https://img.shields.io/badge/status-pre--release-orange" alt="Status">
  <img src="https://img.shields.io/badge/data-CC%20BY%204.0-blue" alt="Data license: CC BY 4.0">
  <img src="https://img.shields.io/badge/code-Apache--2.0-blue" alt="Code license: Apache-2.0">
  <img src="https://img.shields.io/badge/engine-agri--agronomy--core%20%E2%89%A5%20v0.1.2-blue" alt="Engine: agri-agronomy-core v0.1.2 or newer">
  <img src="https://img.shields.io/badge/pre--commit-enabled-brightgreen" alt="pre-commit">
  <img src="https://img.shields.io/github/last-commit/WoodinGlass/agri-knowledge" alt="Last commit">
</p>

<p align="center">
  <a href="#quick-start">Quick start</a> ·
  <a href="#coverage">Coverage</a> ·
  <a href="#milestones">Milestones</a> ·
  <a href="#contributing">Contributing</a> ·
  <a href="https://github.com/WoodinGlass/agri-agronomy-core">The engine</a>
</p>

> **Pre-release (milestone K0).** There is no tagged release yet and no data is shipped. The first release, `v0.1.0`, is planned after milestone K5; until then expect an empty or very small pack and breaking changes. This is reference data, not professional agronomic advice. Read [Read this first](#read-this-first) and [Using the data responsibly](#using-the-data-responsibly) before relying on any value.

## Read this first

Honesty is a feature of this project. Before you build on it:

- **It is young.** The first milestones build the foundation, not coverage. See [Milestones](#milestones).
- **It is small on purpose.** The first profiles are tomato and rice, starting with Indonesia. More groups follow one at a time.
- **It has gaps by design.** Only sources whose licenses allow commercial reuse are accepted. That rules out most paywalled journal articles, so many values will be `unknown` until open sources or expert contributions exist.
- **No expert has approved anything yet.** One person maintains the repository today. Until independent domain experts review facts, nothing is `approved`, and releases carry the label *reviewed-only: for pilots with human oversight*.
- **It is not advice, and it is not legal advice.** Values may be wrong for your site, variety or climate. Hazard and legal flags point you to an authority; they do not tell you what is lawful.

## What this is

`agri-knowledge` is the data half of a two-repository system:

1. **The facts.** Taxa, multilingual names, facts, hazard and legal flags, source records and reference datasets, written in the pack format defined by [`agri-agronomy-core`](https://github.com/WoodinGlass/agri-agronomy-core).
2. **The way they are made.** Importers, review records and checks that turn sources into a versioned, hash-verified pack, released as an archive that the engine loads offline.

Adding a taxon, a name or a country is a data change here, not a code change in the engine. Every value comes with a citation, and nothing is borrowed from another taxon or country.

**Who it is for**

- Developers using `agri-agronomy-core` who need real data to run it on.
- Researchers and extension teams who want citable, scoped values with visible trust levels.
- Domain experts who want to review and improve values through review sheets, without learning Git.
- People who want to add their own country.

## What this is not

- **Not an engine.** Schemas, the parameter dictionary, the validator, the calculators and the exports live in `agri-agronomy-core`. The pipelines here contain no agronomic logic.
- **Not agronomic advice, a crop recommender or a diagnostic tool.** It is reference data with visible provenance.
- **Not a pesticide or dose database.** Such questions return `refer_to_label` or `refer_to_authority` in the engine.
- **Not a mirror of third-party datasets.** Raw third-party data is never committed; only manifests, checksums and scripts are.
- **Not an encyclopedia.** Coverage is exactly what the pack contains, and `unknown` is a valid answer.
- **Not a legal database.** Legal flags cite the instrument they come from; they do not interpret it for you.
- **Not a home for personal data.** Neither the repository nor the pack contains any.

## How it fits with agri-agronomy-core

```
open sources ──► importers / seed scripts ──► facts: imported → draft → reviewed → approved
                                                  │  agri-core: validate · lock · build
                                                  ▼
                                  versioned, hash-verified pack (release archive)
                                                  │  loaded offline
                                                  ▼
                       agri-agronomy-core ──► ok · unknown · not_applicable · ambiguous · …
```

| | `agri-agronomy-core` (engine) | `agri-knowledge` (this repository) |
|---|---|---|
| Owns | The contract: JSON Schemas, parameter dictionary, pack format, resolution policy. The validator and license gate. The calculators and exports. | Taxa, names, facts, hazard and legal flags, source records, reference datasets, importers, review records and built packs. |
| Changes through | An engine release (code or dictionary). | A pack release (data only). |
| License | Apache-2.0 | Data CC BY 4.0; tooling and documentation Apache-2.0 |

- **The engine defines the format.** If this repository needs something the format cannot express, the change starts as an issue and an ADR in the engine. This repository never invents formats.
- **Versions are pinned both ways.** The engine release records the pack version it was tested against. Each pack release records the engine it needs (`engine_min`, `dictionary_min`).
- **One validator.** Pull-request checks run the same `agri-core` validator the engine ships.

## Design principles

1. **Every value cites a source.** Facts are individual values (a number, a range or a rule) written in our own words, never pasted text, tables or figures.
2. **Unknown is an answer.** A missing value is recorded as `unknown` with a reason. It is never filled by guesswork, interpolation or a neighboring taxon.
3. **Scoped, never borrowed.** A value declares where it holds (country, region, growing system, variety, season). The engine answers `unknown` outside it.
4. **Trust is visible.** Status (`imported`, `draft`, `reviewed`, `approved`), evidence grade (`A` to `D`) and derived tier (`T0` to `T3`) travel with every value.
5. **Commercially usable throughout.** The data is CC BY 4.0, and every source behind it passes a strict license allowlist.
6. **Reproducible and verifiable.** The same sources and scripts give byte-identical packs. Releases ship with SHA-256 sums, and the engine verifies the pack hash on load.
7. **Data, not code.** Pipelines transform; the engine calculates.
8. **One contract.** The engine defines the format; this repository follows it.
9. **Private by design.** Reviewers appear as anonymous IDs. Packs and exports contain no personal data.

## Coverage

Nothing ships yet. This is the plan for the first release and beyond, and it is updated as milestones complete.

| Group | Target at `v0.1.0` | Notes |
|---|---|---|
| Staples | Rice at T2 `reviewed` | Indonesia first |
| Vegetables | Tomato at T2 `reviewed` | Indonesia first |
| Taxonomic backbone | T0 for the priority list | Multilingual names (Indonesian, English, local) |
| Countries | Indonesia plus one more | The second country is chosen in K4 for open-source availability and a climate and regulatory contrast |
| Fruit, fodder, ornamentals, rare plants | After `v0.1.0` | One group per iteration; rare plants last, because their legal screening is the heaviest |

- **Rare is not the same as protected.** Rare taxa are included only where cultivation is lawful and documented. See [Protected species](#protected-species).
- **Scale.** One pack is sized for up to about 10,000 taxa, 30,000 names and 200,000 facts, the budget the engine is tested against.
- **Priority list.** Profiles from the wishlist, such as mango, vanilla, carnivorous plants and black truffle, follow in later iterations and only where a lawful cultivation pathway exists.

## Quick start

### Use a release

> Available after `v0.1.0`. The commands show the intended flow.

```bash
VERSION=0.1.0
BASE=https://github.com/WoodinGlass/agri-knowledge/releases/download/v$VERSION
curl -fLO $BASE/agri-knowledge-$VERSION.tar.gz
curl -fLO $BASE/SHA256SUMS
sha256sum --check --ignore-missing SHA256SUMS
tar -xzf agri-knowledge-$VERSION.tar.gz
```

Install the engine (v0.1.2 or newer) and load the pack explicitly:

```bash
pip install "git+https://github.com/WoodinGlass/agri-agronomy-core@v0.1.2"
```

```python
from pathlib import Path

from agri_core import registry
from agri_core.pack import load_knowledge_set

# Load a built pack explicitly, and pin its hash in your own configuration.
pack = load_knowledge_set(Path("agri-knowledge-0.1.0"))

info = registry.meta(pack)
print(info.pack_version, info.content_hash)

outcome = registry.resolve_taxon(pack, "tomato")
if outcome.status == "ok":
    fact = registry.resolve_fact(pack, outcome.taxon_id, "soil_ph")
    if fact.status == "ok":
        print(fact.value_pretty, fact.fact.fact_id, fact.provenance.pack_hash)
    else:
        # "unknown", "not_applicable" and "insufficient_input" are real answers:
        # the engine never borrows a value from another taxon or country.
        print(fact.status)
```

The engine's [resolution policy](https://github.com/WoodinGlass/agri-agronomy-core/blob/main/docs/RESOLUTION_POLICY.md) explains how scope and status decide which fact wins.

### Google Colab

Install the engine in any Colab cell, then load the unpacked release as above:

```python
!pip install -q "git+https://github.com/WoodinGlass/agri-agronomy-core@v0.1.2"
```

No API key or GPU is needed.

### Work on the data

```bash
git clone https://github.com/WoodinGlass/agri-knowledge.git
cd agri-knowledge
pip install -r requirements.lock   # hash-pinned; installs agri-core from a GitHub Release wheel
pre-commit install
make check                         # runs the quality gates locally
```

In Colab, run the same commands with a leading `!` and keep your Git token in Colab Secrets. Notebooks are for exploration only, and their output is stripped (nbstripout).

Common tasks:

```bash
agri-core pack scaffold --pack . --scientific-name "Solanum lycopersicum" --archetype annual --use vegetable
agri-core validate --pack . --strict
agri-core lint-sources --pack .
agri-core pack lock --pack .                    # refresh content_hash
agri-core pack build --pack . --out build/      # reproducible SQLite pack
agri-core coverage --pack .                     # tier distribution and per-taxon coverage
agri-core diff --old path/to/previous-pack --new . --exit-code
```

Loading the source tree directly is a development path and is roughly 10 times slower than loading a built pack.

## Repository layout

```
agri-knowledge/
├─ pack.toml                 # name, version, schema_version, engine_min, dictionary_min, synthetic, content_hash
├─ taxa.csv  names.csv       # taxonomic backbone and multilingual names
├─ facts/<taxon_id>.csv      # one file per taxon: wildcard facts and country-scoped facts
├─ hazards.csv  sources.csv  datasets.csv
├─ advisories.csv            # not used; the engine rejects non-whitespace content until M8
├─ pipelines/
│  ├─ importers/<name>/      # manifest.toml, fetch, transform, AUDIT.md
│  ├─ seed/                  # working spreadsheet → draft fact rows (spreadsheets are not committed)
│  └─ tools/                 # attribution, CODEOWNERS, release notes, size budget, interim review sheet
├─ reviews/                  # review records with anonymous reviewer IDs (no personal data)
├─ docs/
│  ├─ GOVERNANCE.md  SOURCES_POLICY.md  PROTECTED_SPECIES.md  COUNTRY_ONBOARDING.md
│  ├─ countries/<ISO2>.md    # country dossiers: authoritative sources, legal references, stewards
│  ├─ wishlist/              # priority list of taxa
│  └─ decisions/             # ADRs for this repository
├─ .github/                  # CODEOWNERS (generated), workflows, issue and PR templates
├─ README.md  CONTRIBUTING.md  SECURITY.md  CHANGELOG.md  CITATION.cff
├─ LICENSE  LICENSE-DATA  NOTICE  ATTRIBUTION.md   # Apache-2.0 · CC BY 4.0 · notices · generated source credits
└─ Makefile  requirements.lock
```

- The repository root is a **source pack** in the format defined by the engine (see the [pack format](https://github.com/WoodinGlass/agri-agronomy-core#pack-format) and its [reference](https://github.com/WoodinGlass/agri-agronomy-core/blob/main/docs/PACK_FORMAT.md)). Releases ship a built SQLite pack.
- Taxa are created only with `agri-core pack scaffold`. Taxon IDs are opaque and never reused.
- Raw third-party data is never committed: only manifests, checksums and scripts. The `.cache/` directory is git-ignored.
- Coverage reports are produced by CI and attached to releases, not committed.

## Facts, tiers and statuses

Each fact is one value at one scope: `fact_id`, `taxon_id`, `parameter`, `phase`, `value`, `scope`, `src`, `evidence` and `status`, plus review metadata such as `reviewed_by` and the review date. The field reference lives in the engine's [pack format](https://github.com/WoodinGlass/agri-agronomy-core#pack-format).

**Statuses**

| Status | Meaning |
|---|---|
| `imported` | Bulk import from an allowlisted dataset by a maintained importer |
| `draft` | Entered, not yet checked |
| `reviewed` | Matched to its citation by a maintainer |
| `approved` | Signed off by a domain expert; safety-critical facts need two independent experts |

**Tiers** are derived by `agri-core coverage`, never declared:

| Tier | Meaning |
|---|---|
| T0 | Identity only: name, rank, parent |
| T1 | At least one live fact at any status |
| T2 | Every required parameter for the taxon is at `reviewed` or above, or is explicitly `unknown` with a reviewed reason |
| T3 | T2, with every required parameter `approved` and every safety-critical fact approved by at least two distinct reviewers |

`unknown` with a reason is a valid, reviewable answer, and it counts toward T2. Evidence grades run from `A` (guideline or peer-reviewed) to `D` (anecdotal). Safety-critical parameters (dose caps, toxicity limits, regulatory limits) are never `draft` or `imported`; see the engine's [safety-critical parameters](https://github.com/WoodinGlass/agri-agronomy-core#safety-critical-parameters).

**Scope rules**

- A **wildcard** fact (no country) holds everywhere, so it is reserved for biologically intrinsic properties.
- **Cultivation practice** (doses, planting calendars, irrigation) must be scoped by country, region, growing system or variety.
- A scope is never wider than what the source states.
- Cultivars are not taxa; use `scope.variety`.
- Country is `scope.country` (ISO 3166-1 alpha-2). Regions use ISO 3166-2 codes where available.

## Sources and licensing

The policy is specified in the engine ([licensing policy](https://github.com/WoodinGlass/agri-agronomy-core#licensing-policy) and [ADR-005](https://github.com/WoodinGlass/agri-agronomy-core/blob/main/docs/decisions/ADR-005-license-allowlist.md)) and enforced here by `agri-core validate --strict` on every pull request.

### Accepted licenses

| License | Typical use | Note |
|---|---|---|
| `CC0-1.0` | Open datasets | Public-domain dedication |
| `CC-BY-4.0` | Datasets and articles | Preferred for datasets: version 4.0 explicitly covers database rights |
| `CC-BY-3.0` | Articles | Version 3.0 unported does not explicitly cover database rights; use 4.0 where there is a choice |
| `MIT`, `BSD-2-Clause`, `BSD-3-Clause`, `Apache-2.0` | Values taken from software | |
| `LicenseRef-PublicDomain` | Works in the public domain under the applicable law | The `citation` must begin with `basis:` and state the legal basis |

- The `license` field must match one identifier exactly. Compound expressions (`AND`, `OR`, `WITH`) are rejected; a dual-licensed source records the license that was elected.
- `commercial_use` must be `yes` for every row of `sources.csv` and `datasets.csv`. `no` and `unclear` are errors.
- **Rejected:** any NonCommercial, ShareAlike or NoDerivatives variant of a Creative Commons license, ODbL, GPL-family licenses, "free for research or non-commercial use" terms, "all rights reserved" material without written permission on file, and sources with no stated license.
- **Terms of use count.** A source whose terms restrict commercial use is rejected even if a value could be found elsewhere. At the time of writing this includes the IUCN Red List and the Species+/CITES Checklist database.
- **Not used:** handbook tables, text and worked examples, and FAO publications and databases (their reuse terms vary, and many are not compatible with the allowlist).

### Where values come from

| Source type | Examples |
|---|---|
| **S1** | Government publications under an open license, or in the public domain with a written legal basis |
| **S2** | Literature and datasets under CC BY or CC0 |
| **S3** | Expert contributions under CC BY 4.0 with a rights statement, recorded as a source row that points to a public issue or pull request |
| **S4** | The maintainers' own field data |

**What this means in practice.** Paywalled journal articles cannot be sources, so coverage will grow more slowly and more sparsely than a database that copies freely. A parameter with no allowlisted source stays `unknown`. Before a tier target is locked, a source-feasibility audit lists, for each required parameter, crop and country, the candidate sources and their licenses.

### Importers

Importers arrive in milestone K3. Each lives in `pipelines/importers/<name>/` and ships:

- `manifest.toml`: source, URL, SPDX license, `commercial_use`, dataset version or date, SHA-256 of the raw download, access date.
- Fetch and transform scripts, and an `AUDIT.md` with the sample-audit result.

Rules:

- Deterministic and idempotent: two runs on the same input produce identical output.
- Network access happens only in a manual workflow, with allowlisted domains and verified checksums. Pull-request checks never fetch source data.
- Taxon IDs come from `agri-core pack scaffold`. Crosswalks to external IDs stay in `pipelines/`, not in the pack.
- Results enter as `imported` and pass the license gate before a pull request is opened.
- **Sample audit** (initial thresholds, confirmed at K3): a stratified random sample per parameter and country of at least 100 rows or 5% (whichever is larger). Pass if value errors are at most 2% and there is no safety-critical error.

**Working spreadsheets are worksheets, not sources.** Values without an allowlisted `src` become `unknown`. Conversion scripts are committed; spreadsheets are not.

## Protected species

- A taxon listed in the Appendices to CITES (any appendix) or protected under a national regulation such as Permen LHK 106/2018 (Indonesia) is not included unless a documented lawful cultivation pathway exists.
- Acceptable pathways include artificial propagation explicitly exempted by the instrument, or data on commercially cultivated varieties rather than wild-type material. Wild-collected material is not accepted.
- Decisions cite legal instruments. Conservation status from restricted databases, for example the IUCN Red List, is not used as an input. Maintainers may still decline a taxon on conservation grounds, and the reasoning is recorded without importing restricted data.
- This is a design choice, not a legal opinion. Verify CITES and national rules for each species and jurisdiction. Details are in [`docs/PROTECTED_SPECIES.md`](docs/PROTECTED_SPECIES.md) and the engine's [protected-species policy](https://github.com/WoodinGlass/agri-agronomy-core#protected-species).

## Quality gates

These gates are built in milestone K0. Until K0 is done, the repository ships no data. Every pull request must pass them, and `make check` runs most of them locally:

1. `agri-core validate --strict` and `agri-core lint-sources`: structure, units, scope, trapezoid order and the license gate.
2. `agri-core pack lock` leaves no diff, so `content_hash` is current.
3. `agri-core pack build` run twice gives an identical SHA-256.
4. `agri-core diff` against the previous release generates the value changelog.
5. `agri-core coverage`: a taxon's tier may not drop without a written exception.
6. Size budget: the engine's performance budget (10,000 taxa, 30,000 names, 200,000 facts; load in 1 s or less, memory 200 MB or less) is the limit for one pack.
7. `ATTRIBUTION.md` is current with `sources.csv` and `datasets.csv`.
8. A PII and secret scan passes, and CSV files are canonical (UTF-8, LF, sorted rows, no BOM).
9. Engine matrix: the pack loads with `engine_min` and with the latest engine tag.

`main` must always be valid, because the engine is planned to run a canary job against it. Workflows pin actions by commit SHA and use minimal permissions.

## Governance and review

The full rules are in [`docs/GOVERNANCE.md`](docs/GOVERNANCE.md). In short:

- **Roles.** Maintainer (merges, sets `reviewed`), domain reviewer (sets `approved`) and, from K4, country steward (local sources, names, legal flags). Roles may overlap early on, with one exception: nobody approves their own facts.
- **Approval.** `approved` needs at least one domain expert. Safety-critical facts need at least two independent experts: different people, and different institutions where possible.
- **Privacy.** Reviewers appear as anonymous IDs. A name appears only with written consent. The ID-to-identity map is kept privately, outside the repository, and CI scans for names and e-mail addresses.
- **Evidence.** `reviews/<id>.md` records the reviewer ID, date, `fact_id`s, outcome and a short rationale, with no names, affiliations or contact details. Experts without a GitHub account review through a review sheet, and a maintainer records the outcome. The expert review program is milestone K5.
- **Honest labeling.** Until independent experts exist, nothing is `approved` and releases are labelled reviewed-only.
- **Freshness.** The initial policy flags facts last reviewed more than 24 months ago for re-review.
- **Ownership.** CODEOWNERS starts as the maintainer and is generated per group once real reviewers exist. Country ownership cannot be path-based, because scope lives inside rows, so CI labels pull requests `country:XX` and asks the country steward to approve (from K4).
- **Corrections.** Ordinary corrections ship as PATCH releases. Safety-critical corrections ship immediately, with a GitHub Security Advisory and a CHANGELOG entry. `advisories.csv` is not used until the engine loader supports advisories: the engine rejects any non-whitespace content in it, even a header row.
- **Decisions.** Policy decisions (license allowlist, tier rules) are ADRs in the engine. Technical decisions for this repository are ADRs in [`docs/decisions/`](docs/decisions/).

## Releases and versioning

- **Semantic Versioning.**
  - MAJOR: `schema_version` or the pack format changes. During 0.x, breaking changes bump MINOR and are listed under `### Changed`, as in the engine.
  - MINOR: additions such as taxa, names, facts, countries, sources and status promotions.
  - PATCH: corrections to values, citations or scope, and safety notices.
- **Cadence.** Monthly when there are changes; ad hoc for safety-critical corrections.
- **Assets** of each GitHub Release:
  - `agri-knowledge-<version>.tar.gz`, built reproducibly. It extracts to `agri-knowledge-<version>/` with `pack.sqlite`, `pack.toml`, `LICENSE-DATA` and `ATTRIBUTION.md`.
  - `SHA256SUMS`.
  - The coverage report.
  - The value changelog generated from `agri-core diff`.

  Asset names are stable so that the engine's release can attach them.
- Releases are git tags and GitHub Releases. They are not published on PyPI.

## Milestones

| Milestone | Status | Scope | Done when |
|---|---|---|---|
| **K0** Foundation | In progress | Repository, licenses and `NOTICE`, README, SECURITY and CONTRIBUTING, initial CODEOWNERS, pre-commit, full CI (see [Quality gates](#quality-gates)), valid empty pack, ADR-001 (layout and versioning), source-feasibility audit skeleton. | CI is green; `agri-core validate --strict` exits 0; two builds are byte-identical; the empty pack loads with the pinned engine tag and with engine `main`. |
| **K1** Seed: tomato and rice (Indonesia) | Not started | Facts seeded from a working spreadsheet with allowlisted sources, then maintainer review. | Both taxa reach T2 `reviewed`; every source passes the license gate; the report shows the share of parameters with a value versus `unknown`; parameters used by engine calculators (M10 to M12) are prioritized and reported. |
| **K2** Backbone and names | Not started | T0 for the priority list (wishlist plus core commodities), multilingual names, protected-species screening. | `resolve_taxon` returns `ok` for 100% of the priority list by Indonesian and English name; every `ambiguous` result is intentional and recorded; no protected taxon without a lawful pathway. |
| **K3** First importer and license gate | Not started | First fact importer (T1 `imported`), sample audit, generated `ATTRIBUTION.md` and manifest. | A second run is identical; the audit meets the criteria above; the importer rejects licenses outside the allowlist (tested). |
| **K4** Two countries and flags | Not started | A second country, and `hazards.csv` with legal flags that cite legal instruments (public-domain basis), with examples that return `refer_to_authority`. | A tomato scenario gives correct, different results across the two countries with no borrowed values; every flag cites its instrument. |
| **K5** Expert review program and coverage report | Not started | Recruit experts, document the review process and its evidence, publish a coverage report per group and country. | The process is documented and exercised on at least one non-safety fact (one expert) and one safety-critical fact (two experts). If experts are unavailable, the release is labelled reviewed-only. |
| **`v0.1.0`** | Not started | All gates green; tomato and rice at T2 `reviewed` for Indonesia and one more country; T0 backbone; importer #1; legal flags; coverage report. | Tagged, and pinned by the engine's M11 tests. |
| **K6+** | Not started | One group per iteration: fruit, then fodder, then ornamentals, then rare plants. | Each iteration: source audit, seed or importer, review, MINOR release. |

## Using the data responsibly

- **Status matters.** Use `approved` facts for decisions that affect real crops. Use `reviewed` facts only in development and pilots with human oversight. Never use `draft` or `imported` facts for decisions.
- **Check the scope.** A value for one country is not a value for another. The engine answers `unknown` outside a fact's scope; do not work around it.
- **Pin the hash.** Record the `content_hash` of the pack you load, and do not load a pack from an untrusted source without a pinned hash.
- **Local rules and labels come first.** Rules on fertilizers, water use and plant protection differ between countries. Pesticides are out of scope: follow the product label and local regulations.
- **`unknown`, `not_applicable` and `ambiguous` are real answers.** They are not errors to route around.
- **Report what looks wrong.** See [Reporting problems](#reporting-problems).

**FAQ**

- **Why is so much `unknown`?** Because a value needs a source we can cite and reuse commercially, and a reviewer who checked it. A confident-looking guess would be worse than a gap.
- **Why not import a well-known crop database?** Provenance, scope and license. Bulk imports without a compatible license are not accepted; imports from open datasets go through the [importer process](#importers).
- **Can I use this commercially?** Yes, under CC BY 4.0 with attribution, and every source in the pack is on the allowlist. This is not legal advice.
- **Can I add my country?** Yes. Start with [`docs/COUNTRY_ONBOARDING.md`](docs/COUNTRY_ONBOARDING.md). Countries are added as scoped facts and reviewed by a steward.

## Contributing

Contributions are welcome, especially corrections with citations, names in other languages, source proposals and country knowledge. Code and format changes go to the [engine](https://github.com/WoodinGlass/agri-agronomy-core); data contributions come here.

What you can contribute:

- Corrections to values, with a citation.
- New facts with a source, an evidence grade and an honest scope.
- Names and aliases in other languages.
- New taxa (created with `agri-core pack scaffold`) and source proposals.
- A new country.

Rules:

1. **Facts and citations only.** Do not paste text, tables or figures from sources. Write each fact in your own words.
2. **Every new fact needs** a `src` (a row in `sources.csv` with URL, an allowlisted license, `commercial_use=yes` and access date), an `evidence` grade, a `scope` and a status. Entered facts start at `draft`.
3. **Unknown stays unknown.** If no reliable allowlisted source exists, write the fact as `unknown` with a reason.
4. **Keep the scope honest.** See the [scope rules](#facts-tiers-and-statuses).
5. **Everything is in English:** keys, identifiers and documentation. Local-language names go in `names.csv` with BCP-47 language tags.
6. **No personal data.**
7. **Licensing.** By submitting a contribution you confirm that you have the right to contribute it and that it is licensed under the terms of the files it changes: CC BY 4.0 for data, Apache-2.0 for code and documentation.
8. **Protected species need a documented pathway.** See [Protected species](#protected-species).
9. **No bulk imports in pull requests.** Open an issue first; importers follow the [importer process](#importers).

Workflow: fork, branch (`data/…`, `importer/…` or `fix/…`, with no milestone prefixes), run `make check`, then open a pull request using the template, which includes the license checklist. Commit messages follow Conventional Commits. See [`CONTRIBUTING.md`](CONTRIBUTING.md) for the full rules.

## Reporting problems

- **A wrong or unsafe value:** open a "Data correction" issue with a citation and the `fact_id`. If you believe there is immediate risk, report it privately (Security tab, then "Report a vulnerability") instead.
- **A rights concern** (you believe content infringes your rights): follow [`SECURITY.md`](SECURITY.md). Content under dispute is held, reviewed, then released as a PATCH.
- **A vulnerability in the tooling:** use the same private reporting.

## Citing

If you use the data in research or in a product, please cite this repository with the release tag you used (see [`CITATION.cff`](CITATION.cff)). If you rely on specific facts, please also cite the original sources listed in `sources.csv`. Citation is a request; attribution under CC BY 4.0 is a license condition (see [License](#license)).

## License

| Part | License | File |
|---|---|---|
| Data: the pack tables and the built pack | CC BY 4.0 | `LICENSE-DATA` |
| Pipelines, tests, workflows, documentation and review records | Apache License 2.0 | `LICENSE`, `NOTICE` |
| Third-party sources behind the data | Their own licenses, all on the allowlist | `sources.csv`, `ATTRIBUTION.md` |

- **Data (CC BY 4.0).** It covers our own contribution: selection, arrangement and wording. Third-party sources keep their licenses and are credited in `ATTRIBUTION.md`. Because every source allows commercial use, the pack can be used commercially with attribution. Keep `LICENSE-DATA` and `ATTRIBUTION.md` with the data, and indicate any changes you make. Suggested credit: *Contains data from agri-knowledge (https://github.com/WoodinGlass/agri-knowledge), CC BY 4.0, with source credits in ATTRIBUTION.md.*
- **Code and documentation (Apache-2.0).** Redistribution follows section 4 of the license: keep the license and `NOTICE`, and mark the files you changed.
- **Contributions** are licensed under the terms of the files they change (see [Contributing](#contributing)).
- **No warranty.** The data and software are provided "as is", without warranties of any kind. To the maximum extent permitted by law, the authors and contributors are not liable for any loss or damage, including crop loss, arising from their use. The license texts contain the binding terms.
- **No affiliation or endorsement.** Names of organizations, publications and datasets are used only to identify sources. This project is not affiliated with, endorsed by or sponsored by them. The licenses do not grant rights to any trademark.

Copyright 2026 WoodinGlass and the agri-knowledge contributors.
