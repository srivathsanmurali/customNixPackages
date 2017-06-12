{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
in
rec {
  llvmOpenMP = import ./llvmOpenMP {
    inherit (pkgs) clangStdenv fetchgit cmake gnumake perl;
  };
}
