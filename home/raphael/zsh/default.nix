{
  pkgs,
  inputs,
  ...
}:
{
  programs.zsh = {
    enable = true;

    plugins = [
      {
        name = "zsh-fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];
  };

  home.file = {
    ".zshrc".source = ./.zshrc;
  };

  imports = [
    ../starship
    ../lazygit
    ../neovim
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    nnn = {
      enable = true;
      plugins.src =
        (pkgs.fetchFromGitHub {
          owner = "jarun";
          repo = "nnn";
          rev = "v5.0";
          sha256 = "sha256-Hpc8YaJeAzJoEi7aJ6DntH2VLkoR6ToP6tPYn3llR7k=";
        })
        + "/plugins";
    };
  };

  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
