{
  description = "empty devShell template with Hello World";

  inputs = {
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
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
        (inputs.import-tree ./nix)
      ];

      systems = import inputs.systems;
    });
}
