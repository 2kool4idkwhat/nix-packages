{
  stdenv,
  fetchFromGitHub,
  bin-name ? "longcpp",
}:
stdenv.mkDerivation {
  name = "longcpp";
  version = "latest";

  src = fetchFromGitHub {
    owner = "ma-tw";
    repo = "longcpp";

    rev = "995ef261d94b69304d9371f204b67a4e5ba3ea2c";
    hash = "sha256-ZMk/XUYng9u7QQsg5sCwLv9EtkVa2CelbqiDujXsW+E=";
  };

  buildPhase = ''
    g++ main.cpp -o ${bin-name}
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ${bin-name} $out/bin
  '';
}
