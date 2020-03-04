nix: subpath:
  self: super: {
  winter = super.callPackage generated/winter.nix {};
  ic-ref = super.callPackage generated/ic-ref.nix {};

  # Only the test suite of crc is broken
  # https://github.com/MichaelXavier/crc/issues/2
  crc = nix.haskell.lib.markUnbroken (nix.haskell.lib.dontCheck super.crc);
}