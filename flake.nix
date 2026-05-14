{
  description = "Internally linked and externally customizable flake collection.";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs.follows = "nixpkgs-unstable";

    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    systems.url = "github:nix-systems/default";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "nix-darwin";
    };

    flake-aspects.url = "github:denful/flake-aspects";
    den.url = "github:denful/den";
    flake-file.url = "github:denful/flake-file";
    import-tree.url = "github:denful/import-tree";
    dendrix = {
      # TODO: to be renamed to DUR
      url = "github:denful/dendrix";
      inputs.import-tree.follows = "import-tree";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };

    flake-compat.url = "github:nixos/flake-compat";

    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
      inputs.gitignore.follows = "gitignore";
    };

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-index = {
      url = "github:nix-community/nix-index";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.rust-analyzer-src.follows = "rust-analyzer-src"; # unnecessary, does not affect flake inputs
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crane.url = "github:ipetkov/crane";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-init = {
      url = "github:nix-community/nix-init";
      inputs.flake-parts.follows = "flake-parts";
      inputs.treefmt-nix.follows = "treefmt-nix";
      inputs.fenix.follows = "fenix";
    };

    lib-aggregate = {
      url = "github:nix-community/lib-aggregate";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };

    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lib-aggregate.follows = "lib-aggregate";
      inputs.flake-compat.follows = "flake-compat";
    };

    flake-root.url = "github:srid/flake-root";

    vulnix = {
      url = "github:nix-community/vulnix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-root.follows = "flake-root";
      inputs.flake-parts.follows = "flake-parts";
      inputs.flake-compat.follows = "flake-compat";
      inputs.treefmt-nix.follows = "treefmt-nix";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pre-commit.follows = "git-hooks";
      inputs.crane.follows = "crane";
      inputs.rust-overlay.follows = "rust-overlay";
    };

    optnix = {
      url = "github:water-sucks/optnix";
      inputs.flake-compat.follows = "flake-compat";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cli = {
      url = "github:nix-community/nixos-cli";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
      inputs.flake-parts.follows = "flake-parts";
      inputs.optnix.follows = "optnix";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dank-material-shell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
      inputs.flake-compat.follows = "flake-compat";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dsearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.treefmt-nix.follows = "treefmt-nix";
    };

    noctalia-shell = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.git-hooks.follows = "git-hooks";
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
      inputs.systems.follows = "systems";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    preservation.url = "github:nix-community/preservation";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = _: { };
}
