---
name: markitdown
description: Convert PDF files to Markdown with Microsoft MarkItDown before reading them. Use for EVERY PDF you need to read, summarize, search or extract from — never open a PDF directly with Read; convert it first and read the Markdown. Also works for docx, pptx, xlsx, html, epub and images.
---

# MarkItDown

[MarkItDown](https://github.com/microsoft/markitdown) is Microsoft's Python tool for converting files to LLM-friendly Markdown (keeps headings, lists and tables).

## Rule

Whenever you need the contents of a PDF, convert it with this skill first, then read the resulting `.md` file. Do not read PDFs directly.

## Usage

```bash
.claude/skills/markitdown/scripts/markitdown.sh path/to/file.pdf -o "$SCRATCHPAD/file.md"
```

Then read the `.md` with the Read tool (use `offset`/`limit` for long documents). Write output to the scratchpad directory, not into the repo, unless the user asks otherwise.

The script installs MarkItDown from GitHub into `~/.cache/markitdown-venv` on first run (needs network access to github.com and PyPI); later runs reuse it.

## Caveats

- Scanned/image-only PDFs have no text layer, so output may be empty; say so rather than guessing at the content.
- MarkItDown runs with the current process's privileges: don't convert untrusted URLs or paths.
