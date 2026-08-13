{ pkgs, ... }:

{
  imports = [
    ./nvim.nix
  ];

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
    pkgs.k9s
    pkgs.gh
    pkgs.antigravity-cli
    pkgs.sops
    pkgs.azure-cli
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
    vim = "nvim";
    nixswitch = "sudo darwin-rebuild switch --flake ~/.config/nix-config/.#cbodman-macbook";
    gcb = "git branch --sort=-committerdate | fzf | xargs -I {} git checkout {}";
    gcrb = "git branch -r --sort=-committerdate | grep -v 'HEAD ->' | sed 's/^[[:space:]]*origin\\///' | fzf | xargs -I {} git checkout {}";
    gwip = "git add . && git commit -m 'WIP'";
    k = "kubectl";
  };

    # Enable zsh in home-manager to make aliases available
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      initContent = ''
        # Add Homebrew to PATH
        if [[ -d /opt/homebrew/bin ]]; then
          export PATH="/opt/homebrew/bin:$PATH"
        fi
      '';
    };

  # Enable mise to manage tools
  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    globalConfig = {
      tools = {
        uv = "0.11.20";
        node = "26.3.0";
        "npm:@devcontainers/cli" = "0.87.0";
        "npm:@fission-ai/openspec" = "1.4.1";
        "npm:pnpm" = "11.8.0";
      };
      settings = {
        idiomatic_version_file = true;
        legacy_version_file = true;
        idiomatic_version_file_enable_tools = [ "node" "uv" ];
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
    # Rancher Desktop CLI tools (docker, kubectl, nerdctl, helm, etc.)
    "/Users/cbodman/.rd/bin"
    # Cursor IDE command line tool (`cursor` open-in-editor)
    "/Applications/Cursor.app/Contents/Resources/app/bin"
    # Cursor Agent CLI (`agent` / `cursor-agent`); installed outside Nix to ~/.local/bin
    "/Users/cbodman/.local/bin"
  ];

  # Point Docker clients at the Rancher Desktop socket. RD doesn't create the
  # /var/run/docker.sock symlink without admin access, so tools like dtop and
  # the docker CLI need DOCKER_HOST to find the engine.
  home.sessionVariables = {
    DOCKER_HOST = "unix:///Users/cbodman/.rd/docker.sock";
  };

  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1000;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
