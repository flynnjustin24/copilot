#!/usr/bin/env bash
set -euo pipefail

REPO_SSH="git@github.com:flynnjustin24/copilot.git"
BRANCH="copilot-hardening"
TITLE='chore(workflow): harden Copilot workflow by using protected environment'
BODY='This PR hardens the Copilot CLI workflow by moving the COPILOT_GITHUB_TOKEN to a protected environment and removing the top-level exposure of the secret. It also adds a diagnostic step (prints copilot binary path/version and presence of secret variables) to help debug installer/auth issues.'
CLONE_DIR="copilot"

# reviewers to add to the PR (multiple --reviewer flags will be passed)
REVIEWERS=("Flynnjustin24" "org/review-team")

# clone if needed
if [ ! -d "$CLONE_DIR" ]; then
  git clone "$REPO_SSH" "$CLONE_DIR"
fi
cd "$CLONE_DIR"

# ensure up-to-date main
git fetch origin --prune
git checkout main
git pull --ff-only origin main

# prepare branch
if git ls-remote --heads origin "$BRANCH" | grep -q "$BRANCH"; then
  git checkout -B "$BRANCH" "origin/$BRANCH"
else
  git checkout -b "$BRANCH"
fi

# stage and commit the workflow file if there are local changes
if git status --porcelain .github/workflows/copilot-cli.yml | grep -q .; then
  git add .github/workflows/copilot-cli.yml
  git commit -m "$TITLE"
  git push -u origin "$BRANCH"
else
  # push branch if newly created locally (no local change to commit)
  if [ -z "$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || true)" ]; then
    git push -u origin "$BRANCH"
  fi
fi

# push any other local changes if present
if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "$TITLE" || echo "No additional changes to commit"
  git push origin "$BRANCH"
fi

# build gh pr create command with reviewers
if command -v gh >/dev/null 2>&1; then
  GH_CMD=(gh pr create --base main --head "$BRANCH" --title "$TITLE" --body "$BODY" --web)
  for r in "${REVIEWERS[@]}"; do
    GH_CMD+=(--reviewer "$r")
  done
  "${GH_CMD[@]}"
else
  echo "gh CLI not found. Create the PR manually at:"
  echo "https://github.com/flynnjustin24/copilot/compare/main...${BRANCH}?expand=1"
fi
