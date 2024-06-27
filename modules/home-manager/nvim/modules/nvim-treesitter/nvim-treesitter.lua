require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "vimdoc",
    "markdown",
    "markdown_inline",
    "cpp",
    "css",
    "html",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "gdscript",
    "python",
    "dart",
    "java",
    "latex",
    "bash",
    "json",
    "diff",
    "xml",
    "java",
    "nix",
  },
  auto_install = false,
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Leader>ss",
      node_incremental = "<Leader>si",
      scope_incremental = "<Leader>sc",
      node_decremental = "<Leader>sd",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
      },
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.outer"] = "V",
      },
      include_surrounding_whitespace = true,
    },
  },
})
require("nvim-ts-autotag").setup()
require("treesitter-context").setup({
  max_lines = 3,
})
