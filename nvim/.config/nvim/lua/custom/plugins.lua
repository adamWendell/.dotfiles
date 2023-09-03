return function(use)
    use({
        'rose-pine/neovim',
        as = 'rose-pine'
    })
        -- Terminal 
    use {"akinsho/toggleterm.nvim", tag = '*'}

    use({
        "folke/which-key.nvim",
          config = function()
            require("which-key").setup({})
          end
      })
      use("jose-elias-alvarez/null-ls.nvim")
      use("simrat39/rust-tools.nvim")
      use({
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
          require("crates").setup {
            null_ls = {
              enabled = true,
              name = "crates.nvim",
            },
            popup = {
              border = "rounded",
            },
          }
        end,
      })
end
