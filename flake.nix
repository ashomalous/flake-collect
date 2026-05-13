{
  description = "Internally linked and externally customizable flake collection.";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs.follows = "nixpkgs-unstable";

    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    systems.url = "github:nix-systems/default";

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
  };

  outputs = _: { };
}
