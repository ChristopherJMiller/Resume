{
  description = "Christopher Miller's Resume (chrismiller.xyz)";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux"; # Or your desired system
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      defaultPackage.${system} = pkgs.stdenv.mkDerivation {
        name = "resume";
        src = ./.; # Copies all files in the current directory

        buildInputs = [
          pkgs.texlive.combined.scheme-full
        ];

        buildPhase = ''
          xelatex resume.tex
        '';

        installPhase = ''
          mkdir -p $out/
          cp resume.pdf $out/
        '';
      };
    };
} 