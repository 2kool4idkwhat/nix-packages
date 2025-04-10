{ xdg-utils, gtk4, makeDesktopItem, ... }:

makeDesktopItem {
  name = "openGtk4docs";
  desktopName = "GTK 4 Docs";
  exec = "${xdg-utils}/bin/xdg-open ${gtk4.devdoc}/share/doc/gtk4/index.html";
  icon = "${gtk4}/share/icons/hicolor/scalable/apps/org.gtk.Demo4.svg";
}
