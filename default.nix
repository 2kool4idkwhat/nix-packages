{
  pkgs ? import <nixpkgs> {},
  ...
}: with pkgs; {
  ### my stuff ###
  fig = callPackage ./pkgs/mine/fig {};

  zig-cc = callPackage ./pkgs/mine/zig-cc {};

  undollar = callPackage ./pkgs/mine/undollar {};
  unpercent = callPackage ./pkgs/mine/unpercent {};

  ### other people's stuff ###
  fontviewer = callPackage ./pkgs/extra/fontviewer {};

  longcpp = callPackage ./pkgs/extra/longcpp {};
  longgopher = callPackage ./pkgs/extra/longgopher {};

  chkbit = callPackage ./pkgs/extra/chkbit {};

  gnome-frog = callPackage ./pkgs/extra/gnome-frog {};

  html2markdown = callPackage ./pkgs/extra/html2markdown {};

  ### fonts ###
  adwaita-fonts = callPackage ./pkgs/extra/adwaita-fonts {};

  comic-sans = callPackage ./pkgs/extra/comic-sans {};

  lexend-regular = callPackage ./pkgs/fonts/lexend-regular {};

  inter-variable = callPackage ./pkgs/fonts/inter-variable {};

  neko-sans = callPackage ./pkgs/fonts/neko-sans {};
}
