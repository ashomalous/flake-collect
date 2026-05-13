# Flake Collect

## Introduction

Creating the same flake inputs and outputs over and over and over again can become
tiresome and annoying. It would be nice to configure the inputs only once and then
reference them later on in any future flakes.

`flake-collect` is just that, a collection of flake inputs configured to work together. Overall, it does a few simple things:

- Act as a single source of flake inputs.
- Make `inputs.[...].follows` unnecessary, reducing boilerplate.
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

## Contribution

To contribute to this small project, feel free to [open an issue](https://github.com/ashomalous/flake-collect/issues/new).
