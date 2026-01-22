{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; # This will make Nix the source of truth
    
    # Standard CLI tools (Formulas)
    brews = [
      "kubectl"
      "k3d"
    ];

    # GUI Applications (Casks)
    casks = [
      "ghostty"
      "google-chrome"
      "cursor"
      "docker-desktop"
      "1password"
    ];
  };
}
