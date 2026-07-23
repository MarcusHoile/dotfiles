# Personal preferences

## Writing docs

When writing documentation intended for humans (READMEs, guides, comments meant as explanations, release notes, etc.):

- Target an **Australian audience** — use Australian English spelling and conventions (e.g. "organise", "colour", "licence" as noun, metric units, DD/MM/YYYY dates).
- Aim for a **Flesch–Kincaid grade level of 9–12** (clear, accessible, but not dumbed down). Prefer plain language, shorter sentences, and active voice over jargon.

## Tool usage

Prefer `rtk` (via Bash) over raw shell commands and over built-in Read/Grep/Glob tools wherever an rtk equivalent exists: `rtk ls` instead of `ls`/`tree`, `rtk grep` instead of `grep`/`rg`, `rtk find` instead of `find`, `rtk read` instead of `cat`/`head`/`tail` for inspecting file contents. `git` commands are already auto-rewritten to `rtk git ...` by the Claude Code hook. Exception: still use the built-in **Read** tool (not `cat`/`rtk read`) for any file about to be modified with **Edit** — the harness requires a prior Read-tool call on that file before Edit will succeed.
