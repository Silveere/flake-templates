{
  inputs.templates.url = "github:NixOS/templates";
  outputs = { self, templates, ... }: let
    upstream = templates.outputs;
  in upstream // {
    templates = upstream.templates // {
      github-actions = {
        path = ./github-actions;
        description = "A basic devShell flake with GitHub Actions support";
      };
    };
  };
}
