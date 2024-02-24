return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function ()
        local context = require("treesitter-context")
        context.setup()
    end
}
