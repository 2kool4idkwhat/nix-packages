{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule {
  pname = "aa-log";
  version = "latest";

  src = fetchFromGitHub {
    owner = "roddhjav";
    repo = "apparmor.d";

    rev = "24f629d326692965d2a17fe948f9500c04e5122b";
    hash = "sha256-CNobWPETWU7IffirsRyK+lJTj2ZNFB1nJLUAeG6v9oY=";
  };

  vendorHash = null;

  subPackages = [ "cmd/aa-log" ];

  ldflags = ["-s" "-w"];

  meta = with lib; {
    mainProgram = "aa-log";
  };
}

