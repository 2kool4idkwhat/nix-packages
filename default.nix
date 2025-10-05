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

  html2markdown = callPackage ./pkgs/extra/html2markdown {};

  bibata = callPackage ./pkgs/extra/bibata {};

  aa-log = callPackage ./pkgs/extra/aa-log {};

  fedinspect = callPackage ./pkgs/extra/fedinspect {};

  kasasa = callPackage ./pkgs/extra/kasasa {};

  ### fonts ###
  comic-sans = callPackage ./pkgs/extra/comic-sans {};

  lexend-regular = callPackage ./pkgs/fonts/lexend-regular {};

  neko-sans = callPackage ./pkgs/fonts/neko-sans {};
}
