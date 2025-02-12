{
  lib,
  rustPlatform,
  fetchCrate,
}:
rustPlatform.buildRustPackage rec {
  pname = "loco-cli";
  version = "0.2.9";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-AhL+k5XEf8m1pyOECTlPwALUG/ELJeACfV2kulxlzaA=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-TwsnEkD6SVgyvtJHgG0Da+6K/bbDwnM8b4CMhba+ej8=";

  #Skip trycmd integration tests
  checkFlags = [ "--skip=cli_tests" ];

  meta = {
    description = "Loco CLI is a powerful command-line tool designed to streamline the process of generating Loco websites";
    homepage = "https://loco.rs";
    changelog = "https://github.com/loco-rs/loco/blob/master/CHANGELOG.md";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ sebrut ];
    mainProgram = "loco";
  };
}
