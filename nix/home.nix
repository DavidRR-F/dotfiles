{ config, pkgs, catppuccin, ... }:

{
  # Install Rofi
  home.packages = [
    pkgs.rofi
  ];

  # Configure Rofi with Catppuccin theme
  programs.rofi = {
    enable = true;
    theme = catppuccin.rofi;  # Apply Catppuccin theme for Rofi
  };

  # Optionally, if you want to enable other Catppuccin-related modules:
  # programs.starship = {
  #   enable = true;
  #   settings = catppuccin.starship;
  # };
}
