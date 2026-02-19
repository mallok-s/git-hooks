# git-hooks

Global git hooks for AI-heavy workflows. Install once, use across all repos.

## Install

```bash
git clone <your-repo-url> ~/git-hooks
~/git-hooks/install.sh
```

This sets `core.hooksPath` globally. All repos on your system will use these hooks.

## Uninstall

```bash
git config --global --unset core.hooksPath
```

## Hooks

### post-checkout
Auto-updates `main`/`master` when you switch to it.

- Fetches and fast-forwards from origin
- Fails safely if you have local commits or are offline

### pre-commit
1. **Large file prevention** — blocks files over 1MB
2. **Comment review** — shows comment lines in staged changes for review

### pre-push
**Large PR warning** — warns before pushing if your branch exceeds:
- 10 files changed, or
- 200 lines changed

Prompts to confirm. Compares against `origin/main` or `origin/master`.

## Configuration

Override thresholds via environment variables:

```bash
# Allow larger files for this commit
GIT_HOOKS_MAX_FILE_SIZE=5242880 git commit -m "message"

# Allow larger PR for this push
GIT_HOOKS_PR_MAX_FILES=30 git push
GIT_HOOKS_PR_MAX_LINES=500 git push
```

## Works with pre-commit framework

All hooks chain to local repo hooks first (`.git/hooks/<hook>`), so repos using the [pre-commit](https://pre-commit.com/) framework work as expected.
