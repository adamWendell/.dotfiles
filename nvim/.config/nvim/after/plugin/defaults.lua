-- Set colorscheme
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,
})
vim.o.termguicolors = true
vim.cmd [[colorscheme rose-pine]]

-- Toggle term
require("toggleterm").setup{
    open_mapping = [[<c-\>]],
    direction = 'float'
}

  -- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'rose-pine',
      component_separators = '|',
      section_separators = '',
    },
}

local wk = require("which-key")
wk.register(mappings, opts)

vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "rounded"
  }
)
-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 8

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to operating clipboard' })
vim.keymap.set('n', '<m-d>', 'ihello', { desc = 'yello' })

--Rust setups
-- Rust stuff if redownloading the init.lua file copy this over.
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- local codelldb_adapter = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = mason_path .. "bin/codelldb",
--     args = { "--port", "${port}" },
--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   },
-- }
-- pcall(function()
--   require("rust-tools").setup {
--     tools = {
--       executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
--       reload_workspace_from_cargo_toml = true,
--       runnables = {
--         use_telescope = true,
--       },
--       inlay_hints = {
--         auto = true,
--         only_current_line = false,
--         show_parameter_hints = false,
--         parameter_hints_prefix = "<-",
--         other_hints_prefix = "=>",
--         max_len_align = false,
--         max_len_align_padding = 1,
--         right_align = false,
--         right_align_padding = 7,
--         highlight = "Comment",
--       },
--       hover_actions = {
--         border = "rounded",
--       },
--       on_initialized = function()
--         vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
--           pattern = { "*.rs" },
--           callback = function()
--             local _, _ = pcall(vim.lsp.codelens.refresh)
--           end,
--         })
--       end,
--     },
--     dap = {
--       adapter = codelldb_adapter,
--     },
--     server = {
--       on_attach = function(client, bufnr)
--         on_attach(client, bufnr)
--         local rt = require "rust-tools"
--         vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
--       end,

--       capabilities = capabilities,
--       settings = {
--         ["rust-analyzer"] = {
--           lens = {
--             enable = true,
--           },
--           checkOnSave = {
--             enable = true,
--             command = "clippy",
--           },
--         },
--       },
--     },
--   }
-- end)

local wk = require("which-key")
wk.register({
  R = {
    name = "Rust",
    r = { "<cmd>RustRunnables<Cr>", "Runnables" },
    e = { "<cmd>RustOpenExternalDocs<Cr>", "External docs"},
    a = { ":RustRun ", "Rust run whit args"},
    t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
    m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
    c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
    p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
    d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
    v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
    R = {
      "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
      "Reload Workspace",
    },
    o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
    y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
    P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
    i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
    f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
    D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
  }
}, { prefix = "<leader>" })
