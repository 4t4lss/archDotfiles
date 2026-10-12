return{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")

        -- 1. Configuration for smoother tab-stops
        ls.config.set_config({
          history = true,
          updateevents = "TextChanged,TextChangedI",
        })

        -- 2. Define Keymaps to jump through your template fields
        -- Press Ctrl+K to move forward in placeholders, Ctrl+J to move backward
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
          if ls.expand_or_jumpable() then ls.expand_or_jump() end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-h>", function()
          if ls.jumpable(-1) then ls.jump(-1) end
        end, { silent = true })

        -- 3. Load our C++ Template
        require("plugins.snippets.cpp") -- This points to our snippet file we will create next
        -- Press Ctrl+E while your cursor is at the end of 'cpptemplate' to expand it
        vim.keymap.set({ "i", "s" }, "<C-e>", function()
          if ls.expandable() then
            ls.expand()
          end
        end, { silent = true })
    end
}
