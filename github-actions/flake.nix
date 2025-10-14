{
  description = "devShell flake with GitHub Actions workflow";

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
      imports = [
        ./nix/devshell.nix
      ];

      systems = import inputs.systems;
    });
}
