{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "landrun";
  version = "0.1.14";

  src = fetchFromGitHub {
    owner = "Zouuup";
    repo = "landrun";
    rev = "v${version}";
    hash = "sha256-6TWcsJpebfLnUTYflP2j0/Tuv4PdFx/sMATc4Km1AIE=";
  };

  vendorHash = "sha256-Bs5b5w0mQj1MyT2ctJ7V38Dy60moB36+T8TFH38FA08=";

  ldflags = [ "-s" "-w" ];

  meta = {
    description = "Run any Linux process in a secure, unprivileged sandbox using Landlock. Think firejail, but lightweight, user-friendly, and baked into the kernel";
    homepage = "https://github.com/Zouuup/landrun";
    license = lib.licenses.mit;
    mainProgram = "landrun";
  };
}
