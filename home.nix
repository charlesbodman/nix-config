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
    settings.user.email = "cbodman@flashpoint-intel.com";
    settings.user.name = "cbodman";
  };

  # Shell aliases
  home.shellAliases = {
    gs = "git status";
    ll = "ls -l";
    nixswitch = "darwin-rebuild switch --flake ~/.config/nix-config/.#cbodman-macbook";
  };

  # Enable zsh in home-manager to make aliases available
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}