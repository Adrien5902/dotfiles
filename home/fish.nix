{ hostname, ... }: {
  programs.fish = {
    enable = true;

    shellAliases = {
      we = "thunar . >/dev/null 2>&1 & disown";
      rl = "source ~/.config/fish/config.fish";

      ls = "eza";
      du = "dust";
      cat = "bat";
      n = "nvim .";
      c = "code .";
      wlc = "wl-copy";
      suuu = "sudo -Es fish";
      nixd = "nix develop --command fish";
      nixb = "sudo nixos-rebuild switch --flake /etc/nixos#${hostname}";
      nixe = "cd /etc/nixos; $EDITOR .; sudo git add .; sudo git commit -m 'Edit : $(date)'; nixb";
    };

    shellInit = ''
      set -gx GITHUB_USERNAME Adrien5902
      set -gx EDITOR nvim
    '';

    functions = {
      # Optional: add your own fish functions here
    };

    interactiveShellInit = ''
      zoxide init fish | source
      starship init fish | source
      set fish_greeting
    '';
  };

}
