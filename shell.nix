let
  pkgs = import ~/Tech/Hobby/nixpkgs { config.allowUnfree = true; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    (python312.withPackages (ps: with ps; [
      chipwhisperer
    ]))
  ];
}
