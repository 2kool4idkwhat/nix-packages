{
  lib,
  stdenvNoCC,
  fetchzip,
  python3Packages,
}:

stdenvNoCC.mkDerivation rec {
  pname = "neko-sans";
  version = "4.1";

  src = fetchzip {
    url = "https://github.com/rsms/inter/releases/download/v${version}/Inter-${version}.zip";
    stripRoot = false;
    hash = "sha256-5vdKKvHAeZi6igrfpbOdhZlDX2/5+UvzlnCQV6DdqoQ=";
  };

  nativeBuildInputs = [
    python3Packages.opentype-feature-freezer
  ];

  installPhase = ''
    runHook preInstall

    pyftfeatfreeze --features "ss04" --replacenames "Inter Variable/Neko Sans" \
      "InterVariable.ttf" "NekoSans-Regular.ttf"
    pyftfeatfreeze --features "ss04" --replacenames "Inter Variable/Neko Sans" \
      "InterVariable-Italic.ttf" "NekoSans-Italic.ttf"

    pyftfeatfreeze --features "ss02" --replacenames "Inter Variable/Neko Slashed" \
      "InterVariable.ttf" "NekoSlashed-Regular.ttf"
    pyftfeatfreeze --features "ss02" --replacenames "Inter Variable/Neko Slashed" \
      "InterVariable-Italic.ttf" "NekoSlashed-Italic.ttf"

    mkdir -p $out/share/fonts/
    cp Neko* $out/share/fonts/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Customized version of Inter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
