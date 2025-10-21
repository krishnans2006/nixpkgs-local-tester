# Nixpkgs Local Tester

A simple flake.nix that allows for testing packages from a local clone of [nixpkgs](https://github.com/NixOS/nixpkgs).

I made this because it felt like the easiest way to test a package - I didn't want to rebuild my system every time, and using `nix-build` (and `nix-env`, etc.) got a bit tedious.

Instructions:
- Edit `inputs.nixpkgs.url` to point to local nixpkgs clone
- Edit `devShells.default` to include packages for testing
- Run `nix develop` (or `devf` alias to use direnv)
