local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    print("Failed to load plugin 'telescope'")
    return
end

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files with Telescope", silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep with Telescope", silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers with Telescope", silent = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help tags with Telescope", silent = true })

local actions = require("telescope.actions")

telescope.setup {
    defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    },
}

