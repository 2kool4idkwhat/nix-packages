{
  lib,
  buildGoModule,
  fetchFromGitea,
}:
buildGoModule {
  pname = "landlock-auditer";
  version = "unstable-2025-03-28";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "Gusted";
    repo = "landlock-auditer";

    rev = "c12d72a1541f39c2aaedc87ceaac884690705b76";
    hash = "sha256-XdB+JeJRiVHKXv6oXr5iQZqttWVySFQk6U6HJzIo8Ww=";
  };

  vendorHash = "sha256-qy4wFPjUb3nxiujHUQ6LiKkmJ+EdLVngm9y+tnaJefU=";

  meta = {
    homepage = "https://codeberg.org/Gusted/landlock-auditer";
    mainProgram = "landlock-auditer";
  };
}

