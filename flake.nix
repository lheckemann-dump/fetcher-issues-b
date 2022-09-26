{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    test1 = {
      url = "git+https://github.com/lheckemann/test";
      flake = false;
    };
    test2 = {
      url = "git+https://github.com/lheckemann/test";
    };
    test3 = {
      url = "github:lheckemann/test";
    };
    test4 = {
      url = "github:lheckemann/test";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux = nixpkgs.lib.mapAttrs (name: value: import value { inherit (pkgs) path runCommandNoCC; }) inputs;
  };
}
