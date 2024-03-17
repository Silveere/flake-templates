{
  inputs.templates.url = "github:NixOS/templates";
  outputs = { self, templates, ... }: let
    upstream = templates.outputs;
  in upstream // {
    templates = upstream.templates // {
    };
  };
}
