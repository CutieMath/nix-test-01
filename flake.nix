{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.stdenv.mkDerivation {
      name = "test-environment";
      buildInputs = with nixpkgs.legacyPackages.aarch64-darwin; [
        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            graphql.vscode-graphql
          ];
        })
        docker
        iterm2
      ];
    };
  };
}
