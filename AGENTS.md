# Agent notes — nix-config

## Cursor Agent CLI (`agent`)

The Cursor Agent CLI is **not** provided by the Homebrew `cursor` cask or by
`/Applications/Cursor.app/Contents/Resources/app/bin`.

| Command | What it is | Where it lives |
|---------|------------|----------------|
| `cursor` (Homebrew / Cursor.app) | Open files/folders in the Cursor IDE | `/opt/homebrew/bin/cursor`, Cursor.app `bin/` |
| `agent` / `cursor-agent` | Cursor Agent CLI (chat, print, models, etc.) | `~/.local/bin/` → `~/.local/share/cursor-agent/versions/...` |

Install the Agent CLI separately (Cursor’s install script / product install). It
drops shims into `~/.local/bin`.

This flake puts that directory on PATH via `home.sessionPath` in `home.nix`.
After changing PATH entries, run `nixswitch` and open a new shell.

If `agent` is missing from PATH but the binary exists:

```bash
ls -la ~/.local/bin/agent
# should symlink into ~/.local/share/cursor-agent/versions/
```

Do not confuse it with the IDE `cursor` binary; that path alone will not provide
`agent`.
