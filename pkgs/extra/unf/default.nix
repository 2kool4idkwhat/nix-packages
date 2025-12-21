{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage {
  pname = "unf";
  version = "unstable-2023";

  src = fetchFromGitHub {
    owner = "io12";
    repo = "unf";

    rev = "ca2df47a9a2ac92cc441f402c35de5cfc7729e7b";
    hash = "sha256-pdv6d1BPKRHjv9qeoyEFPMOCDEgzKRJXLbiO0GVPfqE=";
  };

  cargoHash = "sha256-UtXqavWCQl03xX8GLlpigtWLGIXgPU1lezu8o0H3tpU=";

  meta = {
    mainProgram = "unf";
  };
}
