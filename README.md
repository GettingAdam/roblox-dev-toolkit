# Roblox Dev Toolkit

A collection of reusable Roblox development utilities and systems written in Luau.

The goal of Roblox Dev Toolkit is to provide simple, focused modules that Roblox developers can reuse across different experiences without unnecessary dependencies.

## Features

### Utilities

- **Cooldown** — Manage timed gameplay actions.
- **FormatNumber** — Format large numbers using K, M, and B notation.
- **Maid** — Track and clean up connections, instances, functions, and cleanup objects.
- **RateLimiter** — Limit requests within a configurable time window.
- **Signal** — Lightweight custom event system.
- **TableUtils** — Common table operations such as cloning, searching, and checking values.

### Services

- **DataStore** — Simple DataStore wrapper with retries and `UpdateAsync` support.

## Installation

### Rojo

Clone the repository and build the project with Rojo:

```bash
rojo build default.project.json --output RobloxDevToolkit.rbxl
