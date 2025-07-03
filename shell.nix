pkgs: pkgs.stdenv.mkDerivation {
  name = "sysDevShells";
  nativeBuildInputs = with pkgs; [
    git
    alejandra
  ];
  
  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}