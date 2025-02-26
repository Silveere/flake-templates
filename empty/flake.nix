{
  description = "empty devShell template with Hello World";

  inputs = {
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} ({
      inputs,
      self,
      lib,
      ...
    }: {
      systems = import inputs.systems;

      imports = [
      ];

      perSystem = {
        inputs',
        self',
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            hello
          ];
        };
      };
    });
}
