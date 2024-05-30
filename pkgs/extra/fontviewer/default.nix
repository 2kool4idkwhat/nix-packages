{
  stdenv,
  fetchFromGitHub,
  pkgs,
}:
stdenv.mkDerivation {
  pname = "fontviewer";
  version = "latest";

  src = fetchFromGitHub {
    owner = "chocolateimage";
    repo = "fontviewer";

    rev = "4e676837a75ec136062187877d475c563459c631";
    hash = "sha256-cG/zMIq3+k4TAmThuKVA5zu5wfis6LRqW75valXRbm4=";
  };

  mesonBuildType = "release";

  # TODO: install the .desktop file
  installPhase = ''
    mkdir -p $out/bin
    cp fontviewer $out/bin
  '';

  buildInputs = with pkgs; [
    fontconfig
    gtkmm3
  ];

  nativeBuildInputs = with pkgs; [
    meson
    ninja
    cmake
    pkg-config
  ];

  meta = {
    homepage = "https://github.com/chocolateimage/fontviewer";
  };
}
