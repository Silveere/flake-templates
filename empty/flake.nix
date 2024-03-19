{
  description = "empty devShell template with Hello World";

  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }: let
    inherit (nixpkgs) lib;
    eachSystem = lib.genAttrs (import systems);

  in {
    devShells = eachSystem (system: let
      pkgs = import nixpkgs { inherit system; };

    in {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          hello
        ];
      };
    });
  };
}
