{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShells.aarch64-darwin.default = nixpkgs.legacyPackages.aarch64-darwin.mkShell {
      name = "test-environment";
      buildInputs = with nixpkgs.legacyPackages.aarch64-darwin; [
        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            graphql.vscode-graphql
          ];
        })
        docker
        iterm2
        tree
      ];
    };
  };
}