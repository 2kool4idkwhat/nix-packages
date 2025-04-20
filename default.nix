{
  pkgs ? import <nixpkgs> {},
  ...
}: with pkgs; {
  ### my stuff ###
  fig = callPackage ./pkgs/mine/fig {};

  zig-cc = callPackage ./pkgs/mine/zig-cc {};

  undollar = callPackage ./pkgs/mine/undollar {};
  unpercent = callPackage ./pkgs/mine/unpercent {};

  open-gtk4-docs = callPackage ./pkgs/mine/open-gtk4-docs {};
  open-adw-docs = callPackage ./pkgs/mine/open-adw-docs {};
  open-nixpkgs-manual = callPackage ./pkgs/mine/open-nixpkgs-manual {};

  ### other people's stuff ###
  fontviewer = callPackage ./pkgs/extra/fontviewer {};

  longcpp = callPackage ./pkgs/extra/longcpp {};
  longgopher = callPackage ./pkgs/extra/longgopher {};

  chkbit = callPackage ./pkgs/extra/chkbit {};

  html2markdown = callPackage ./pkgs/extra/html2markdown {};

  landrun = callPackage ./pkgs/extra/landrun {};

  bibata = callPackage ./pkgs/extra/bibata {};

  ### fonts ###
  comic-sans = callPackage ./pkgs/extra/comic-sans {};

  lexend-regular = callPackage ./pkgs/fonts/lexend-regular {};

  inter-variable = callPackage ./pkgs/fonts/inter-variable {};

  neko-sans = callPackage ./pkgs/fonts/neko-sans {};
}
