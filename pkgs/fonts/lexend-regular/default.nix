{
  lib,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation {
  pname = "lexend-regular";
  version = "0.pre+date=2022-09-22";

  src = ./.;

  # I vendored the fonts since the fetchFromGithub tarball is ~60 MB
  # because of the `documentation/` folder
  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/

    cp -r variable/ $out/share/fonts/
    cp -r truetype/ $out/share/fonts/

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://www.lexend.com";
    description = "Variable font family designed to aid in reading proficiency";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
