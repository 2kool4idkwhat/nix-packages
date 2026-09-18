{
  pkgs ? import <nixpkgs> {},
  ...
}: with pkgs; {
  ### my stuff ###
  zig-cc = callPackage ./pkgs/mine/zig-cc {};

  undollar = callPackage ./pkgs/mine/undollar {};
  unpercent = callPackage ./pkgs/mine/unpercent {};

  ### other people's stuff ###
  fontviewer = callPackage ./pkgs/extra/fontviewer {};

  html2markdown = callPackage ./pkgs/extra/html2markdown {};

  bibata = callPackage ./pkgs/extra/bibata {};

  aa-log = callPackage ./pkgs/extra/aa-log {};

  fedinspect = callPackage ./pkgs/extra/fedinspect {};

  hakoniwa = callPackage ./pkgs/extra/hakoniwa {};

  unf = callPackage ./pkgs/extra/unf {};

  ### fonts ###
  lexend-regular = callPackage ./pkgs/fonts/lexend-regular {};

  neko-sans = callPackage ./pkgs/fonts/neko-sans {};
}
