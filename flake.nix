{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    test = {
      url = "git+https://gist.github.com/lheckemann/d41381539e860b456d5595b67e0d60a2";
      flake = false;
    };
    test2 = {
      url = "git+https://gist.github.com/lheckemann/d41381539e860b456d5595b67e0d60a2";
    };
  };

  outputs = { self, nixpkgs, test, test2, ... }@inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    defaultPackage.x86_64-linux = import test2 { inherit (pkgs) path runCommandNoCC; };
  };
}
