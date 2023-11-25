{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShells.x86_64-darwin.default = nixpkgs.legacyPackages.x86_64-darwin.mkShell {
      name = "test-environment";
      buildInputs = with nixpkgs.legacyPackages.x86_64-darwin; [
        google-chrome
        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            graphql.vscode-graphql
          ];
        })
        docker
        cypress
        iterm2
      ];
    };
  };
}