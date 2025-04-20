{pkgs, ...}:

pkgs.makeDesktopItem {
  name = "nixpkgsManual";
  desktopName = "Nixpkgs Manual";
  exec = "${pkgs.xdg-utils}/bin/xdg-open ${pkgs.nixpkgs-manual}/share/doc/nixpkgs/manual.html";
  icon = "nix-snowflake";
}
