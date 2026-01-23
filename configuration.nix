{ pkgs, ... }:

{
  imports = [
    ./brew.nix
  ];
  
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ 
    pkgs.vim
    pkgs.git
    # pkgs.fzf
  ];

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = false;

  nix.settings.experimental-features = "nix-command flakes";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; 

  # Set Git commit hash for darwin-help.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild edit --help
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # User configuration
  users.users.cbodman = {
    home = "/Users/cbodman";
  };

  # Set primary user for system defaults
  system.primaryUser = "cbodman";

  # Set Nix build user and group IDs
  ids.gids.nixbld = 350;

  # macOS System Defaults
  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    finder.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
  };

  # Keyboard remapping: Swap Ctrl and Caps Lock
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
    userKeyMapping = [
      {
        HIDKeyboardModifierMappingSrc = 30064771296;  # Left Control
        HIDKeyboardModifierMappingDst = 30064771300;  # Caps Lock
      }
    ];
  };

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];
}