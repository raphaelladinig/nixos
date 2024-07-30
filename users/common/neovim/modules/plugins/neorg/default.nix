{ pkgs, ... }:

{
  imports = [
    ../nvim-cmp
    ../nvim-treesitter
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = neorg;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-norg
        p.tree-sitter-norg-meta
      ]))
    ];

    extraLuaPackages = luaPkgs: [
      luaPkgs.pathlib-nvim
      luaPkgs.lua-utils-nvim
    ];
  };
}
