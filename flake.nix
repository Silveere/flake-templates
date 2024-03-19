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
      rust = {
        path = ./rust;
        description = "A basic devShell flake with Rust installed via oxalica/rust-overlay";
      };
      empty = {
        path = ./empty;
        description = "An empty devShell template with Hello World";
      };
    };
  };
}
