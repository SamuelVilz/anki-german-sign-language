with import <nixpkgs> {};
with python3Packages;

let
  duden = buildPythonPackage rec {
    pname = "duden";
    version = "0.14.0";

    src = fetchPypi {
      inherit pname version;
      sha256 = "0sraxl0rp3ksysw0dw0ab8qmvv0xlj6yj6hbi333773pjfcc854p";
    };

    propagatedBuildInputs = [ beautifulsoup4 requests crayons pyxdg pyyaml ];
    doCheck = false;
  };
in

(python3.withPackages (pkgs: with pkgs; [
    ipykernel jupyterlab genanki duden])).env
