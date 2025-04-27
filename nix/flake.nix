{
  description = "Rofi with Catppuccin theme";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    catppuccin.url = "github:catppuccin/nix";  # 🎨 Official Catppuccin flake
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }: {
    homeConfigurations = {
      # Replace 'your-username' with your username
      shagbaggins = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules = [
          # Include your Home Manager configuration here
          ./home.nix
          catppuccin.homeModules.rofi  # Enable Catppuccin theme for Rofi
        ];
      };
    };
  };
}
