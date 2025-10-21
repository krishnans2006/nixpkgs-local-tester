{
  description = "Development environment for testing local packages in nixpkgs";

  inputs.nixpkgs.url = "git+file:///home/krishnan/Tech/Hobby/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          venvDir = ".venv";
          packages = with pkgs; [
            (python312.withPackages (
              ps: with ps; [
                chipwhisperer
              ]
            ))
          ];
        };
      });
    };
}