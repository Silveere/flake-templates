{
  inputs,
  self,
  lib,
  ...
}: {
  perSystem = {
    system,
    inputs',
    self',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        rust-bin.stable.latest.default
      ];
    };
  };
}
