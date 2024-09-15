{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "choose";
  version = "unstable-2024-04-20";

  src = fetchFromGitHub {
    owner = "alterae";
    repo = "choose";
    rev = "4430e5e3a3de8fa79489aa61b17babd157c8d8f5";
    hash = "sha256-yV+XV759d67eQz+DN6HufKvMd/eDvfbC+fewpKEobaE=";
  };

  cargoHash = "sha256-oFJhD16LrGWLi5Gjv8JsobDEVowRtyMiZFh9jW7Jq/Y=";

  meta = with lib; {
    description = "A command-line tool for picking things randomly";
    homepage = "https://github.com/alterae/choose";
    license = licenses.mit;
    mainProgram = "choose";
  };
}
