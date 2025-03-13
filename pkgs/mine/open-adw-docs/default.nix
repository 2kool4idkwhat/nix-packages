{ xdg-utils, libadwaita, makeDesktopItem, ... }:

makeDesktopItem {
  name = "openAdwDocs";
  desktopName = "Libadwaita Documentation";
  exec = "${xdg-utils}/bin/xdg-open ${libadwaita.devdoc}/share/doc/libadwaita-1/index.html";
  icon = "${libadwaita.devdoc}/share/icons/hicolor/scalable/apps/org.gnome.Adwaita1.Demo.svg";
}
