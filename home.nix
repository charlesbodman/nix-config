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
    pkgs.fzf
    pkgs._1password-cli
    pkgs.google-cloud-sdk
    pkgs.kubectl
    pkgs.k3d
  ];

  # Basic Git configuration
  programs.git = {
    enable = true;
    settings = {
      core.editor = "vim";
      user.email = "cbodman@flashpoint-intel.com";
      user.name = "cbodman";
    };
  };

  # Shell aliases
  home.shellAliases = {
    gs = "git status";
    ll = "ls -l";
    nixswitch = "sudo darwin-rebuild switch --flake ~/.config/nix-config/.#cbodman-macbook";
    gcb = "git branch --sort=-committerdate | fzf | xargs -I {} git checkout {}";
  };

  # Enable zsh in home-manager to make aliases available
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
  };

  # Enable mise to manage tools
  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    globalConfig = {
      settings = {
        idiomatic_version_file = true;
        legacy_version_file = true;
        idiomatic_version_file_enable_tools = [ "node" ];
      };
    };
  };

  # Enable z navigation
  programs.z-lua = {
    enable = true;
    enableZshIntegration = true;
  };
  
  # Add per-user profile to PATH (needed when useUserPackages = true)
  home.sessionPath = [
    "/etc/profiles/per-user/cbodman/bin"
  ];

  programs.starship = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}