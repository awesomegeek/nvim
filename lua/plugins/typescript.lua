return {
    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    { import = "lazyvim.plugins.extras.lang.typescript" },

    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
}