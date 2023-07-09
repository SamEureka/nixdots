{
  config,
  pkgs,
  lib,
  ...
}: {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "macOS-BigSur";
      package = pkgs.apple-cursor;
      size = 32; # Affects gtk applications as the name suggests
    };

    theme = {
      name = "whitesur-gtk-theme";
      package = pkgs.whitesur-gtk-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # theme = {
    #   name = "whitesur-gtk-theme";
    #   package = pkgs.whitesur-gtk-theme;
    # };
    #
    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-folders;
    # };

    # iconTheme = {
    #   name = "WhiteSur";
    #   package = pkgs.whitesur-icon-theme;
    # };

    # theme = {
    #   name = "Catppuccin-Mocha-Compact-Blue-Dark";
    #   package = pkgs.catppuccin-gtk.override {
    #     size = "compact";
    #     accents = ["blue"];
    #     variant = "mocha";
    #   };
    # };
  };
}
