# Flake Collect

## Introduction

Creating the same flake inputs and outputs over and over and over again can become
tiresome and annoying. It would be nice to configure the inputs only once and then
reference them later on in any future flakes.

`flake-collect` is just that, a collection of flake inputs configured to work together. Overall, it does a few simple things:

- Act as a single source of flake inputs.
- Make input urls and subinputs unnecessary, reducing boilerplate.
- Reduce the need for identical inputs in different flakes.

## Usage

To access this power, all you need to do is put

```nix
  inputs = {
    flake-collect.url = "github:ashomalous/flake-collect";

    # to access other flakes under flake-collect
    nixpkgs.follows = "flake-collect/nixpkgs";
    # ...
  }
```

Flakes under `flake-collect` are not static. Due to how nix flakes work, they can be
configured by the end user in the form of editing the follow path.

```nix
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    flake-collect = {
      url = "...";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # example package to use other nixpkgs, say the unstable branch
    lanzaboote = {
      url = "..."
      inputs.nixpkgs.follows = "flake-collect/nixpkgs-unstable";
    };
  }
```

A common difference between various flakes is the choice between stable or unstable
nixpkgs. `flake-collect` is not opinionated on this. Both channels are built in, and
the unstable branch is merely chosen by default. It is trivial to change that.

```nix
  inputs.nixpkgs.follows = "flake-collect/nixpkgs-stable"; # explicitly follow `flake-collect`'s stable branch
  inputs.nixpkgs.follows = "flake-collect/nixpkgs-unstable"; # explicitly follow `flake-collect`'s unstable branch
```

Let's call this method aliasing. This has no overhead as `nixpkgs` is already set as
an alias in default `flake-collect`.

## Contribution

To contribute to this small project, feel free to [open an issue](https://github.com/ashomalous/flake-collect/issues/new).

