{ stdenv, buildPythonPackage, fetchPypi, pytest, mock, six, twisted }:

buildPythonPackage rec {
  pname = "txaio";
  version = "18.8.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1zmpdph6zddgrnkkcykh6qk5s46l7s5mzfqrh82m4b5iffn61qv7";
  };

  checkInputs = [ pytest mock ];

  propagatedBuildInputs = [ six twisted ];

  checkPhase = ''
    py.test -k "not test_sdist"
  '';

  meta = with stdenv.lib; {
    description = "Utilities to support code that runs unmodified on Twisted and asyncio.";
    homepage    = "https://github.com/crossbario/txaio";
    license     = licenses.mit;
    maintainers = with maintainers; [ nand0p ];
  };
}
