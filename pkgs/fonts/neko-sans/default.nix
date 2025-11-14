{
  lib,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation {
  pname = "neko-sans";
  version = "4.1";

  src = ./.;

  # TODO: find what broke the opentype-feature-freezer patching
  installPhase = ''
    runHook preInstall

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
