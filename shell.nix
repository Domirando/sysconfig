pkgs: pkgs.stdenv.mkDerivation {
  name = "devShells";
  nativeBuildInputs = with pkgs; [
    git
    alejandra
  ]
}