return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local harpoon = require("harpoon")
        harpoon.setup()

        local function toggle_and_echo(callback)
            local status, err = pcall(callback)
            if status then
                vim.api.nvim_echo({{'Harpooned that sucker', 'Normal'}}, true, {})
            else
                vim.api.nvim_echo({{'Error executing command', 'ErrorMsg'}}, true, {})
            end
        end

        vim.keymap.set("n", "<leader>hp", function()
            toggle_and_echo(function()
                harpoon:list():append()
            end)
        end)

        vim.keymap.set("n", "<C-e>", function()
            toggle_and_echo(function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)
        end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
    end
}
