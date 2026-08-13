{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # Netrw global variables
    globals = {
      netrw_banner = 0;        # Hide the large help banner at the top of Netrw
      netrw_liststyle = 3;     # Display directories in a clean tree view
      netrw_browse_split = 4;  # Open files in the main window split
      netrw_winsize = 25;      # Set tree sidebar width to 25% of the screen
    };

    # Keymaps
    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<CMD>Explore<CR>";
        options.desc = "Open Netrw file explorer";
      }
    ];
  };
}
