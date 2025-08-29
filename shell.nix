pkgs: pkgs.stdenv.mkDerivation {
  name = "sysDevShells";
  nativeBuildInputs = with pkgs; [
    git
    alejandra
    ed
  ];
  
  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}
