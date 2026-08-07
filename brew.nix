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

    # Standard CLI tools (Formulas)
    brews = [
      "helm"
      "glab"
      "mkcert"
      "nss"
      "dtop"
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
      "tableplus"
      "rancher"
      "anki"
    ];
  };
}
