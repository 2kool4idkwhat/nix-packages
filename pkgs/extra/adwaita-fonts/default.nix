{
  lib,
  stdenv,
  fetchFromGitLab,
  pkg-config,
  meson,
  ninja,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "adwaita-fonts";
  version = "48.2";

  src = fetchFromGitLab {
    domain = "gitlab.gnome.org";
    owner = "GNOME";
    repo = "adwaita-fonts";
    rev = "${finalAttrs.version}";
    hash = "sha256-rXr4U5k0MUz766F5kVssZfM6Ra/hQOe/HLpGss2aZuo=";
  };

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
  ];

  meta = {
    description = "Adwaita Sans, a variation of Inter, and Adwaita Mono, Iosevka customized to match Inter.";
    homepage = "https://gitlab.gnome.org/GNOME/adwaita-fonts";
    license = lib.licenses.gpl3Plus;
    platforms = lib.platforms.linux;
  };
})
