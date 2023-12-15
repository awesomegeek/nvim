return {
    { import = "lazyvim.plugins.extras.coding.copilot" },
    {

        "zbirenbaum/copilot.lua",
        opts = {
            suggestion = { enabled = true },
            panel = { enabled = true },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
        {
            "zbirenbaum/copilot-cmp",
            config = function ()
                require("copilot_cmp").setup()
            end
        },
    }
}