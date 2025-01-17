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

  ugm = callPackage ./pkgs/extra/ugm {};

  chkbit = callPackage ./pkgs/extra/chkbit {};

  choose-something = callPackage ./pkgs/extra/choose {};

  gnome-frog = callPackage ./pkgs/extra/gnome-frog {};

  html2markdown = callPackage ./pkgs/extra/html2markdown {};
}
