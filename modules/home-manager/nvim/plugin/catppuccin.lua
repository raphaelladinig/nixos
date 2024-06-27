    vim.cmd.colorscheme("catppuccin-mocha");

    if vim.env.TERM == "xterm-kitty" then
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        callback = function()
          local flavour = vim.g.colors_name

          if flavour:match("^catppuccin") then
            local cmd = "kitten @ --to %s"
              .. " set-colors -c "
              .. vim.env.HOME
              .. "/.config/kitty/themes/"
              .. flavour
              .. ".conf"

            vim.fn.system(cmd:format(vim.fn.expand("$KITTY_LISTEN_ON")))
          end
        end,
      })
    end
