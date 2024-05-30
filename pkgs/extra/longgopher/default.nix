{
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule {
  pname = "longgopher";
  version = "latest";

  src = fetchFromGitHub {
    owner = "sheepla";
    repo = "longgopher";

    rev = "3de282064557cc2ed913ecdc64bb43c4c33482b3";
    hash = "sha256-jKoYAiYmpWSLmwA/oen/9anFEK73spUfwH3NovsnUjQ=";
  };

  vendorHash = "sha256-nzPHx+c369T4h9KETqMurxZK3LsJAhwBaunkcWIW3Ps=";
}
