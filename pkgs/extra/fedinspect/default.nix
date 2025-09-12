{
  lib,
  appstream,
  desktop-file-utils,
  fetchFromGitea,
  glib,
  gobject-introspection,
  gtk4,
  libadwaita,
  meson,
  ninja,
  pkg-config,
  python3Packages,
  wrapGAppsHook4,
}:

python3Packages.buildPythonApplication rec {
  pname = "fedinspect";
  version = "1.2.2";
  pyproject = false;

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "andypiper";
    repo = "fedinspect-gtk";

    rev = "v${version}";
    hash = "sha256-6WairIqGZQeLXjk//r9eFpq0o7Pme1+8Pk79lN7LWbw=";
  };

  strictDeps = true;

  nativeBuildInputs = [
    appstream
    desktop-file-utils # for `desktop-file-validate`
    glib # for `glib-compile-schemas`
    gobject-introspection
    gtk4 # for `gtk-update-icon-cache`
    meson
    ninja
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [ libadwaita ];

  dependencies = with python3Packages; [
    pygobject3
    requests
    jsonschema
  ];

  meta = {
    description = "Inspect fediverse server configurations and features";
    mainProgram = "fedinspect-gtk";
    platforms = lib.platforms.linux;
  };
}
