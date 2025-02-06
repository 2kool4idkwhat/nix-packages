{
  stdenv,
  fetchFromGitHub,
  pkgs,
  lib,
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

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/applications
    cp fontviewer $out/bin
    cp ../data/fontviewer.desktop $out/share/applications
  '';

  patches = [
    ./desktop-file.patch
  ];

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

  meta = with lib; {
    homepage = "https://github.com/chocolateimage/fontviewer";
    description = "View and install fonts on a Linux system";
    platforms = platforms.linux;
  };
}
