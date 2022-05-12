{ mkDerivation
, lib
, fetchFromGitHub
, cmake
, extra-cmake-modules
, qtbase
, wrapQtAppsHook
, qttools
, kauth
, fio
}:

mkDerivation rec {
  pname = "kdiskmark";
  version = "2.3.0";

  src = fetchFromGitHub {
    owner = "JonMagon";
    repo = "KDiskMark";
    rev = "${version}";
    sha256 = "sha256-9ufRxEbqwcRs+m/YW8D3+1USCJNZEaOUZRec7gvgmtA=";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules wrapQtAppsHook ];

  buildInputs = [
    qttools
    kauth
    qtbase 
  ];

  qtWrapperArgs = [ ''--prefix PATH : ${lib.makeBinPath [ fio ]}'' ];

  meta = with lib; {
    description = "";
    homepage = "";
    license = licenses.gpl3Only;
    platforms = with platforms; linux;
  };
}
