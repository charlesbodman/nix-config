{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    
    taps = [
      "amir20/homebrew-dtop"
    ];

    # Standard CLI tools (Formulas)
    brews = [
      "glab"
      "mkcert"
      "nss"
    ];

    # GUI Applications (Casks)
    casks = [
      "ghostty"
      "google-chrome"
      "cursor"
      "docker-desktop"
      "1password"
      "obsidian"
      "dtop"
      "tableplus"
    ];
  };
}
