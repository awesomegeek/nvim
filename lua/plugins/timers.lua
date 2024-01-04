return {
    {
        "linguini1/pulse.nvim",
        version = "*", -- Latest stable release
        config = function() require("pulse").setup() end -- Call setup to get the basic config
    }
}