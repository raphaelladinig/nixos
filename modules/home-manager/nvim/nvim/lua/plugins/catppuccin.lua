return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		if vim.env.TERM == "xterm-kitty" then
			vim.api.nvim_create_autocmd({ "ColorScheme" }, {
				callback = function()
					local flavour = vim.g.colors_name

					if flavour:match("^catppuccin") then
						local socket_files = io.popen("ls /tmp/kitty-*")

						if socket_files == nil then
							print("No kitty sockets found")
							return
						end

						local cmd = "kitten @ --to unix:%s"
							.. " set-colors -a -c "
							.. vim.env.HOME
							.. "/.config/kitty/themes/"
							.. vim.g.colors_name
							.. ".conf"

						for socket_file in socket_files:lines() do
							vim.fn.system(cmd:format(socket_file))
						end

						socket_files:close()
					end
				end,
			})
		end

		local flavour_file = vim.fn.expand("$HOME") .. "/.flavour"

		vim.api.nvim_create_autocmd({ "ColorScheme" }, {
			callback = function()
				local flavour = vim.g.colors_name

				if flavour:match("^catppuccin") then
					local f, err = io.open(flavour_file, "w")
					if f then
						f:write(flavour)
						f:close()
					else
						print("Failed to open file: " .. err)
					end
				end
			end,
		})

		if vim.fn.filereadable(flavour_file) == 1 then
			local flavour = vim.fn.system("cat " .. flavour_file)

			if flavour ~= "" then
				vim.cmd("colorscheme " .. flavour)
			else
				vim.cmd("colorscheme catppuccin-mocha")
			end
		else
			vim.cmd("colorscheme default")
		end
	end,
}
