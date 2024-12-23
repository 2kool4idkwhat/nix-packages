{
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule {
  pname = "fig";
  version = "latest";

  src = fetchFromGitHub {
    owner = "2kool4idkwhat";
    repo = "fig";

    rev = "3a5b5b6dc15f33d8363ea6e14652a846209039a3";
    hash = "sha256-Q1xsoPbPoGxyTSSF7KVrIk3H8dFRpoaYlxCGZOXp5Wg=";
  };

  vendorHash = null;

  ldflags = ["-s" "-w"];

}
