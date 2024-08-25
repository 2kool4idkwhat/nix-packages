{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "chkbit";
  version = "5.2.0";

  src = fetchFromGitHub {
    owner = "laktak";
    repo = "chkbit";
    rev = "v${version}";
    hash = "sha256-JFn3Fzv75fO6Jw97mEVJVhCIPWf7c0zwu6ygFdQFGAA=";
  };

  vendorHash = "sha256-zsiPtWrqu/NuMKfp0Sotfo40eqNUh3YdSF/qDLD6QQk=";

  ldflags = ["-s" "-w"];

  doCheck = false; # fails inside the nix sandbox

  meta = with lib; {
    description = "Check your files for data corruption";
    homepage = "https://github.com/laktak/chkbit";
    license = licenses.mit;
    mainProgram = "chkbit";
  };
}
