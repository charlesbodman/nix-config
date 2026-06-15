{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
      extraFlags = [ "--force" ];
    };
    
    taps = [
      "amir20/homebrew-dtop"
    ];

    # Standard CLI tools (Formulas)
    brews = [
      "helm"
      "glab"
      "mkcert"
      "nss"
      "tokei"
      "git-cliff"
    ];

    # GUI Applications (Casks)
    casks = [
      "ghostty"
      "google-chrome"
      "cursor"
      "1password"
      "obsidian"
      "dtop"
      "tableplus"
      "rancher"
    ];
  };
}
