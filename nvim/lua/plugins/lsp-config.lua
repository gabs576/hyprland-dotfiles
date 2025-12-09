return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities =
          require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = {
          ".git",
          ".luarc.json",
          ".luarc.jsonc",
          ".luacheckrc",
          ".stylua.toml",
          "stylua.toml",
          "selene.toml",
          "selene.yml",
        },
      })
      vim.lsp.config("gopls", {
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.mod", "go.work", ".git" },
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", "rust-project.json", ".git" },
        settings = {
          ["rust-analyzer"] = {},
        },
      })

      vim.lsp.config("pylsp", {
        capabilities = capabilities,
        cmd = { "pylsp" },
        filetypes = { "python" },
        root_markers = {
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          ".git",
        },
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("pylsp")

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
