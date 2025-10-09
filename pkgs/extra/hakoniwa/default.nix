{
  fetchFromGitHub,
  rustPlatform,
  libseccomp
}:

rustPlatform.buildRustPackage (finalAttrs: {
  name = "hakoniwa";

  src = fetchFromGitHub {
    owner = "souk4711";
    repo = "hakoniwa";

    rev = "v1.2.2";
    hash = "sha256-MJxMOvWibGrRekN8TpPZ9J7U+Lp5DCCjH2De8VXnqJE=";
  };

  cargoHash = "sha256-W/xcNGXutEyqLvYMJxfZPBlOcaRgGeppxfJ7GFPXaE4=";

  buildInputs = [
    libseccomp
  ];

  # a test relies on /bin/sleep
  # TODO: only disable that broken test
  doCheck = false;

  meta = {
    homepage = "https://github.com/souk4711/hakoniwa";
  };
})
