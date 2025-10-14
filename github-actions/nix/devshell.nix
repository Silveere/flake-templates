{
  inputs,
  self,
  lib,
  ...
}: {
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
}
