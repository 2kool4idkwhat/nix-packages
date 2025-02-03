{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation rec {
  pname = "lexend-regular";
  version = "0.pre+date=2022-09-22";

  src = fetchFromGitHub {
    owner = "googlefonts";
    repo = pname;
    rev = "cd26b9c2538d758138c20c3d2f10362ed613854b";
    sha256 = "ZKogntyJ/44GBZmFwbtw5Ujw5Gnvv0tVB59ciKqR4c8=";
  };

  installPhase = ''
    runHook preInstall

    cd fonts/lexend
    mkdir -p $out/share/fonts/truetype/lexend/

    cp -r variable/ $out/share/fonts/
    cp ttf/* $out/share/fonts/truetype/lexend/

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://www.lexend.com";
    description = "Variable font family designed to aid in reading proficiency";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
