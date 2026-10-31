# Contributing to agri-knowledge

Contributions are welcome. This repository holds **data only**; the engine,
schemas and validators live in
[`agri-agronomy-core`](https://github.com/WoodinGlass/agri-agronomy-core).

Read the full rules in the [README](README.md#contributing). This file is a
quick summary; the README is authoritative.

## What we accept

- Corrections to values, with a citation.
- New facts with a source, an evidence grade and an honest scope.
- Names and aliases in other languages.
- New taxa (created with `agri-core pack scaffold`).
- Source proposals.
- A new country.

## Rules

1. **Facts and citations only.** Do not paste text, tables or figures from
   sources. Write each fact in your own words.
2. **Every new fact needs** a `src` (a row in `sources.csv` with URL, an
   allowlisted license, `commercial_use=yes` and an access date), an
   `evidence` grade, a `scope` and a status. Entered facts start at `draft`.
3. **Unknown stays unknown.** If no reliable allowlisted source exists,
   record the fact as `unknown` with a reason.
4. **Keep the scope honest.** Cultivation practice must be scoped by
   country, region, growing system or variety.
5. **English only** in keys, identifiers and documentation. Local-language
   names go in `names.csv` with BCP-47 tags.
6. **No personal data.**
7. **Licensing.** Contributions are licensed under CC BY 4.0 for data and
   Apache-2.0 for code and documentation.
8. **Protected species need a documented lawful pathway.** See
   [Protected species](README.md#protected-species).
9. **No bulk imports in pull requests.** Open an issue first.

## Workflow

1. Fork and branch (`data/...`, `importer/...` or `fix/...`).
2. Run `agri-core validate --pack . --strict` and
   `agri-core lint-sources --pack .` locally.
3. Commit with Conventional Commits.
4. Open a pull request using the template; the license checklist is part of it.

## License

By submitting a contribution you confirm that you have the right to
contribute it and that it is licensed under the terms of the files it
changes: **CC BY 4.0** for data, **Apache-2.0** for code and documentation.
