# Homebrew tap for the Blaise CLI

<p align="center">
  <img src="assets/blaise.svg" alt="Blaise" width="132" />
</p>

<p align="center">
  <strong>Assign it to Blaise. It runs on your machine.</strong>
</p>

[Blaise](https://askblaise.com) is an AI teammate that runs
[Claude Code](https://www.anthropic.com/claude-code) agents on demand, started from your tools or
from the dashboard. Blaise coordinates the work. The agents run on infrastructure you control, and
the `blaise` CLI is what connects that infrastructure to your workspace.

This tap installs the CLI on macOS and Linux with [Homebrew](https://brew.sh).

## Install

```sh
brew install blaiseagent/cli/blaise
```

That taps this repository and installs the `blaise` formula in one step. To tap first:

```sh
brew tap blaiseagent/cli
brew install blaise
```

Check the result:

```sh
blaise --version
```

`blaise` is a single executable with its own runtime: no Bun or Node.js needed.
[Claude Code](https://www.anthropic.com/claude-code) must be installed and authenticated
(`claude --version` should work).

## Update and uninstall

```sh
brew update
brew upgrade blaise
```

```sh
brew uninstall blaise
brew untap blaiseagent/cli
```

Blaise also tells you when an update is due: `blaise listen`, `status` and `login` print the command
for your install channel.

## Quick start

You need a Blaise workspace and admin rights to register runners.

1. In the dashboard, create a **Local** agent under **Settings → Agents**.
2. On the machine that should run sessions, sign in once (the browser opens, you approve):

   ```sh
   blaise login
   ```

3. In the directory the agent should work in, create a `blaise.yml`:

   ```yaml
   version: 1
   ```

4. Start listening:

   ```sh
   blaise listen
   ```

Blaise will start dispatching sessions to the machine. To prepare a checkout, install tools, or run
the agent somewhere else, add plugs to `blaise.yml`.

## Where to go next

- [Getting started](https://askblaise.com/docs/cli): sign in, configure and run a runner.
- [Install and update](https://askblaise.com/docs/cli/install): every install channel, pinning a
  version.
- [Runner and plugs](https://askblaise.com/docs/runner): prepare each session's environment.
- [Docker](https://askblaise.com/docs/cli/docker): run the agent in a container.

## About this tap

The formula, `Formula/blaise.rb`, is generated and committed by the release workflow of the Blaise
project on every release, from the same binaries published at
[BlaiseAgent/cli](https://github.com/BlaiseAgent/cli/releases). Please don't edit it by hand: the
next release replaces it. Releases are versioned by date, `YYYY.M.N`.
