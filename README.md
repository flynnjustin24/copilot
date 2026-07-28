
## Installing Copilot CLI

To install and authenticate the GitHub Copilot CLI non-interactively (useful for CI), add the following steps to your environment or CI workflow.

Install prerequisites (Debian/Ubuntu):

```sh
sudo apt-get update -y
sudo apt-get install -y curl tar gzip
```

Install Copilot CLI (official installer):

```sh
# Installs the `copilot` binary to a standard location (e.g., /usr/local/bin)
curl -fsSL https://gh.io/copilot-install | sudo bash
# Verify install
copilot --version
```

Authenticate non-interactively using a Personal Access Token (PAT):

```sh
# Create a PAT with the Copilot / Copilot Requests scope
# Then set it in your environment (CI secrets) as COPILOT_GITHUB_TOKEN (preferred)
export COPILOT_GITHUB_TOKEN="ghp_yourPATtoken"
# The Copilot CLI also checks GH_TOKEN and GITHUB_TOKEN if COPILOT_GITHUB_TOKEN is not set

# You can now run copilot commands non-interactively, for example:
COPILOT_GITHUB_TOKEN="$COPILOT_GITHUB_TOKEN" copilot code --file src/App.jsx --prompt "Suggest a small refactor" --output suggestions.txt
```

Notes
- Store the PAT as a repository secret (e.g., Actions secret COPILOT_GITHUB_TOKEN) rather than in plaintext.
- Use the least privilege for the token and rotate periodically.
- If you prefer interactive login, run `copilot` and follow the `/login` instructions.
