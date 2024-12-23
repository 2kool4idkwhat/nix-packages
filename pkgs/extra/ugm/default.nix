{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "ugm";
  version = "1.4.0";

  src = fetchFromGitHub {
    owner = "ariasmn";
    repo = "ugm";

    rev = "v${version}";
    hash = "sha256-Co8JN0WEc1I08My9m7iyAshtEO4aszN8/sCvoGFJv2A=";
  };

  vendorHash = "sha256-34D9fQnmKnOyUqshduLmFiVgcVKi7mDKBs3X5ZQxsuw=";

  ldflags = ["-s" "-w"];

  meta = with lib; {
    description = "A terminal based UNIX user and group browser";
    homepage = "https://github.com/ariasmn/ugm";
    license = licenses.mit;
    mainProgram = "ugm";
  };
}
