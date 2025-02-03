{
  lib,
  stdenv,
  fetchurl,
  cabextract,
}:

let
  eula = fetchurl {
    url = "https://corefonts.sourceforge.net/eula.htm";
    hash = "sha256-LOgNEsM+dANEreP2LsFi+pAnBNDMFB9Pg+KJAahlC6s=";
  };
in
stdenv.mkDerivation {
  pname = "comic-sans";
  version = "1";

  exe = fetchurl {
    url = "mirror://sourceforge/corefonts/the%20fonts/final/comic32.exe";
    hash = "sha256-nG3z/u/eJtTkHUpP5dsqifkSOncllNf1mv0GJiXNIE4=";
  };

  nativeBuildInputs = [ cabextract ];

  buildCommand = ''
    cabextract --lowercase $exe

    # rename to more standard names
    mv comic.ttf     Comic_Sans_MS.ttf
    mv comicbd.ttf   Comic_Sans_MS_Bold.ttf

    install -m444 -Dt $out/share/fonts/truetype *.ttf

    # Also put the EULA there to be on the safe side.
    cp ${eula} $out/share/fonts/truetype/comic-sans-eula.html

    # Set up no-op font configs to override any aliases set up by other packages.
    mkdir -p $out/etc/fonts/conf.d
    for name in Comic-Sans-MS ; do
      substitute ${./no-op.conf} $out/etc/fonts/conf.d/30-''${name,,}.conf \
        --subst-var-by fontname "''${name//-/ }"
    done
  '';

  meta = with lib; {
    homepage = "https://corefonts.sourceforge.net/";
    description = "Microsoft's Comic Sans font";
    platforms = platforms.all;
    license = licenses.unfreeRedistributable;
    # Set a non-zero priority to allow easy overriding of the
    # fontconfig configuration files.
    priority = 5;
  };
}
