{
  stdenv,
  lib,
  fetchFromGitHub,
  wrapGAppsHook4,
  pkgs,
}:

stdenv.mkDerivation rec {
  pname = "kasasa";
  version = "1.1.4";

  src = fetchFromGitHub {
    owner = "KelvinNovais";
    repo = "Kasasa";

    rev = "v${version}";
    hash = "sha256-y5Ml5kHKk5f1RcRKdvS/9JO0dIWpotU1qtjjmpDJ1f4=";
  };

  mesonBuildType = "release";

  nativeBuildInputs = with pkgs; [
    appstream
    desktop-file-utils # for `desktop-file-validate`
    glib # for `glib-compile-schemas`
    gobject-introspection
    gtk4 # for `gtk-update-icon-cache`
    libportal
    libadwaita
    meson
    ninja
    pkg-config
    wrapGAppsHook4
  ];

  meta = with lib; {
    homepage = "https://github.com/KelvinNovais/Kasasa";
    platforms = platforms.linux;
  };
}
