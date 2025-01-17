# Based on the nixpkgs package. This version removes some things I don't like about frog

{ lib
, fetchFromGitHub
, python3Packages
, wrapGAppsHook4
, meson
, ninja
, pkg-config
, appstream-glib
, desktop-file-utils
, glib
, gobject-introspection
, blueprint-compiler
, libxml2
, libnotify
, libadwaita
, libportal
, gettext
, librsvg
, tesseract5
, zbar
, gst_all_1
}:

python3Packages.buildPythonApplication {
  pname = "gnome-frog";
  version = "1.5.2m";

  src = fetchFromGitHub {
    owner = "TenderOwl";
    repo = "Frog";
    rev = "c9d32b2bf1d340968e1dd0d23bc9072b3368da7d";
    sha256 = "sha256-ro8ZNq4SJLNfQeVbTvu9MaxIw9vW/OPWWmyGQJZg62Q=";
  };

  format = "other";

  patches = [
    ./update-compatible-with-non-flatpak-env.patch

    # This removes 1. telemetry 2. "star on github" button 3. "share to" button
    # I should probably refactor this patch
    ./frogmod.patch
  ];
  postPatch = ''
    chmod +x ./build-aux/meson/postinstall.py
    patchShebangs ./build-aux/meson/postinstall.py
    substituteInPlace ./build-aux/meson/postinstall.py \
      --replace "gtk-update-icon-cache" "gtk4-update-icon-cache"
    substituteInPlace ./frog/language_manager.py --subst-var out
  '';

  nativeBuildInputs = [
    appstream-glib
    desktop-file-utils
    gettext
    meson
    ninja
    pkg-config
    glib
    wrapGAppsHook4
    gobject-introspection
    blueprint-compiler
    libxml2
  ];

  buildInputs = [
    librsvg
    libnotify
    libadwaita
    libportal
    zbar
    tesseract5
    gst_all_1.gstreamer
  ];

  propagatedBuildInputs = with python3Packages; [
    loguru
    pygobject3
    python-dateutil
    pillow
    pytesseract
    pyzbar
    gtts
  ];

  # This is to prevent double-wrapping the package. We'll let
  # Python do it by adding certain arguments inside of the
  # wrapper instead.
  dontWrapGApps = true;
  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';

  meta = with lib; {
    description = "Intuitive text extraction tool (OCR) for GNOME desktop";
    license = licenses.mit;
    mainProgram = "frog";
    platforms = platforms.linux;
  };
}
