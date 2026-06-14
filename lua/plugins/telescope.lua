return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
        defaults = {
            border = true,
            layout_config = {
                prompt_position = "top",
            },
        },
        pickers = {
            find_files = {
                borderchars = {
                    prompt = { "─", "│", "─", "│", "┌", "┐", "└", "┘" },
                    results = { "─", "│", "─", "│", "┌", "┐", "└", "┘" },
                    preview = { "─", "│", "─", "│", "┌", "┐", "└", "┘" },
                },
            },
        },
    },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
        vim.keymap.set('n', '<leader>ft', builtin.tags, { desc = 'Telescope tags' })
    end
}
