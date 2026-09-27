# Roblox Dev Toolkit

A collection of reusable Roblox development utilities written in Luau.

The goal of this project is to provide simple, well-documented modules that Roblox developers can reuse in their own games.

## Features

### Utilities

* **FormatNumber** — Formats large numbers using K, M, and B notation.
* **Cooldown** — Simple reusable cooldown system for gameplay actions.

## Installation

Copy the required module into your Roblox Studio project and require it from your script.

Example:

```lua
local FormatNumber = require(path.to.FormatNumber)

print(FormatNumber.format(1500))
-- 1.5K
```

## Project Structure

```text
src/
├── Utilities/
│   ├── FormatNumber.luau
│   └── Cooldown.luau
└── README.md
```

## Development

This project is actively being developed. More reusable Roblox systems will be added over time.

Contributions, bug reports, and suggestions are welcome.

## License

MIT License
