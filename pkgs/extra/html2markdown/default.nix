{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "html2markdown";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "JohannesKaufmann";
    repo = "html-to-markdown";
    rev = "v${version}";
    hash = "sha256-sDUhEUCQsts4co8xuItEZeO+TlEp2iGqaqHC6hnMH9o=";
  };

  postInstall = ''
    mv $out/bin/cli $out/bin/html2markdown
  '';

  vendorHash = "sha256-ECT3CDqZvf7GKf4twic76KoZ/+g11fYaWLURZs65qRI=";

  ldflags = ["-s" "-w"];

  meta = with lib; {
    description = "Convert HTML to Markdown. Even works with entire websites and can be extended through rules";
    homepage = "https://github.com/JohannesKaufmann/html-to-markdown";
    license = licenses.mit;
    mainProgram = "html2markdown";
  };
}
