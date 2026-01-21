{ pkgs, ... }:

{
  home.username = "cbodman";
  home.homeDirectory = "/Users/cbodman";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "23.11";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.ripgrep
    pkgs.fd
    pkgs.htop
  ];

  # Basic Git configuration
  programs.git = {
    enable = true;
    userName = "cbodman";
    userEmail = "cbodman@flashpoint-intel.com";
  };

  # Shell aliases
  home.shellAliases = {
    gs = "git status";
    ll = "ls -l";
    nixswitch = "darwin-rebuild switch --flake ~/.config/nix-config/.#cbodman-macbook";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}