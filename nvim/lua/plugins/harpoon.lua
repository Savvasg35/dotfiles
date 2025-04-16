return {
  -- luacheck: ignore
  -- Fast file navigation (Uses SPC a)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({
        settings = {
          save_on_toggle = true, -- Save state on window toggle
        },
      })

      -- Append to Harpoon List
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      -- Go to Previous Harpoon File
      vim.keymap.set("n", "<leader>[", function()
        harpoon:list():prev({ ui_nav_wrap = true })
      end)
      -- Go to Next Harpoon File
      vim.keymap.set("n", "<leader>]", function()
        harpoon:list():next({ ui_nav_wrap = true })
      end)
      -- Clear harpoon List
      vim.keymap.set("n", "<leader>ac", function()
        harpoon:list():clear()
      end)
    end,
  },
}
