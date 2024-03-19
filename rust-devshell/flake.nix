{
  description = "empty devShell template with Hello World";

  inputs = {
    systems.url = "github:nix-systems/default";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, systems, rust-overlay }: let
    inherit (nixpkgs) lib;
    eachSystem = lib.genAttrs (import systems);

  in {
    devShells = eachSystem (system: let
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs {
        inherit system overlays;
        };

    in {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          rust-bin.stable.latest.default
        ];
      };
    });
  };
}
