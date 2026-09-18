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

    rev = "db155f021899aacee3b7c246bfa8a17f1f066d29";
    hash = "sha256-ZDXiMyGXm82e4eleYxIGz1mN7Smx0O6Djl2QHfN3yy8=";
  };

  vendorHash = "sha256-aGqnmqCnp3uhbO93P2iFU5BEQMZAFnWfnwpGUM9pF/0=";

  subPackages = [ "cmd/aa-log" ];

  ldflags = ["-s" "-w"];

  meta = with lib; {
    mainProgram = "aa-log";
  };
}

