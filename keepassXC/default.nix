{stdenv, fetchgit, cmake, gnumake, qt5, libgpgerror, libgcrypt, zlib}:

stdenv.mkDerivation rec {
  name = "keepassXC-${version}";
  version = "2.2.0";

  src = fetchgit  {
    url = "https://github.com/keepassxreboot/keepassxc.git";
    rev = "caa49a8ef3ee28ed478192389b21d61107b3b8e0";
    sha256  = "1n7lyd5gigdbqsy2ah9g08fz8gji1nn9zajdpn8bl75vd641x1rk";
  };

  buildInputs = [
    cmake
    gnumake
    qt5.full
    libgpgerror
    libgcrypt
    zlib
  ];
  preConfigure = ''
    cmakeFlags="$cmakeFlags -DCMAKE_TESTS=OFF"
  '';
  
  meta = {
    homepage = "https://keepassxc.org/";
    description = "KeePassXC is a community fork of KeePassX with the goal to extend and improve it with new features and bugfixes to provide a feature-rich, fully cross-platform and modern open-source password manager.";
  };
}

