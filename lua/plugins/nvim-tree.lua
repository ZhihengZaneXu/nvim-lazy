
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for file icons
    config = function()
      require("nvim-tree").setup({
        sort = {
                    sorter = "case_sensitive",
                },
        view = {
          width = 30, -- Width of the file explorer
          side = "left", -- Position of the file explorer
        },
        renderer = {
          highlight_git = true, -- Highlight Git status
          icons = {
            show = {
              file = true,
              folder = true,
              git = true,
            },
          },
        },
        git = {
          enable = true, -- Enable Git integration
        },
        filters = {
          dotfiles = false, -- Show hidden files
        },
        actions = {
          open_file = {
            quit_on_open = true, -- Close the tree when opening a file
          },
        },
      })
    end,
  },
}
