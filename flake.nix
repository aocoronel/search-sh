{
  description = "A flake to run Leta Searcher with Python dependencies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      pythonWithPackages = pkgs.python3.withPackages (ps: [
        ps.requests
        ps.beautifulsoup4
      ]);
      search = pkgs.stdenv.mkDerivation {
        name = "search";
        src = ./src;
        nativeBuildInputs = [
          pkgs.fzf
          pkgs.makeWrapper
          pkgs.rofi
          pythonWithPackages
        ];
        installPhase = ''
          mkdir -p $out/bin
          cp search $out/bin/search
          cp leta-searcher.py $out/bin/leta-searcher.py
          chmod +x $out/bin/search $out/bin/leta-searcher.py
          wrapProgram "$out/bin/search" \
            --prefix PATH : "${pkgs.lib.makeBinPath [pythonWithPackages pkgs.fzf pkgs.rofi]}"
        '';
        meta = {
          description = "Leta Searcher (CLI)";
          homepage = "https://github.com/aocoronel/search-sh";
          license = pkgs.lib.licenses.mit;
        };
      };
    in {
      packages.default = search;
      apps.default = {
        type = "app";
        program = "${search}/bin/search";
      };
    });
}
