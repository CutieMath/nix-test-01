{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.stdenv.mkDerivation {
      name = "test-environment";
      buildInputs = with nixpkgs.legacyPackages.x86_64-darwin; [
        google-chrome
        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            hashicorp.terraform
          ];
        })
        docker
        cypress
        iterm2
        oh-my-zsh
        caffeine-ng
      ];
    };
  };
}
