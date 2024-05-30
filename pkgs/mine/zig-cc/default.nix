{stdenv}:
stdenv.mkDerivation {
  pname = "zig-cc";
  version = "latest";

  src = ./.;

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin

    install -Dm755 $src/zcc $src/zcxx $out/bin
  '';
}
